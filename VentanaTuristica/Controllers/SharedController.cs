using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VentanaTuristica.Controllers
{
    public class SharedController : Controller
    {
        //
        // GET: /Shared/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Espanol()
        {
            Session["culture"] = "es-MX";
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Ingles()
        {
            Session["culture"] = "en-US";
            return RedirectToAction("Index", "Home");

        }

    }
}
