using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeHelper.Models
{
    public class InstructorModel
    {
        public int sr { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public long mobile { get; set; }
        public string gender { get; set; }
        public HttpPostedFileBase ipic { get; set; }
        public string summary { get; set; }
        public string about { get; set; }
        public string Btech { get; set; }
        public string Mtech { get; set; }
        public string BCA { get; set; }
        public string MCA { get; set; }
        public string Phd { get; set; }
    }
}