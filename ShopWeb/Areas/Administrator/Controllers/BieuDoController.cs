using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using WebShop.Areas.Administrator.Models;
namespace WebShop.Areas.Administrator.Controllers
{
    public class BieuDoController : Controller
    {
        // GET: Administrator/BieuDo
        public ActionResult Index()
        {
            Session["a"] = "BieuDo";
            WineShopEntities db = new WineShopEntities();
            var sp = db.SanPhams.Where(s => s.BiXoa == 0).OrderByDescending(s => s.SoLuocXem).Select(s => s).Take(5).ToArray<SanPham>();
            
            var cachedChart = new Chart( Int16.Parse( Unit.Pixel(1200).Value.ToString()), 
                                            Int16.Parse(Unit.Pixel(800).Value.ToString()), 
                                            ChartTheme.Blue);
           
            cachedChart.AddTitle("Biểu đồ lược xem lưu tại: " + DateTime.Now);
            cachedChart.AddSeries(
                name: "Lược xem",
                axisLabel: "Sản phẩm",
                xValue: sp, xField: "TenSanPham",
                yValues: sp, yFields: "SoLuocXem");
        
            cachedChart.Save(path: "~/Images/Logo/chart01.png");
            var spTheoLuongBan = db.SanPhams.Where(s => s.BiXoa == 0).OrderByDescending(s => s.SoLuongBan).Select(s => s).Take(5).ToArray<SanPham>();
            cachedChart.AddSeries(
                name: "Lược bán",
                axisLabel: "Sản phẩm",
                xValue: spTheoLuongBan, xField: "TenSanPham",
                yValues: spTheoLuongBan, yFields: "SoLuongBan");
            cachedChart.Save(path: "~/Images/Logo/chart02.png");
            return View();
        }
    }
}