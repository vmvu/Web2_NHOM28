using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebShop.Areas.Administrator.Models;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System.Globalization;
using System.Security.Cryptography;
using WebShop.Models;

namespace WebShop.Areas.Administrator.Controllers
{
    public class DoiMatKhauController : Controller
    {
        WineShopEntities db = new WineShopEntities();
        // GET: Administrator/DoiMatKhau
        public ActionResult Index()
        {

            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (model.NewPassword.Equals(model.ConfirmPassword))
            {
                // các xác định session hay 1 Identify.User() để lấy đc tên Id của khách hàng
                // biến temp
                string user_id = "68ae5981-6947-4935-9344-a6e9a7548ffd"; 
                var admin = db.AspNetUsers.Where(h => h.Id.Equals(user_id)).Single();

                bool hash = VerifyHashedPassword(admin.PasswordHash, model.OldPassword);

                if (hash)
                {
                    admin.PasswordHash = HashPassword(model.NewPassword);
                    db.SaveChanges();
                    // đổi mật khẩu thành công
                    // cần thêm return thoát khỏi admin và trờ về trang bán hàng
                }
            }
            
            return View(model);
        }

        public static string HashPassword(string password)
        {
            byte[] salt;
            byte[] buffer2;
            if (password == null)
            {
                throw new ArgumentNullException("password");
            }
            using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, 0x10, 0x3e8))
            {
                salt = bytes.Salt;
                buffer2 = bytes.GetBytes(0x20);
            }
            byte[] dst = new byte[0x31];
            Buffer.BlockCopy(salt, 0, dst, 1, 0x10);
            Buffer.BlockCopy(buffer2, 0, dst, 0x11, 0x20);
            return Convert.ToBase64String(dst);
        }
        public static bool VerifyHashedPassword(string hashedPassword, string password)
        {
            byte[] buffer4;
            if (hashedPassword == null)
            {
                return false;
            }
            if (password == null)
            {
                throw new ArgumentNullException("password");
            }
            byte[] src = Convert.FromBase64String(hashedPassword);
            if ((src.Length != 0x31) || (src[0] != 0))
            {
                return false;
            }
            byte[] dst = new byte[0x10];
            Buffer.BlockCopy(src, 1, dst, 0, 0x10);
            byte[] buffer3 = new byte[0x20];
            Buffer.BlockCopy(src, 0x11, buffer3, 0, 0x20);
            using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, dst, 0x3e8))
            {
                buffer4 = bytes.GetBytes(0x20);
            }
            //return ByteArraysEqual(buffer3, buffer4);
            return buffer3.SequenceEqual(buffer4);
        }

    }
}