using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeHelper.Models
{
    public class feedbackModel
    {
        public int id { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string subject { get; set; }
        public string comment { get; set; }
    }
}