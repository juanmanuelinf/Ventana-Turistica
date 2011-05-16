using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Text;

namespace VentanaTuristica.Controllers
{
    
    public class ErrorController : Controller
    {
        //
        // GET: /Error/
       
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult FileNotFound()
        {
            return View();
        }
        public ActionResult NoAccess()
        {
            return View();
        }

    }
}
