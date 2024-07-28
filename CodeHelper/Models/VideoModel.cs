using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeHelper.Models
{
    public class VideoModel
    {
        public string videoTitle { get; set; }
        public int course { get; set; }
        public string videolink { get; set; }
        [AllowHtml]
        public string videodetails { get; set; }
        public int duration { get; set; }
        public int vsr { get; set; }
        public string chapter { get; set; }
        public bool ispaid { get; set; }
        public bool status { get; set; }
        public string title { get; set; }
    }
}