using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeHelper.Models
{
    public class StudentModel
    {
       
        public string sname { get; set; }
        public string semail { get; set; }
        public string gender { get; set; }
        public string title { get; set; }
        public long mobile { get; set; }
        public string college { get; set; }
        public int course { get; set; }
        public int ffee { get; set; }
        public string year { get; set; }
        public HttpPostedFileBase profile { get; set; }
        public string password { get; set; }
        public DateTime duration { get; set; }
        public string email { get; set; }
        public string finalfee { get; set; }
        public DateTime expiry_date { get; set; }
    }
}