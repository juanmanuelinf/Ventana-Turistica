using System.Collections.Generic;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
        public ActionResult Busqueda()
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
