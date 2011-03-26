using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class ServicioController : Controller
    {
        //
        // GET: /Servicio/

        public ActionResult Index()
        {
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            IList<Servicio> listaServicios = myRepoServicio.GetAll();
            return View(listaServicios);
        }

        //
        // GET: /Servicio/Create

        public ActionResult Create()
        {
            IEnumerable<string> items = new string[] { "Ingles", "Español" };
            ViewData["Servicio.Idioma"] = new SelectList(items);
            return View();
        } 

        //
        // POST: /Servicio/Create

        [HttpPost]
        public ActionResult Create(Servicio servicio)
        {
            if (ModelState.IsValid)
            {
                IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
                myRepoServicio.Save(servicio);
                return RedirectToAction("Index");
            }
            IEnumerable<string> items = new string[] { "Ingles", "Español" };
            ViewData["Servicio.Idioma"] = new SelectList(items);
            return View(servicio);
        }
        
        //
        // GET: /Servicio/Edit/5
 
        public ActionResult Edit(int id)
        {
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            return View(myRepoServicio.GetById(id));
        }

        //
        // POST: /Servicio/Edit/5

        [HttpPost]
        public ActionResult Edit(Servicio servicio)
        {
            if (ModelState.IsValid)
            {
                IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
                myRepoServicio.Update(servicio);
                return RedirectToAction("Index");
            }
            return View(servicio);
        }

        //
        // GET: /Servicio/Delete/5
 
        public ActionResult Delete(int id)
        {
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            var servicio = myRepoServicio.GetById(id);
            myRepoServicio.Delete(servicio);
            return RedirectToAction("Index");
        }
    }
}
