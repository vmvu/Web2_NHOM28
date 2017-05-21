using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopWeb.Areas.Administrator.Models;

namespace ShopWeb.Areas.Administrator.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: Administrator/SanPham
        public ActionResult Index()
        {
            List<SanPham> spList = null;
            using (var data = new WineShopEntities())
            {
                spList = data.SanPham.ToList<SanPham>();
            }
            return View(spList);
        }
    }
}