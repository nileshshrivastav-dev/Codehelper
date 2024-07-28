using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeHelper.Models;
using System.Net.Mail;
using System.Net;
using System.Web.Security;
using System.Collections;
using System.Runtime.ConstrainedExecution;

namespace CodeHelper.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        
        DBLayer db = new DBLayer();

        //registration student
        /* name, emailid,password, mobilenumber, college,course,year,profile picture,gender*/

        // GET: Home
        
        public ActionResult Index()
        {

            DataTable dt = db.ExecuteSelect("sp_selectAllCategory", new SqlParameter[] { 
                new SqlParameter("@action", 4) });
            DataTable dtcourse = db.ExecuteSelect("sp_SelectCourseInfo");
            DataSet set = new DataSet();
            set.Tables.Add(dt);
            set.Tables.Add(dtcourse);
            return View(set);
        }
        public ActionResult About()
        {
            return View();
        }
        
        public ActionResult StudentRegistration()
        {
            DataTable category = db.ExecuteSelect("sp_selectCourse");
            return View(category);
        }
        [HttpPost]
        public ActionResult StudentRegistration(StudentModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@sname",s.sname),
                    new SqlParameter("@semail",s.semail),
                    new SqlParameter("@gender",s.gender),
                    new SqlParameter("@mobile",s.mobile),
                    new SqlParameter("@college",s.college),
                    new SqlParameter("@course",s.course),
                    new SqlParameter("@year",s.year),
                    new SqlParameter("@profile",s.profile.FileName),
                    new SqlParameter("@password",s.password),
                };
            object res = db.ExecuteScalar("sp_addstudent", parameters);
            if (res.ToString().Equals("Record Added"))
            {
                s.profile.SaveAs(Server.MapPath("/Content/picture/") + s.profile.FileName);
                

                //wzrp bzxx avtg ophj

                MailMessage message = new MailMessage("nileshsrivastav9422@gmail.com",s.semail);
                message.Subject = "USERID and Password from Codehelper";
                message.Body = $"Dear{s.sname},\n\nThank you for being register with Codehelper\n\n your login id is <b>{s.semail}</b> and password is <b>{s.password}</b>.\n\n Thank you";
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
        
        public ActionResult studentLogin()
        {
            if (Request.QueryString["ReturnUrl"] != null)
                Session["ReturnUrl"] = Request.QueryString["ReturnUrl"];
            return View();
        }
        [HttpPost]
        public ActionResult studentLogin(string userid, string password)
        {
            SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@userid",userid),
            new SqlParameter("@password",password)
            };
            DataTable dt = db.ExecuteSelect("sp_login", parameters);

            if (dt.Rows.Count > 0)
            {
                Session["name"] = dt.Rows[0]["semail"];
                Session["password"] = dt.Rows[0]["password"].ToString();
                FormsAuthentication.SetAuthCookie(userid, false);
                if (Session["ReturnUrl"] != null)
                {
                    return Content("<script>alert('Login Successfully');location.href='" + Session["ReturnUrl"] + "'</script>");
                }
                else
                {
                    return Content("<script>alert('Login Successfully');location.href='/home/mycourse'</script>");
                }
            }
            else
            {
                return Content("<script>alert('Invalid Userid or Password');location.href='/home/studentlogin'</script>");
            }
        }
        public ActionResult Emailveryfication()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Emailveryfication(string email)
        {
            SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@userid",email),
            
            };
            DataTable dt = db.ExecuteSelect("sp_emailveryfication", parameters);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["semail"].Equals(email))
                {
                    Session["semail"] = dt.Rows[0]["semail"];
                    Random rnd = new Random();
                    Session["otp"] = (rnd.Next(100000, 999999)).ToString();
                    MailMessage message = new MailMessage("nileshsrivastav9422@gmail.com", email);
                    message.Subject = "Your Otp from Codehelper";
                    message.Body = $"your otp is {Session["otp"]}\n\n Thank you";
                    message.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("nileshsrivastav9422@gmail.com", "lemu bbcy pydu cixz");
                    smtp.EnableSsl = true;
                    smtp.Send(message);

                    return RedirectToAction("otpVeryfication");
                }
                else
                {
                    return Content("<script>alert('Email Not matched')</script>");
                }
                
            }
            else
            {
                return Content("<script>alert('Something error in database')</script>");
            }
            
        }
        public ActionResult otpVeryfication()
        {
            ViewBag.message = "We have to send otp over the email valid for 20 minute";
            return View();
        }
        [HttpPost]
      public ActionResult otpVeryfication(int? otp)
        {
            if (Convert.ToInt32(Session["otp"]) == otp)
            {
                return Content("<script>alert('Otp and email verified successfully');location.href='/home/ChangePassword'</script>");
            }
            else
            {
                return Content("<script>alert('Otp Not matched');location.href='/home/otpVeryfication'</script>");
            }
        }
        
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(string npassword,string cpassword)
        {
            if (npassword != null && cpassword != null)
            {
                if (npassword == cpassword)
                {
                    SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@npassword",npassword),
                    new SqlParameter("@semail",Session["semail"].ToString())
            };
                    object res = db.ExecuteScalar("sp_changepassword", parameters);
                    return Content("<script>alert('Password changed');location.href='/home/studentLogin'</script>");
                }
                else
                {
                    return Content("<script>alert('Password not changed');loction.href='/home/studentLogin'</script>");
                }
            }
            else
            {
                return Content("<script>alert('Fill all field');location.href='/home/ChangePassword'</script>");
            }
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("studentlogin","home");
        }
        // my course
        [Authorize(Roles="Student")]
        public ActionResult MyCourse()
        {
            DataTable dt = db.ExecuteSelect("sp_mycoursedata", new SqlParameter[] {
                new SqlParameter("@email", User.Identity.Name) });
            return View(dt);
        }
        public ActionResult onecoursechapter(int? csr)
        {
            if (csr.HasValue)
            {
                DataTable dt = db.ExecuteSelect("sp_selectCoursewisechapter", new SqlParameter[] {
                    new SqlParameter("@course",csr)
                });
                return View(dt);
            }
            else
            {
                return Content("<script>alert('Relatable course not found')</script>");
            }
        }
        [Authorize(Roles = "Student")]
        public ActionResult profile()
        {
            DataTable dt = db.ExecuteSelect("sp_profile", new SqlParameter[] {
                new SqlParameter("@semail", User.Identity.Name) });
            if (dt.Rows.Count > 0)
            {
                return View(dt.Rows[0]);
            }
            else
            {
                return View(dt);
            }
        }
        [Authorize(Roles = "Student")]
        public ActionResult Editprofile()
        {
            DataTable dt = db.ExecuteSelect("sp_profile", new SqlParameter[] {
                new SqlParameter("@semail", User.Identity.Name) });
            if (dt.Rows.Count > 0)
            {
                return View(dt.Rows[0]);
            }
            else
            {
                return View(dt);
            }
        }
        [HttpPost,Authorize(Roles = "Student")]
        public ActionResult Editprofile(StudentModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@sname",s.sname),
                    new SqlParameter("@semail",User.Identity.Name),
                    new SqlParameter("@gender",s.gender),
                    new SqlParameter("@mobile",s.mobile),
                    new SqlParameter("@college",s.college),
                    new SqlParameter("@course",s.course),
                    new SqlParameter("@year",s.year),
                    new SqlParameter("@profile",s.profile.FileName),
                    new SqlParameter("@password",s.password),
                };
            object res = db.ExecuteScalar("sp_updatestudent", parameters);
            if (res.ToString().Equals("Record Updated"))
            {
                s.profile.SaveAs(Server.MapPath("/Content/picture/") + s.profile.FileName);
                return Content("<script>alert('Record Updated');location.href='/home/profile'</script>");
            }
            else
            {
                return Content("<script>alert('Something else..');location.href='/home/profile'</script>");
            }
        }
        [Authorize(Roles = "Student")]
        public ActionResult PasswordChange()
        {
            return View();
        }
        [HttpPost,Authorize(Roles = "Student")]
        public ActionResult PasswordChange(string opassword, string npassword, string cpassword, string email)
        {
            if (opassword != null && npassword != null && cpassword != null)
            {
                if (Session["password"].ToString().Equals(opassword))
                {
                    SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@npassword",npassword),
                    new SqlParameter("@opassword",opassword),
                    new SqlParameter("@semail",User.Identity.Name)
            };
                    object res = db.ExecuteScalar("sp_passwordchange", parameters);
                    return Content("<script>alert('Password changed');location.href='/home/studentLogin'</script>");
                }
                else
                {
                    return Content("<script>alert('OldPassword Not matched');location.href='/home/PasswordChange'</script>");
                }
            }
            else
            {
                return Content("<script>alert('Fill all field');location.href='/home/PasswordChange'</script>");
            }
        }
        public ActionResult CourseDetails(int? csr)
        {
            if (csr.HasValue)
            {
                DataTable dt = db.ExecuteSelect("sp_SelectoneCoursedetails", new SqlParameter[] {
                    new SqlParameter("@csr",csr)
                });

                DataTable dt2 = db.ExecuteSelect("sp_selectCoursewisechapter", new SqlParameter[] {
                    new SqlParameter("@course",csr)
                });


                if (dt.Rows.Count > 0)
                {
                    DataSet ds = new DataSet();
                    ds.Tables.Add(dt);
                    ds.Tables.Add(dt2);
                    return View(ds);
                    
                }
                else
                {
                    return Content("<script>alert('Relatable course id not found');location.href='/home/index#coursediv'</script>");
                }

            }
            else
            {
                return Content("<script>alert('Relatable course id not found');location.href='/home/index#coursediv'</script>");
            }
        }
        public ActionResult Categarywisecourse(int? id)
        {
            DataTable dtcat = db.ExecuteSelect("sp_SelectCourseWiseCategory", new SqlParameter[] {
                new SqlParameter("@action",1)
            });
            DataTable dtcourse;
            if (id.HasValue)
            {
                dtcourse = db.ExecuteSelect("sp_SelectCourseWiseCategory", new SqlParameter[] {
                    new SqlParameter("@action",3),
                    new SqlParameter("@id",id)
                });
            }
            else
            {
                dtcourse = db.ExecuteSelect("sp_SelectCourseWiseCategory", new SqlParameter[] {
                    new SqlParameter("@action",2)
                });
            }
            DataSet ds = new DataSet();
            ds.Tables.Add(dtcat);
            ds.Tables.Add(dtcourse);
            return View(ds);
        }
        public ActionResult selevideo(int? courseid, string chapter)
        {
            DataTable dt = db.ExecuteSelect("selvideo", new SqlParameter[] {
                    new SqlParameter("@course",courseid),
                    new SqlParameter("@chapter",chapter)
                });
            List<VideoModel> link = new List<VideoModel>();

            
            foreach (DataRow dr in dt.Rows)
            {
                VideoModel data = new VideoModel();
                data.vsr = Convert.ToInt32(dr["vsr"]);
                data.videoTitle = dr["videoTitle"].ToString();
                data.videolink = dr["videolink"].ToString();
                data.videodetails = dr["videodetails"].ToString();
                data.duration = Convert.ToInt32(dr["duration"]);
                data.ispaid = Convert.ToBoolean(dr["ispaid"]);
                link.Add(data);
            }
            return Json(link,JsonRequestBehavior.AllowGet);
           
        }

        [HttpPost]
        public ActionResult CourseDetails(feedbackModel s)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
         new SqlParameter("@Course_id",s.id),
         new SqlParameter("@fullname",s.name),
         new SqlParameter("@Email",s.email),
         new SqlParameter("@subject",s.subject),
         new SqlParameter("@comment",s.comment),
         
            };
            object res = db.ExecuteScalar("sp_coursefeedback", parameters);
            if (res.Equals("success"))
            {
                return Content("<script>alert(Your comment send on server. Thanks for sharing feedback);location.href='/home/CourseDetails?csr=s.id'</script>");
            }
            else {
                return Content("<script>alert(kuchh gadbad hai);location.href='/home/CourseDetails?csr=s.id'</script>");
            }
            
        }
        // handle bad request
        public ActionResult defaultpage()
        {
            return View();
        }
        //Invoice of payment
        [Authorize(Roles = "Student")]
        public ActionResult Invoice(int?csr)
        {
            if (csr.HasValue)
            {
                DataTable dt = db.ExecuteSelect("sp_selectallData", new SqlParameter[] {
                    new SqlParameter("@csr",csr),
                    new SqlParameter("@semail",User.Identity.Name)
                });
                if (dt.Rows.Count > 0)
                {
                    return View(dt);
                }
                else
                {
                    return Content("<script>alert('Record Not found');location.href='/home/login'</script>");
                }
            }
            else
            {
                return Content("<script>alert('Relatable course id not found');location.href='/home/index#coursediv'</script>");
            }
        }
        [Authorize]
        public ActionResult EnrollNow()
        {
            if (Request.QueryString["course"]!=null)
            {
                DataTable dt = db.ExecuteSelect("sp_enrolldata", new SqlParameter[] {
                    new SqlParameter("@course",Request.QueryString["course"]),
                    new SqlParameter("@email",User.Identity.Name)
                    
                });
                if (dt.Rows.Count > 0)
                {
                    return View(dt.Rows[0]);
                }
                else
                {
                    return Content("<script>alert('Record not found');location.href='/home/index'</script>");
                }
            }
            else {
                return Content("<script>alert('Login Again !');location.href='/home/studentlogin'</script>");
            }
        }
        [HttpPost]
        public ActionResult EnrollNow(StudentModel s)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@course",s.course),
                    new SqlParameter("@email",s.email),
                    new SqlParameter("@finalfee",s.finalfee),
                    new SqlParameter("@expiry",s.expiry_date),
                    new SqlParameter("@action",1)
                };
            object res = db.ExecuteScalar("sp_Enroll", parameters);
            if (res.Equals("Congrats! Tou are enrolled in the course. Go to MyCourse"))
            {
                return Content("<script>alert('Congrats! you are enrolled in the course. Go to MyCourse');location.href='/home/index'</script>");
            }
            return Content("<script>alert('Not Enrolled');location.href='/home/index'</script>");
        }
        [HttpPost, Authorize(Roles = "Student")]
        public ActionResult EnrollStudent(int fee, int courseid, string email, DateTime edate)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@course",courseid),
                    new SqlParameter("@email",email),
                    new SqlParameter("@finalfee",fee),
                    new SqlParameter("@expiry",edate),
                    new SqlParameter("@action",1)
                };
            object res = db.ExecuteScalar("sp_Enroll", parameters);
            return Json(res);
        }


    }
}