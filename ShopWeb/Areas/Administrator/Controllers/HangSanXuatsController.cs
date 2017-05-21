using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopWeb.Areas.Administrator.Models;

namespace ShopWeb.Areas.Administrator.Controllers
{
    public class HangSanXuatsController : Controller
    {
        private WineShopEntities db = new WineShopEntities();

        // GET: Administrator/HangSanXuats
        public ActionResult Index()
        {
            return View(db.HangSanXuat.ToList());
        }

        // GET: Administrator/HangSanXuats/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangSanXuat hangSanXuat = db.HangSanXuat.Find(id);
            if (hangSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(hangSanXuat);
        }

        // GET: Administrator/HangSanXuats/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Administrator/HangSanXuats/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHangSanXuat,TenHangSanXuat,LogoURL,BiXoa")] HangSanXuat hangSanXuat)
        {
            if (ModelState.IsValid)
            {
                db.HangSanXuat.Add(hangSanXuat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hangSanXuat);
        }

        // GET: Administrator/HangSanXuats/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangSanXuat hangSanXuat = db.HangSanXuat.Find(id);
            if (hangSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(hangSanXuat);
        }

        // POST: Administrator/HangSanXuats/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHangSanXuat,TenHangSanXuat,LogoURL,BiXoa")] HangSanXuat hangSanXuat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hangSanXuat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hangSanXuat);
        }

        // GET: Administrator/HangSanXuats/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangSanXuat hangSanXuat = db.HangSanXuat.Find(id);
            if (hangSanXuat == null)
            {
                return HttpNotFound();
            }
            return View(hangSanXuat);
        }

        // POST: Administrator/HangSanXuats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HangSanXuat hangSanXuat = db.HangSanXuat.Find(id);
            db.HangSanXuat.Remove(hangSanXuat);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
