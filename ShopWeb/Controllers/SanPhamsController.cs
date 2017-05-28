using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopWeb.Models;

namespace ShopWeb.Controllers
{
    public class SanPhamsController : Controller
    {
        ShopRuouDBEntities db = new ShopRuouDBEntities();

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
            return View("ChiTiets", lst);
        }

        [HttpPost]
        public ActionResult TimKiemSP(string txtTimkiem, int? MaLoaiSanPham, int? MaHangSanXuat, int? txtGia1, int? txtGia2)
        {
            Session["a"] = "TimKiem";
            ViewBag.TieuDe = "Sản Phẩm Tìm Được";
            var sp = db.SanPhams.Where(s => s.BiXoa == 0);
            if (txtTimkiem != null)
            {
                sp = sp.Where(s => s.TenSanPham.Contains(txtTimkiem));
            }
            if (MaLoaiSanPham != null)
            {
                sp = sp.Where(s => s.MaLoaiSanPham == MaLoaiSanPham.Value);
            }
            if (MaHangSanXuat != null)
            {
                sp = sp.Where(s => s.MaHangSanXuat == MaHangSanXuat.Value);
            }

            if (txtGia1 != null && txtGia1.Value >= 0)
            {
                sp = sp.Where(s => s.GiaSanPham >= txtGia1.Value);
            }
            if (txtGia2 != null && txtGia2.Value >= 0)
            {
                sp = sp.Where(s => s.GiaSanPham <= txtGia2.Value);
            }
            return View("DanhSachSanPham", sp);
        }


    }
}
