using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class EmpresaController : Controller
    {
        //
        // GET: /Empresa/

        public ActionResult Index()
        {
            IRepositorio<Empresa> myRepoEmpresa = new EmpresaRepositorio();
            IList<Empresa> listaEmpresa = myRepoEmpresa.GetAll();
            return View(listaEmpresa);
        }

        //
        // GET: /Empresa/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Empresa/Create

        public ActionResult Create()
        {
           return View();
        } 

        //
        // POST: /Empresa/Create

        [HttpPost]
        public ActionResult Create(Empresa E)
        {
            if (ModelState.IsValid)
            {
                IRepositorio<Empresa> repo = new EmpresaRepositorio();
                repo.Save(E);
                return RedirectToAction("Index");
            }

            // Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
            return View(E);
        }
        
        //
        // GET: /Empresa/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Empresa/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Empresa/Delete/5
 
        public ActionResult Delete(int id)
        {
            IRepositorio<Empresa> repo = new EmpresaRepositorio();
            Empresa E = repo.GetById(id);
            repo.Delete(E);
            return RedirectToAction("Index");
        }

       
        public ActionResult Find(string q)
        {
            IRepositorio<Empresa> repoP = new EmpresaRepositorio();
            IList<Empresa> empresas = repoP.GetAll();
            IList<Empresa> posiblesEmpresas = new List<Empresa>();

            foreach (var item in empresas)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesEmpresas.Add(item);
                }
            }
            string[] emp = new string[posiblesEmpresas.Count];
            int i = 0;
            foreach (var empresa in posiblesEmpresas)
            {
                emp[i] = empresa.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    }
}
