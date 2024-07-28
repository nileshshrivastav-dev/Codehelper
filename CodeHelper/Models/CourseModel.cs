using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeHelper.Models
{
    public class CourseModel
    {
        public int csr { get; set; }
        public string title { get; set; }
        public HttpPostedFileBase thumb { get; set; }
        public string category { get; set; }
        public int instructor { get; set; }
        public int fee { get; set; }
        public int ffee { get; set; }
        [AllowHtml]
        public string details { get; set; }
        public DateTime duration { get; set; }
        public string email { get; set; }
        public int course { get; set; }
        public int discountamt { get; set; }
        public DateTime discountdate { get; set; }

    }
}