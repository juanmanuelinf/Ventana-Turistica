using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class CategoriumController : Controller
    {

      //
      // GET: /Categorium/
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Index()
        {
            IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
            IList<Categorium> listaCategoriums = myRepoCategorium.GetAll();
            return View(listaCategoriums);
        }

        //
        // GET: /Categorium/Details/5
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Categorium/Create
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create()
        {
            IEnumerable<string> items = new string[] { "en-US", "es-MX" };
            ViewData["Categorium.Idioma"] = new SelectList(items);
            return View();
        } 

        //
        // POST: /Categorium/Create

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create(Categorium categorium)
        {
            if (ModelState.IsValid)
            {
                IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
                myRepoCategorium.Save(categorium);
                return RedirectToAction("Index");
            }
            IEnumerable<string> items = new string[] { "Ingles", "Español" };
            ViewData["Categorium.Idioma"] = new SelectList(items);
            return View(categorium);
        }
        
        //
        // GET: /Categorium/Edit/5
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(int id)
        {
            IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
           return View(myRepoCategorium.GetById(id));
        }

        //
        // POST: /Categorium/Edit/5

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(Categorium categorium, int id, FormCollection collection)
        {
            try
            {
                IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
                categorium.IdCategoria = id;
                myRepoCategorium.Update(categorium);
                return RedirectToAction("Index");
            }
            catch (Exception O)
            {
                return View();
            }
        }

        //
        // GET: /Categorium/Delete/5
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id)
        {
            try
            {
                IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
                myRepoCategorium.Delete(myRepoCategorium.GetById(id));
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

        //
        // POST: /Categorium/Delete/5

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id, Categorium categorium)
        {
            return RedirectToAction("Index");
        }

        public ActionResult Categorias()
        {

            if (Session["culture"] == null)
                Session["culture"] = "es-MX";
            IRepositorio<Categorium> repositorioCategoria = new CategoriumRepositorio();
            IList<Categorium> todasCategorias = repositorioCategoria.GetAll();
            IList<Categorium> todasCategoriasVistas = new List<Categorium>();
            IRepositorio<SubCategorium> repositorioSubcategoria = new SubCategoriumRepositorio();
            IList<SubCategorium> todasSubCategorias = repositorioSubcategoria.GetAll();
            IList<SubCategorium> listaSubCategorias = new List<SubCategorium>();
            IRepositorio<Publicacion> repositorioPublicacion = new PublicacionRepositorio();
            IList<Publicacion> listaPublicaciones = repositorioPublicacion.GetAll();
            IList<string> listaLugares = new List<string>();
            foreach (var categoria in todasCategorias)
            {
                if (categoria.Idioma == Session["culture"].ToString())
                {
                    foreach (var subCategoria in todasSubCategorias)
                    {
                        if (subCategoria.IdCategoria == categoria.IdCategoria)
                        {
                            foreach (var publicacion in listaPublicaciones)
                            {
                                if (publicacion.IdSubCategoria == subCategoria.IdSubCategoria)
                                {
                                    if (!listaLugares.Contains(publicacion.Estado))
                                        listaLugares.Add(publicacion.Estado);
                                }
                            }
                            subCategoria.Lugares = listaLugares;
                            listaLugares = new List<string>();
                            listaSubCategorias.Add(subCategoria);
                        }
                    }
                    categoria.SubCategoriums = listaSubCategorias;
                    listaSubCategorias = new List<SubCategorium>();
                    todasCategoriasVistas.Add(categoria);
                }
            }
            return PartialView(todasCategoriasVistas);
        }

        public ActionResult Find(string q)
        {
            IRepositorio<Categorium> repoC = new CategoriumRepositorio();
            IList<Categorium> categoriums = repoC.GetAll();
            IList<Categorium> posiblesCategorias = new List<Categorium>();

            foreach (var item in categoriums)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesCategorias.Add(item);
                }
            }
            string[] emp = new string[posiblesCategorias.Count];
            int i = 0;
            foreach (var categoria in posiblesCategorias)
            {
                emp[i] = categoria.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    }
}
