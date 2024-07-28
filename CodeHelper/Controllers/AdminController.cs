using CodeHelper.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;

namespace CodeHelper.Controllers
{
    [Authorize (Roles="Admin")]
    public class AdminController : Controller
    {

        DBLayer db = new DBLayer();
        // GET: Admin
        public ActionResult Dashboard()
        {
            return View();
        }

        // add course cotegary
        public ActionResult AddcourseCotegari()
        {

            return View();
        }
        [HttpPost]
        public ActionResult AddcourseCotegari(string cname, HttpPostedFileBase cpic) 
        {
            if (cpic != null)
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@cname",cname),
                new SqlParameter("@cpic",cpic.FileName)
                };

                object res = db.ExecuteScalar("sp_category", parameters);
                if (res.ToString().Equals("Record added"))
                {

                    cpic.SaveAs(Server.MapPath("/Content/picture/") + cpic.FileName);
                    return Content("<script>alert('Record added');location.href='/admin/AddcourseCotegari';</script>");
                }
                else
                {
                    return Content("<script>alert('Record Not added');location.href='/admin/AddcourseCotegari';</script>");
                }
            }
            return View();
        }
        public ActionResult AddInstructor()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddInstructor(InstructorModel s)
        {
            if (s != null)
            {
                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@name",s.name),
                    new SqlParameter("@email",s.email),
                    new SqlParameter("@mobile",s.mobile),
                    new SqlParameter("@gender",s.gender),
                    new SqlParameter("@ipic",s.ipic.FileName),
                    new SqlParameter("@summary",s.summary),
                    new SqlParameter("@about",s.about),
                    new SqlParameter("@Btech",s.Btech),
                    new SqlParameter("@Mtech",s.Mtech),
                    new SqlParameter("@BCA",s.BCA),
                    new SqlParameter("@MCA",s.MCA),
                    new SqlParameter("@Phd",s.Phd),
                };
                object res = db.ExecuteScalar("sp_AddInstructor",parameters);
                if (res.ToString().Equals("Record Added"))
                {
                    s.ipic.SaveAs(Server.MapPath("/Content/picture/") + s.ipic.FileName);
                    return Content("<script>alert('Record Added');location.href='/admin/AddInstructor';</script>");
                }
                else
                {
                    return Content("<script>alert('Record Not Added');location.href='/admin/AddInstructor';</script>");
                }
            }
            else
            {
                return Content("<script>alert('Fill form')</script>");
            }
           
        }
        public ActionResult CourseCotegaryManagement()
        {
            if (Request.QueryString["id"] != null)
            {
                int res = db.ExecuteDML("sp_ManipulateCategary",new SqlParameter[] { 
                new SqlParameter("@id",Request.QueryString["id"]),
                new SqlParameter("@action",1)
                });
                if (res > 0)
                {
                    Response.Write("<script>alert('Record Deleted')</script>");
                }
            }
            if (Request.QueryString["cid"] != null)
            {
                int res = db.ExecuteDML("sp_ManipulateCategary", new SqlParameter[] {
                    new SqlParameter("@id",Request.QueryString["cid"]),
                    new SqlParameter("@action",2)
                });
                return RedirectToAction("CourseCotegaryManagement");
            }
            SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@action",1)
            };
            DataTable dt = db.ExecuteSelect("sp_selectAllCategory",parameters);
            return View(dt);
        }
        public ActionResult UpdateCotegary()
        {
            if (Request.QueryString["id"] != null)
            {
                SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@id",Request.QueryString["id"])
            };
                DataTable dt = db.ExecuteSelect("sp_selOneCotegary", parameters);
                if (dt.Rows.Count > 0)
                {
                    return View(dt.Rows[0]);
                }
                return View(dt);
            }
            else
            {
                return Content("<script>alert('Something else ! Please try Again');location.href='/admin/CourseCotegaryManagement'</script>");

            }
        }
        [HttpPost]
        public ActionResult UpdateCotegary(int id, string cname, HttpPostedFileBase cpic)
        {
            SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@id",id),
                new SqlParameter("@cname",cname),
                new SqlParameter("@cpic",cpic.FileName)
                };

            object res = db.ExecuteScalar("sp_updateCotegary", parameters);
            if (res.ToString().Equals("Record Updated"))
            {

                cpic.SaveAs(Server.MapPath("/Content/picture/") + cpic.FileName);
                return Content("<script>alert('Record Updated');location.href='/admin/CourseCotegaryManagement';</script>");
            }
            else
            {
                return Content("<script>alert('Record Not Updated');location.href='/admin/CourseCotegaryManagement';</script>");
            }
        }
            public ActionResult InstructerprofileManagement()
        {
            if (Request.QueryString["sr"] != null)
            {
                int res = db.ExecuteDML("sp_ManipulateInstructor", new SqlParameter[] {
                new SqlParameter("@sr",Request.QueryString["sr"]),
                new SqlParameter("@action",2)
                });
                if (res > 0)
                {
                    Response.Write("<script>alert('Record Deleted')</script>");
                }
            }
            SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@action",1)
            };
            DataTable dt = db.ExecuteSelect("sp_ManipulateInstructor", parameters);
            return View(dt);
           
        }
        public ActionResult UpdateInstructor()
        {
            if (Request.QueryString["sr"] != null)
            {
                SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@sr",Request.QueryString["sr"])
            };
                DataTable dt = db.ExecuteSelect("sp_selOneInstructor", parameters);
                if (dt.Rows.Count > 0)
                {
                    return View(dt.Rows[0]);
                }
                return View(dt);

            }
            else
            {
                return Content("<script>alert('Something else ! Please try Again');location.href='/admin/InstructerprofileManagement'</script>");
            }

        }
        [HttpPost]
        public ActionResult UpdateInstructor(InstructorModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@sr",s.sr),
                    new SqlParameter("@name",s.name),
                    new SqlParameter("@email",s.email),
                    new SqlParameter("@mobile",s.mobile),
                    new SqlParameter("@gender",s.gender),
                    new SqlParameter("@ipic",s.ipic.FileName),
                    new SqlParameter("@summary",s.summary),
                    new SqlParameter("@about",s.about),
                    new SqlParameter("@Btech",s.Btech),
                    new SqlParameter("@Mtech",s.Mtech),
                    new SqlParameter("@BCA",s.BCA),
                    new SqlParameter("@MCA",s.MCA),
                    new SqlParameter("@Phd",s.Phd),
                };
            object res = db.ExecuteScalar("sp_UpdateInstructor", parameters);
            if (res.ToString().Equals("Record Updated"))
            {
                s.ipic.SaveAs(Server.MapPath("/Content/picture/") + s.ipic.FileName);
                return Content("<script>alert('Record Updated');location.href='/admin/InstructerprofileManagement';</script>");
            }
            else
            {
                return Content("<script>alert('Record Not Updated');location.href='/admin/InstructerprofileManagement';</script>");
            }
        }
        public ActionResult addCourse()
        {

            DataTable category = db.ExecuteSelect("sp_selectAllCategory", new SqlParameter[] {
                new SqlParameter("@action",1)
           }) ;
            DataTable Instructor = db.ExecuteSelect("sp_selectAllCategory", new SqlParameter[] {
                new SqlParameter("@action",3)
            }) ;
            DataSet dataSet = new DataSet();
            dataSet.Tables.Add(category);
            dataSet.Tables.Add(Instructor);
            return View(dataSet);
        }
        //Add Course
        [HttpPost]
        public ActionResult addCourse(CourseModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@title",s.title),
                    new SqlParameter("@thumb",s.thumb.FileName),
                    new SqlParameter("@category",s.category),
                    new SqlParameter("@instructor",s.instructor),
                    new SqlParameter("@fee",s.fee),
                    new SqlParameter("@ffee",s.ffee),
                    new SqlParameter("@details",s.details),
                    new SqlParameter("@duration",s.duration),
                   
                };
            object res = db.ExecuteScalar("sp_addCourse", parameters);
            if (res.ToString().Equals("Record Added"))
            {
                s.thumb.SaveAs(Server.MapPath("/Content/picture/") + s.thumb.FileName);
                return Content("<script>alert('Record Added');location.href='/admin/addCourse';</script>");
            }
            else
            {
                return Content("<script>alert('Record Not Added');location.href='/admin/addCourse';</script>");
            }
        }
        //Course Management

        public ActionResult CourseManagement()
        {
            if (Request.QueryString["sr"] != null)
            {
                int res = db.ExecuteDML("sp_delcourse", new SqlParameter[] {
                new SqlParameter("@csr",Request.QueryString["sr"])
                });
                if (res > 0)
                {
                    Response.Write("<script>alert('Record Deleted')</script>");
                }
            }
            DataTable dt = db.ExecuteSelect("sp_selCourse");
            return View(dt);
        }
        public ActionResult UpdateCourse()
        {
            DataTable dt;
            if (Request.QueryString["sr"] != null)
            {
                SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@csr",Request.QueryString["sr"])
            };
                dt = db.ExecuteSelect("sp_selonecourse", parameters);
        
            }
            else
            {
                return Content("<script>alert('Something else ! Please try Again');location.href='/admin/CourseManagement'</script>");
            }


            DataTable category = db.ExecuteSelect("sp_selectAllCategory", new SqlParameter[] {
                new SqlParameter("@action",1)
            });
             DataTable Instructor = db.ExecuteSelect("sp_selectAllCategory", new SqlParameter[] {
                 new SqlParameter("@action",3)
             });
            DataSet dataSet = new DataSet();
            dataSet.Tables.Add(category);
            dataSet.Tables.Add(Instructor);
            dataSet.Tables.Add(dt);
            return View(dataSet);

        }

        [HttpPost]
        public ActionResult UpdateCourse(CourseModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@csr",s.csr),
                    new SqlParameter("@title",s.title),
                    new SqlParameter("@thumb",s.thumb.FileName),
                    new SqlParameter("@category",s.category),
                    new SqlParameter("@instructor",s.instructor),
                    new SqlParameter("@fee",s.fee),
                    new SqlParameter("@ffee",s.ffee),
                    new SqlParameter("@details",s.details),
                    new SqlParameter("@duration",s.duration),

                };
            object res = db.ExecuteScalar("sp_updateCourse", parameters);
            if (res.ToString().Equals("Record Updated"))
            {
                s.thumb.SaveAs(Server.MapPath("/Content/picture/") + s.thumb.FileName);
                return Content("<script>alert('Record Updated');location.href='/admin/CourseManagement';</script>");
            }
            else
            {
                return Content("<script>alert('Record Not Updated');location.href='/admin/CourseManagement';</script>");
            }
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Adminlogin", "default");
        }
        //add video lecture

        public ActionResult AddVideos()
        {
            DataTable category = db.ExecuteSelect("sp_selectCourse");
            return View(category);
        }
        [HttpPost]
        public ActionResult AddVideos(VideoModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@videoTitle",s.videoTitle),
                    new SqlParameter("@course",s.course),
                    new SqlParameter("@videolink",s.videolink),
                    new SqlParameter("@videodetails",s.videodetails),
                    new SqlParameter("@duration",s.duration),
                    new SqlParameter("@chapter",s.chapter),
                    new SqlParameter("@ispaid",s.ispaid),
                    new SqlParameter("@status",1),
                };
            object res = db.ExecuteScalar("sp_addvideo", parameters);
            if (res.ToString().Equals("record added"))
            {
                return Content("<script>alert('Record Added...');location.href='/admin/AddVideos'</script>");
            }
            else
            {
                return Content("<script>alert('Record Not Added...');location.href='/admin/AddVideos'</script>");
            }
                
        }
        public ActionResult VideoLectureManagement()
        {
            if (Request.QueryString["sr"] != null)
            {
                int res = db.ExecuteDML("sp_delvideo", new SqlParameter[] {
                new SqlParameter("@vsr",Request.QueryString["sr"])
                });
                if (res > 0)
                {
                    Response.Write("<script>alert('Record Deleted')</script>");
                }
            }
            DataTable dt = db.ExecuteSelect("sp_selvideo");
            return View(dt);
        }
        public ActionResult StudentManagement()
        {
            if (Request.QueryString["sr"] != null)
            {
                return Content("<script>alert()</script>");
            }
                DataTable dt = db.ExecuteSelect("sp_selectstudentmng");
            return View(dt);
        }
            public ActionResult Selectcoursevideo(int?id)
        {
            DataTable dt = db.ExecuteSelect("sp_selcoursedetailsn", new SqlParameter[] {
                new SqlParameter("@csr",id)
            });
            List<VideoModel> list = new List<VideoModel>();
            
            foreach (DataRow dr in dt.Rows)
            {
                VideoModel data = new VideoModel();
                data.vsr = Convert.ToInt32(dr["vsr"]);
                data.videoTitle = dr["videoTitle"].ToString();
                data.course = Convert.ToInt32(dr["course"]);
                data.videolink = dr["videolink"].ToString();
                data.videodetails = dr["videodetails"].ToString();
                data.duration = Convert.ToInt32(dr["duration"]);
                data.status = Convert.ToBoolean(dr["status"]);
                data.chapter = dr["chapter"].ToString();
                data.ispaid = Convert.ToBoolean(dr["ispaid"]);
                data.title = dr["title"].ToString();
                list.Add(data);
            }
            return Json(list,JsonRequestBehavior.AllowGet);
        }
        public ActionResult feebackManagement()
        {

            DataTable dt = db.ExecuteSelect("sp_coursefeed");
            return View(dt);

        }
        
        public ActionResult offermng(string semail)
        {
            
            
            if (semail != null)
            {
                DataTable dt = db.ExecuteSelect("sp_selectdata", new SqlParameter[] {
                new SqlParameter("@semail",semail)
            });
                if (dt.Rows[0][0].ToString()!=("Email Not Found"))
                {
                    List<StudentModel> list = new List<StudentModel>();

                    foreach (DataRow dr in dt.Rows)
                    {
                        StudentModel data = new StudentModel();

                        data.sname = dr["sname"].ToString();
                        data.course = Convert.ToInt32(dr["course"]);
                        data.gender = dr["gender"].ToString();
                        data.mobile = Convert.ToInt64(dr["mobile"]);
                        data.college = (dr["college"]).ToString();
                        data.year = (dr["year"]).ToString();
                        data.title = dr["title"].ToString();
                        data.ffee = Convert.ToInt32(dr["ffee"]);
                        data.duration = Convert.ToDateTime(dr["duration"]);
                        list.Add(data);
                    }
                    return Json(list, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(dt.Rows[0][0],JsonRequestBehavior.AllowGet);
                }

            }
                
            return View(); 
        }
        public ActionResult DropDownCourse()
        {
            DataTable dt = db.ExecuteSelect("sp_coursen");
            List<CourseModel> list = new List<CourseModel>();
            foreach (DataRow dr in dt.Rows)
            {
                CourseModel data = new CourseModel();

                data.csr = Convert.ToInt32(dr["csr"]);
                data.title = dr["title"].ToString();
                data.ffee = Convert.ToInt32(dr["ffee"]);
                data.duration = Convert.ToDateTime(dr["duration"]);
                list.Add(data);
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        
                
        }
        public ActionResult changecourse(int? csr)
        {
            DataTable dt = db.ExecuteSelect("sp_coursedurationfee", new SqlParameter[] {
                new SqlParameter("@csr",csr)
            });
            List<CourseModel> list = new List<CourseModel>();
            foreach (DataRow dr in dt.Rows)
            {
                CourseModel data = new CourseModel();

                data.ffee = Convert.ToInt32(dr["ffee"]);
                data.duration = Convert.ToDateTime(dr["duration"]);
                list.Add(data);
            }
            return Json(list, JsonRequestBehavior.AllowGet);

        }
        
        [HttpPost]
        public ActionResult AddOffermng(CourseModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@Semail",s.email),
                    new SqlParameter("@course",s.course),
                    new SqlParameter("@discountamt",s.discountamt),
                    new SqlParameter("@discountdate",s.discountdate),
                    new SqlParameter("@status",1),
                    
                };
            object res = db.ExecuteScalar("sp_Addoffermng", parameters);

            if (res.ToString().Equals("Record Added"))
            {

                //wzrp bzxx avtg ophj

                MailMessage message = new MailMessage("nileshsrivastav9422@gmail.com", s.email);
                message.Subject = "Get Offered Course from Codehelper";
                message.Body = $"Dear {s.email},\n\n Congratulations !\n\n Admin has offered you a course <b>{s.course}</b> for<b>{s.discountamt}</b> valid till {s.discountdate}.\n\nNow You can Enroll in this " +
                    $"course by clicking on below URL :" +
                    $"  \n\n https://localhost:44375/home/EnrollNow?course={s.course} \n\n Thank you";
                message.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("nileshsrivastav9422@gmail.com", "lemu bbcy pydu cixz");
                smtp.EnableSsl = true;
                smtp.Send(message);

                return Content("<script>alert('Done');location.href='/home/StudentRegistration';</script>");
            }
            else
            {
                return Content("<script>alert('Record Not Added');location.href='/home/StudentRegistration';</script>");
            }
        }
    }
}
