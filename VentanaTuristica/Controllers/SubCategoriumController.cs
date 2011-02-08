using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class SubCategoriumController : Controller
    {
        //
        // GET: /SubCategorium/

        public ActionResult Index()
        {
            IRepositorio<SubCategorium> myRepoSubCategorium = new SubCategoriumRepositorio();
            IList<SubCategorium> listaSubCategoriums = myRepoSubCategorium.GetAll();
            IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
            Categorium listaCategoriums;
            foreach (var SubCategoriumDelist in listaSubCategoriums)
            {
                SubCategoriumDelist.Categorium = myRepoCategorium.GetById(SubCategoriumDelist.IdCategoria);
            }
            return View(listaSubCategoriums);
        }

        //
        // GET: /SubCategorium/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /SubCategorium/Create

        public ActionResult Create()
        {
            IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
            IList<Categorium> listaCategoriums = myRepoCategorium.GetAll();
            IList<String> nombresCat = new List<string>();
            foreach (var listaCategorium in listaCategoriums)
            {
                nombresCat.Add(listaCategorium.Nombre);
            }
            ViewData["SubCategorium.Categorium.Nombre"] = new SelectList(nombresCat);
            IEnumerable<string> items = new string[] {"Ingles", "Español"};
            ViewData["SubCategorium.Idioma"] = new SelectList(items);
            return View();
        }

        //
        // POST: /SubCategorium/Create

        [HttpPost]
        public ActionResult Create(SubCategorium subCategorium)
        {
            try
            {
                IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
                IList<Categorium> listaCategoriums = myRepoCategorium.GetAll();
                foreach (var listaCategorium in listaCategoriums)
                {
                    if (listaCategorium.Nombre == subCategorium.Categorium.Nombre)
                    {
                        subCategorium.IdCategoria = listaCategorium.IdCategoria;
                    }

                }
                IRepositorio<SubCategorium> myRepoSubCategorium = new SubCategoriumRepositorio();
                myRepoSubCategorium.Save(subCategorium);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(subCategorium);
            }
        }
        
        //
        // GET: /SubCategorium/Edit/5
 
        public ActionResult Edit(int id)
        {
            IRepositorio<SubCategorium> myRepoSubCategorium = new SubCategoriumRepositorio();
            return View(myRepoSubCategorium.GetById(id));
        }

        //
        // POST: /SubCategorium/Edit/5

        [HttpPost]
        public ActionResult Edit(int id,int idCat, SubCategorium subCategorium)
        {
            try
            {
                IRepositorio<SubCategorium> myRepoSubCategorium = new SubCategoriumRepositorio();
                subCategorium.IdSubCategoria = id;
                subCategorium.IdCategoria = idCat;
                myRepoSubCategorium.Update(subCategorium);
                return RedirectToAction("Index");
            }
            catch (Exception O)
            {
                return View();
            }
        }

        //
        // GET: /SubCategorium/Delete/5
 
        public ActionResult Delete(int id)
        {
            try
            {
                IRepositorio<SubCategorium> myRepoSubCategorium = new SubCategoriumRepositorio();
                myRepoSubCategorium.Delete(myRepoSubCategorium.GetById(id));
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

        //
        // POST: /SubCategorium/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
