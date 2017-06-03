using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebShop.Areas.Administrator.Models;
using PagedList;
using System.Net;
using System.Data.Entity;

namespace WebShop.Areas.Administrator.Controllers
{
    public class KhachHangController : Controller
    {
        WineShopEntities db = new WineShopEntities();
        // GET: Administrator/KhachHang
        public ActionResult Index(string sortOrder, string currentFilter, string TimKhachHang, int? page)
        {
            Session["a"] = "KhachHang";
            ViewBag.CurrentFilter = sortOrder;
            ViewBag.TenKhachHangs = string.IsNullOrEmpty(sortOrder) ? "khachhang" : "khachhang_desc";

            var kh = db.AspNetUsers.Where(h => h.LockoutEnabled == false);

            if (sortOrder != null && sortOrder.Equals("khachhang_desc"))
            {
                kh = kh.OrderByDescending(h => h.UserName);
            }
            else
            {
                kh = kh.OrderBy(h => h.UserName);
            }
            if (TimKhachHang != null)
            {
                page = 1;
            }
            else
            {
                TimKhachHang = currentFilter;
            }

            ViewBag.CurrentFilter = TimKhachHang;
            if (TimKhachHang != null)
            {
                kh = kh.Where(h => h.UserName.Contains(TimKhachHang.Trim()));
            }

            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(kh.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult PhanQuyen(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var kh = db.AspNetUsers.Single(u => u.Id.Equals(id));

            var role = db.AspNetRoles.ToList();
            List<AspNetRole> quyens = new List<AspNetRole>();
            foreach(var r in role)
            {
                if (!kh.AspNetRoles.Contains(r))
                {
                    quyens.Add(r);
                }
            }
            if(quyens.Count == 0)
            {
                return RedirectToAction("Index");
            }
            
            ViewBag.Quyens = new SelectList(quyens, "Id", "Name");
            return View();
        }
        [HttpPost]
        public ActionResult PhanQuyen([Bind(Include = "Id")]AspNetUser user, string RoleID)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }

           

            // có thể không cần truy vấn 2 dòng dưới
            
            var kh = db.AspNetUsers.Single(u => u.Id.Equals(user.Id));
            var tempRole = new AspNetRole
            {
                Id = RoleID
            };
            bool exists = kh.AspNetRoles.Contains(tempRole);
            if (exists)
            {
                return View(user);
            }
            // New class vừa tạo
            AspNetUserRoles a = new AspNetUserRoles();
            //kh.ID có thể truyền trực tiếp bằng mã/id không cần load từ Db Lên
            var khachhang = a.Users.Find(user.Id); //<<== Chỗ này
            var quyen = a.Roles.Find(RoleID);//<<== Chỗ này
            khachhang.AspNetRoles.Add(quyen);
            //class vừa tạo SaveChanges()
            if (a.SaveChanges() > 0)
            {
                return RedirectToAction("Index");
            }
            else
            {
                List<AspNetRole> listQuyen = db.AspNetRoles.ToList<AspNetRole>();
                ViewBag.Quyens = new SelectList(listQuyen, "Id", "Name");
                return View(user);
            }


        }
        public ActionResult HuyPhanQuyen(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var kh = db.AspNetUsers.Single(u => u.Id.Equals(id));
            List<AspNetRole> quyen = kh.AspNetRoles.ToList<AspNetRole>();
            ViewBag.Quyens = new SelectList(quyen, "Id", "Name");
            return View();
        }
        [HttpPost]
        public ActionResult HuyPhanQuyen([Bind(Include = "Id")]AspNetUser user, string RoleID)
        {
           
            if (!ModelState.IsValid)
            {
                return View(user);
            }

            var kh = db.AspNetUsers.Single(u => u.Id.Equals(user.Id));
            
            // nếu 1 khách hàng chỉ còn 1 quyên thì không được xóa quyền nữa
            if (kh.AspNetRoles.Count == 1)
            {
                return RedirectToAction("Index");
            }
            AspNetUserRoles a = new AspNetUserRoles();
            var khachhang = a.Users.Find(user.Id);
            var quyen = a.Roles.Find(RoleID);
            khachhang.AspNetRoles.Remove(quyen);
            if (a.SaveChanges() > 0)
            {
                return RedirectToAction("Index");
            }
            else
            {
                List<AspNetRole> listQuyen = kh.AspNetRoles.ToList<AspNetRole>();
                ViewBag.Quyens = new SelectList(listQuyen, "Id", "Name");
                return View(user);
            }
        }

        [HttpPost]
        public ActionResult Xoa([Bind(Include = "Id")]AspNetUser user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }
            var kh = db.AspNetUsers.Single<AspNetUser>(h => h.Id == user.Id);
            
            int donDatHangCount = kh.DonDatHangs.Count;
            int quyenCount = kh.AspNetRoles.Count;
            if(donDatHangCount == 0 && quyenCount == 1 )
            {
                // do trong chỉ có 1 row trong bảng mối quan hệ nhiều - nhiều
                // nên có thể lấy bằng lệnh Single
                // mục đích lấy đc Id  mà ApsNetRole
                var xoaQuyen = kh.AspNetRoles.Single();
                
                AspNetUserRoles a = new AspNetUserRoles();
                //tìm trong bảng phụ khách hàng
                var _khachhang = a.Users.Find(kh.Id);
                // tìm 1 quyền duy nhất của khách hàng
                var _quyen = a.Roles.Find(xoaQuyen.Id);
                // xóa khách hàng ra khỏi bảng phụ
                _quyen.AspNetUsers.Remove(_khachhang);
                // save lại bảng phụ
                a.SaveChanges();
                // lúc này khách hàng đã hết Role nên có thể xóa.
                db.AspNetUsers.Remove(kh);
            }else
            {
                // nếu khách hàng có đơn hàng -> xóa ẩn
                kh.LockoutEnabled = true;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}