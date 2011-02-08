using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class PublicacionController : Controller
    {
        //
        // GET: /Publicacion/

        public ActionResult Index()
        {
            IRepositorio<Publicacion> myRepoPublicacion = new PublicacionRepositorio();
            IRepositorio<Empresa> myRepoEmpresa = new EmpresaRepositorio();
            IRepositorio<Categorium> myRepoCat = new CategoriumRepositorio();
            IRepositorio<SubCategorium> myRepoSub = new SubCategoriumRepositorio();
            IList<Publicacion> listaPublicacion = myRepoPublicacion.GetAll();
            foreach (var publicacion in listaPublicacion)
            {
                publicacion.Empresa = myRepoEmpresa.GetById(publicacion.IdEmpresa);
                publicacion.SubCategorium = myRepoSub.GetById(publicacion.IdSubCategoria);
                publicacion.SubCategorium.Categorium = myRepoCat.GetById(publicacion.SubCategorium.IdCategoria);
            }
            return View(listaPublicacion);
        }

        //
        // GET: /Publicacion/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Publicacion/Create

        public ActionResult Create()
        {
            IRepositorio<SubCategorium> repoSubCat = new SubCategoriumRepositorio();
            IRepositorio<Categorium> repoCat = new CategoriumRepositorio();
            IList<SubCategorium> miLista = repoSubCat.GetAll();
            IList<string> items = new List<string>();
            foreach (var subCategorium in miLista)
            {
                Categorium miCategorium = repoCat.GetById(subCategorium.IdCategoria);
                items.Add(miCategorium.Nombre +" - " +subCategorium.Nombre);
                
            }
           
            ViewData["SubCategorium.Nombre"] = new SelectList(items);

            IRepositorio<Servicio> repoServ = new ServicioRepositorio();
            IList<Servicio> miListaServ = repoServ.GetAll();

            IList<string> itemsServ = new List<string>();
            foreach (var servicio in miListaServ)
            {
                itemsServ.Add(servicio.Nombre);
            }
           
            ViewData["Servicios"] = new SelectList(itemsServ);
            return View(miListaServ);
        } 

        //
        // POST: /Publicacion/Create

        [HttpPost]
        public ActionResult Create(Publicacion p,FormCollection collection)
        {
            string nombreEmpresa =collection[0];
            IRepositorio<Empresa> repoEmp = new EmpresaRepositorio();
            IList<Empresa> listaEmp = repoEmp.GetAll();
          
            foreach (var empresa in listaEmp)
            {
                if(empresa.Nombre == nombreEmpresa)
                {
                    p.IdEmpresa = empresa.IdEmpresa;
                }
            }
            IRepositorio<SubCategorium> repoSub = new SubCategoriumRepositorio();
            IList<SubCategorium> listaSub = repoSub.GetAll();
            String[] subCategorias =p.SubCategorium.Nombre.Split('-');
            String subCategoria = "";
            subCategoria = subCategorias[1].Substring(1);
            p.SubCategorium = new SubCategorium();
            foreach (var subCategorium in listaSub)
            {
                if(subCategorium.Nombre == subCategoria)
                {
                    p.IdSubCategoria = subCategorium.IdSubCategoria;
                }
            }
            IRepositorio<Publicacion> repoPubli = new PublicacionRepositorio();
            int idPublicacion =repoPubli.Save(p);
            IList<Servicio> misServicios = new List<Servicio>(p.Servicios);
            foreach (var misServicio in misServicios)
            {
                if (misServicio.IdServicio!=0)
                {
                    var pB = new PublicacionServicio
                                 {
                                     IdPublicacion = idPublicacion,
                                     IdServicio = misServicio.IdServicio
                                 };
                    IRepositorio<PublicacionServicio> repoPubSer = new PublicacionServicioRepositorio();
                    repoPubSer.Save(pB);
                }
                
            }
            Session["IdPublicacion"] = idPublicacion;
           
            return RedirectToAction("Upload");
          
        }
        
        //
        // GET: /Publicacion/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Publicacion/Edit/5

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
        // GET: /Publicacion/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Publicacion/Delete/5

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

         public ActionResult Upload()
         {
             return View();
         }

        [HttpPost]
        public ActionResult Upload(IEnumerable<HttpPostedFileBase> files)
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            Imagene myImagene = new Imagene();
            
         foreach (var file in files)
         {
             if (file != null)
             {
                 Byte[] miArchivo = ConvertFile(file);
                 myImagene.DatosOriginal = miArchivo;
                 myImagene.DatosTrans = miArchivo;
                 myImagene.Tipo = "P";
                 myImagene.IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
                 repoImagen.Save(myImagene);
             }
         }
         return RedirectToAction("Index");
      }

        public Byte[] ConvertFile(HttpPostedFileBase source)
        {

            Byte[] destination = new Byte[source.ContentLength];
            source.InputStream.Position = 0;
            source.InputStream.Read(destination, 0, source.ContentLength);
            return destination;

        } 
       
    }
}
