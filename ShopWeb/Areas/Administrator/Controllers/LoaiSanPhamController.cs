using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Areas.Administrator.Models;
using PagedList;
using System.Net;

namespace WebShop.Areas.Administrator.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        // GET: Administrator/LoaiSanPham
        WineShopEntities db = new WineShopEntities();
        public ActionResult Index(string sortOrder, string currentFilter, string TimLoaiSanPham, int? page)
        {
            Session["a"] = "LoaiSanPham";
            ViewBag.CurrentFilter = sortOrder;
            ViewBag.TenLoaiSanPhams = string.IsNullOrEmpty(sortOrder) ? "ten" : "ten_desc";

            var listLoaiSanPham = db.LoaiSanPhams.Where(l => l.BiXoa == 0);

            if (sortOrder != null && sortOrder.Equals("ten_desc"))
            {
                listLoaiSanPham = listLoaiSanPham.OrderByDescending(l => l.TenLoaiSanPham);
            }
            else
            {
                listLoaiSanPham = listLoaiSanPham.OrderBy(l => l.TenLoaiSanPham);
            }

            if (!string.IsNullOrEmpty(TimLoaiSanPham))
            {
                page = 1;
            }
            else
            {
                TimLoaiSanPham = currentFilter;
            }

            ViewBag.CurrentFilter = TimLoaiSanPham;

            if (!string.IsNullOrEmpty(TimLoaiSanPham))
            {
                listLoaiSanPham = listLoaiSanPham.Where(l => l.TenLoaiSanPham.Contains(TimLoaiSanPham.Trim()));
            }


            int pageSize = 5;
            int pageNumber = (page ?? 1);


            return View(listLoaiSanPham.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ChiTiet(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var lsp = db.LoaiSanPhams.Single(l => l.MaLoaiSanPham == id && l.BiXoa == 0);
            return View(lsp);
        }

        public ActionResult CapNhat(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var lsp = db.LoaiSanPhams.Single(l => l.MaLoaiSanPham == id && l.BiXoa == 0);
            return View(lsp);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat([Bind(Include = "MaLoaiSanPham, TenLoaiSanPham")]LoaiSanPham lsp)
        {
            if (ModelState.IsValid)
            {
                db.LoaiSanPhams.Single(l => l.MaLoaiSanPham == lsp.MaLoaiSanPham && l.BiXoa == 0).TenLoaiSanPham = lsp.TenLoaiSanPham;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lsp);
        }

        public ActionResult ThemMoi()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi([Bind(Include = "TenLoaiSanPham")]LoaiSanPham lsp)
        {
            if (ModelState.IsValid)
            {
                lsp.BiXoa = 0;
                db.LoaiSanPhams.Add(lsp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lsp);
        }

        public ActionResult Xoa(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var lsp = db.LoaiSanPhams.Single(l => l.MaLoaiSanPham == id && l.BiXoa == 0);
            var count = lsp.SanPhams.Count;
            if (count == 0)
            {
                db.LoaiSanPhams.Remove(lsp);
            }
            else
            {
                lsp.BiXoa = 1;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}