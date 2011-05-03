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
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Index()
        {
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            IList<Servicio> listaServicios = myRepoServicio.GetAll();
            return View(listaServicios);
        }

        //
        // GET: /Servicio/Create
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create()
        {
            IEnumerable<string> items = new string[] { "en-US", "es-MX" };
            ViewData["Servicio.Idioma"] = new SelectList(items);
            return View();
        } 

        //
        // POST: /Servicio/Create

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create(Servicio servicio)
        {
            if (ModelState.IsValid)
            {
                IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
                myRepoServicio.Save(servicio);
                return RedirectToAction("Index");
            }
            IEnumerable<string> items = new string[] { "en-US", "es-MX" };
            ViewData["Servicio.Idioma"] = new SelectList(items);
            return View(servicio);
        }
        
        //
        // GET: /Servicio/Edit/5
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(int id)
        {
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            return View(myRepoServicio.GetById(id));
        }

        //
        // POST: /Servicio/Edit/5

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
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
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id)
        {
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            var servicio = myRepoServicio.GetById(id);
            myRepoServicio.Delete(servicio);
            return RedirectToAction("Index");
        }

        public ActionResult Find(string q)
        {
            IRepositorio<Servicio> repoS = new ServicioRepositorio();
            IList<Servicio> servicios = repoS.GetAll();
            IList<Servicio> posiblesServicios = new List<Servicio>();

            foreach (var item in servicios)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesServicios.Add(item);
                }
            }
            string[] emp = new string[posiblesServicios.Count];
            int i = 0;
            foreach (var servicio in posiblesServicios)
            {
                emp[i] = servicio.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    }
}
