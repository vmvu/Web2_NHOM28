using ShopWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopWeb.Controllers
{
    public class ModulesController : Controller
    {
        ShopRuouDBEntities db = new ShopRuouDBEntities();

        // GET: Modules
        [ChildActionOnly]
        public PartialViewResult Search()
        {
            var result = db.LoaiSanPhams.ToList();
            ViewBag.LSPs = new SelectList(result, "MaLoaiSanPham", "TenLoaiSanPham");

            var result2 = db.HangSanXuats.ToList();
            ViewBag.HSXs = new SelectList(result2, "MaHangSanXuat", "TenHangSanXuat");

            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult TopHeader()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult HomeSlideder()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult TopBanner()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult TabProduct()
        {
            List<SanPham> lstSanPham = db.SanPhams.Where(s => s.BiXoa == 0).OrderByDescending(s => s.SoLuongBan).Take(4).ToList<SanPham>();
            ViewBag.TenTab1 = "Xem nhiều";
            ViewBag.TenTab2 = "Bán Chạy Nhất";
            ViewBag.TenTab3 = "Hàng Mới";
            return PartialView("TabProduct", lstSanPham);
        }

        [ChildActionOnly]
        public PartialViewResult BlockTrending()
        {
            List<SanPham> lstSanPham = db.SanPhams.Where(s => s.BiXoa == 0).OrderByDescending(s => s.SoLuongBan).Take(4).ToList<SanPham>();
            ViewBag.Ten = "Sản Phẩm Mua Nhiều Nhất";
            return PartialView("BlockTrending", lstSanPham);
        }

        [ChildActionOnly]
        public PartialViewResult BlockLogo()
        {
            List<SanPham> lstSanPham = db.SanPhams.Where(s => s.BiXoa == 0).OrderByDescending(s => s.SoLuongBan).ToList<SanPham>();
            ViewBag.Ten = "Sản Phẩm Mua Nhiều Nhất";
            return PartialView("BlockLogo", lstSanPham);
        }

        [ChildActionOnly]
        public PartialViewResult Footer()
        {
            return PartialView();
        }

        //San pham

        [ChildActionOnly]
        public ActionResult MenuLoai()
        {
            List<LoaiSanPham> lst = db.LoaiSanPhams.ToList<LoaiSanPham>();
            return PartialView(lst);
        }

        [ChildActionOnly]
        public ActionResult MenuHang()
        {
            List<HangSanXuat> lst = db.HangSanXuats.ToList<HangSanXuat>();
            return PartialView(lst);
        }


        public ActionResult HienThiSanPhamTheoLoai(int id)
        {
            Session["a"] = "TheoLoai";
            List<SanPham> lst = db.SanPhams.Where(s => s.BiXoa == 0 && s.MaLoaiSanPham == id).ToList<SanPham>();
            LoaiSanPham loai = db.LoaiSanPhams.Single(l => l.MaLoaiSanPham == id);
            ViewBag.TieuDe = "Danh sách sản phẩm theo Loại " + loai.TenLoaiSanPham;
            return View("DanhSachSanPham", lst);
        }

        public ActionResult HienThiSanPhamTheoHang(int id)
        {
            Session["a"] = "TheoHang";
            List<SanPham> lst = db.SanPhams.Where(s => s.BiXoa == 0 && s.MaHangSanXuat == id).ToList<SanPham>();
            HangSanXuat hang = db.HangSanXuats.Single(l => l.MaHangSanXuat == id);
            ViewBag.TieuDe = "Danh sách sản phẩm theo Hãng " + hang.TenHangSanXuat;
            return View("DanhSachSanPham", lst);
        }

        public ActionResult HienThiChiTietSanPham(int id)
        {
            Session["a"] = "TheoHang";

            List<SanPham> lst = db.SanPhams.Where(s => s.BiXoa == 0 && s.MaSanPham == id).ToList<SanPham>();
            SanPham hang = db.SanPhams.Single(l => l.MaSanPham == id);
            return View("ChiTiet", lst);
        }

        [HttpPost]
        public ActionResult TimKiemSP(string txtTimkiem, int? MaLoaiSanPham, int? MaHangSanXuat, int? txtGia1, int? txtGia2)
        {
            Session["a"] = "TimKiem";
            ViewBag.TieuDe = "Sản Phẩm Tìm Được";
            var sp = db.SanPhams.Where(s => s.BiXoa == 0);
            if(txtTimkiem != null)
            {
                sp = sp.Where(s => s.TenSanPham.Contains(txtTimkiem));
            }
            if(MaLoaiSanPham != null)
            {
                sp = sp.Where(s => s.MaLoaiSanPham == MaLoaiSanPham.Value);
            }
            if(MaHangSanXuat != null)
            {
                sp = sp.Where(s => s.MaHangSanXuat == MaHangSanXuat.Value);
            }
            
            if(txtGia1 != null && txtGia1.Value >= 0)
            {
                sp = sp.Where(s => s.GiaSanPham >= txtGia1.Value);
            }
            if(txtGia2 != null && txtGia2.Value >= 0)
            {
                sp = sp.Where(s => s.GiaSanPham <= txtGia2.Value);
            }
            return View("DanhSachSanPham",sp);
        }


        [HttpPost]
        public void Nhap(string temp)
        {
            int n = 5;
        }

    }
}