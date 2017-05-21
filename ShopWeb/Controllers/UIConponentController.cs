using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopWeb.Controllers
{
    public class UIConponentController : Controller
    {
        // GET: UIConponent
        [ChildActionOnly]
        public PartialViewResult TopHeader()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult Menu()
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
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult LoockBoock()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult BlockTrending()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult BlockCollections()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult BlockTestimonials()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult BlockBlog()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult BlockLogo()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public PartialViewResult Footer()
        {
            return PartialView();
        }

    }
}