using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CodeHelper.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        public ActionResult AdminLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AdminLogin(string userid, string password)
        {
            if (userid == "Nilesh" && password == "8766")
            {
                FormsAuthentication.SetAuthCookie("Nilesh", false);
                return Content("<script>alert('Admin Login successfully');location.href='/admin/dashboard'</script>");
            }
            else
            {
                return Content("<script>alert('Please Enter valid userid password');location.href='/default/AdminLogin'</script>");
            }
        }
    }
}