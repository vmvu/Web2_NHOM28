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
            Session["a"] = "TrangChu";
            return View();
        }

        public ActionResult HienThiThongTin()
        {
            Session["a"] = "ThongTin";
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult HienThiLienHe()
        {
            Session["a"] = "LienHe";

            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}