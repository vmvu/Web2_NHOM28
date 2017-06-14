using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WineShop.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Session["BiKhoa"] = null;
            string MaTK = null;
            MaTK = User.Identity.GetUserId();
            if (MaTK != null)
            {
                Session["DangNhap"] = "1";
            }
            return View();
        }

        public ActionResult HienThiThongTin()
        {
            return View();
        }

        public ActionResult HienThiLienHe()
        {
            return View();
        }
    }
}