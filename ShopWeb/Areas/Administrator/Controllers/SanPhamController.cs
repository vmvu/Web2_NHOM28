using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Areas.Administrator.Models;
using PagedList;
using System.IO;
using System.Text.RegularExpressions;
using System.Net;

namespace WebShop.Areas.Administrator.Controllers
{

    public class SanPhamController : Controller
    {
        WineShopEntities db = new WineShopEntities();
        // GET: Administrator/SanPham
        public ActionResult Index(string sortOrder, string currentFilter, string TimSanPham, int? page)
        {
            ViewBag.CurrentFilter = sortOrder;
            Session["a"] = "SanPham";
            ViewBag.TenSanPhams = string.IsNullOrEmpty(sortOrder) ? "sanpham_desc" : "";
            ViewBag.SoLuocXems = sortOrder == "luocxem" ? "luocxem" : "luocxem_desc";
            ViewBag.SoLuongBans = sortOrder == "luongban_desc" ? "luongban_desc" : "luongban";

            var spList = db.SanPhams.Where(s =>  s.BiXoa.Value == 0);

            switch (sortOrder)
            {
                case "luocxem_desc":
                    spList = spList.OrderByDescending(s => s.SoLuocXem);
                    break;
                case "luocxem":
                    spList = spList.OrderBy(s => s.SoLuocXem);
                    break;
                case "luongban_desc":
                    spList = spList.OrderByDescending(s => s.SoLuongBan);
                    break;
                case "luongban":
                    spList = spList.OrderBy(s => s.SoLuongBan);
                    break;
                case "sanpham_desc":
                    spList = spList.OrderByDescending(s => s.TenSanPham);
                    break;
                default:
                    spList = spList.OrderBy(s => s.TenSanPham);
                    break;
            }

            if (TimSanPham != null)
            {
                page = 1;
            }
            else
            {
                TimSanPham = currentFilter;
            }

            ViewBag.CurrentFilter = TimSanPham;

            if (!string.IsNullOrEmpty(TimSanPham))
            {

                spList = spList.Where(s => s.TenSanPham.Contains(TimSanPham.Trim()));
            }

            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(spList.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ChiTiet(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var sp = db.SanPhams.Where(s => s.MaSanPham == id && s.BiXoa == 0).First<SanPham>();
            return View(sp);
        }

        public ActionResult ThemMoi()
        {
            List<LoaiSanPham> listLoaiSanPham = db.LoaiSanPhams.ToList<LoaiSanPham>();
            List<HangSanXuat> listHangSanXuat = db.HangSanXuats.ToList<HangSanXuat>();
            ViewBag.LoaiSanPhams = new SelectList(listLoaiSanPham, "MaLoaiSanPham", "TenLoaiSanPham");
            ViewBag.HangSanXuats = new SelectList(listHangSanXuat, "MaHangSanXuat", "TenHangSanXuat");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi([Bind(Include = "MaSanPham, TenSanPham, GiaSanPham, NgayNhap, MoTa,SoLuongTon, MaLoaiSanPham, MaHangSanXuat, Hinh")] SanPham sanpham, IEnumerable<HttpPostedFileBase> upload)
        {

            if (ModelState.IsValid)
            {
                if (upload != null)
                {

                    sanpham.HinhAnhs = new List<WebShop.Areas.Administrator.Models.HinhAnh>();
                    foreach (var file in upload)
                    {
                        if (file != null && file.ContentLength > 0)
                        {

                            string timeUTC = DateTime.Now.ToFileTimeUtc().ToString();
                            var hinh = new WebShop.Areas.Administrator.Models.HinhAnh
                            {
                                TenHinh = timeUTC + Path.GetFileName(file.FileName),
                                BiXoa = false
                            };
                            file.SaveAs(Path.Combine(Server.MapPath("~/Images/"), hinh.TenHinh));
                            sanpham.HinhAnhs.Add(hinh);
                        }
                    }
                }
                sanpham.SoLuongBan = 0;
                sanpham.SoLuocXem = 0;

                sanpham.BiXoa = 0;
                db.SanPhams.Add(sanpham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            List<LoaiSanPham> listLoaiSanPham = db.LoaiSanPhams.ToList<LoaiSanPham>();
            List<HangSanXuat> listHangSanXuat = db.HangSanXuats.ToList<HangSanXuat>();
            ViewBag.LoaiSanPhams = new SelectList(listLoaiSanPham, "MaLoaiSanPham", "TenLoaiSanPham");
            ViewBag.HangSanXuats = new SelectList(listHangSanXuat, "MaHangSanXuat", "TenHangSanXuat");

            return View(sanpham);
        }

        public ActionResult Xoa(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            SanPham sp = db.SanPhams.Where(s => s.MaSanPham == id).First<SanPham>();
            int chiTietDonDatHangCount = sp.ChiTietDonDatHangs.Count;
            int hinhAnhCount = sp.HinhAnhs.Count;
            if(chiTietDonDatHangCount == 0 && hinhAnhCount == 0)
            {
                db.SanPhams.Remove(sp);
            }else
            {
                sp.BiXoa = 1;
            }
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        public ActionResult CapNhat(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sp = db.SanPhams.Single(s => s.MaSanPham == id);


            List<LoaiSanPham> listLoaiSanPham = db.LoaiSanPhams.ToList<LoaiSanPham>();
            List<HangSanXuat> listHangSanXuat = db.HangSanXuats.ToList<HangSanXuat>();
            ViewBag.LoaiSanPhams = new SelectList(listLoaiSanPham, "MaLoaiSanPham", "TenLoaiSanPham");
            ViewBag.HangSanXuats = new SelectList(listHangSanXuat, "MaHangSanXuat", "TenHangSanXuat");

            return View(sp);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat([Bind(Include = "MaSanPham, TenSanPham, GiaSanPham, NgayNhap, SoLuongTon, MoTa, MaLoaiSanPham, MaHangSanXuat")] SanPham sanpham, IEnumerable<HttpPostedFileBase> upload, IEnumerable<String> GiaTri)
        {
            if (ModelState.IsValid)
            {
                SanPham sp = db.SanPhams.Single<SanPham>(s => s.MaSanPham == sanpham.MaSanPham );
                sp.TenSanPham = sanpham.TenSanPham;
                sp.MoTa = sanpham.MoTa;
                sp.NgayNhap = sanpham.NgayNhap;
                sp.SoLuongTon = sanpham.SoLuongTon;
                sp.GiaSanPham = sanpham.GiaSanPham;
                sp.MaLoaiSanPham = sanpham.MaLoaiSanPham;
                sp.MaHangSanXuat = sanpham.MaHangSanXuat;
                if(GiaTri != null)
                {
                    var listHinhAnh = sp.HinhAnhs;
                    foreach (var r in GiaTri)
                    {
                        int maHinh = Int16.Parse(r);
                        HinhAnh ha = listHinhAnh.Single(h => h.Ma == maHinh);

                        string hinhCu = Request.MapPath("~/Images/" + ha.TenHinh);
                        if (System.IO.File.Exists(hinhCu))
                        {
                            System.IO.File.Delete(hinhCu);
                        }
                        ha.BiXoa = true;
                    }
                }
                

                var hinhanh = new List<HinhAnh>();

                foreach (var file in upload)
                {
                    if (file != null && file.ContentLength > 0)
                    {

                        string extension = Path.GetFileNameWithoutExtension(file.FileName);
                        string timeUTC = DateTime.Now.ToFileTimeUtc().ToString();
                        string a = file.FileName.Replace(extension, timeUTC);

                        String logoPath = Path.GetFileName(a);
                        var hinh = new WebShop.Areas.Administrator.Models.HinhAnh
                        {
                            TenHinh = logoPath,
                            BiXoa = false
                        };
                        file.SaveAs(Path.Combine(Server.MapPath("~/Images/"), hinh.TenHinh));
                        hinhanh.Add(hinh);
                    }
                }
                if (hinhanh.Count > 0)
                {
                    foreach(var r in hinhanh)
                    {
                        sp.HinhAnhs.Add(r);
                    }
                }

                int n=  db.SaveChanges();

                return RedirectToAction("Index");
            }
            List<LoaiSanPham> listLoaiSanPham = db.LoaiSanPhams.ToList<LoaiSanPham>();
            List<HangSanXuat> listHangSanXuat = db.HangSanXuats.ToList<HangSanXuat>();
            ViewBag.LoaiSanPhams = new SelectList(listLoaiSanPham, "MaLoaiSanPham", "TenLoaiSanPham");
            ViewBag.HangSanXuats = new SelectList(listHangSanXuat, "MaHangSanXuat", "TenHangSanXuat");
            return View(sanpham);
        }

    }

}
