using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace VentanaTuristica.Controllers
{
    public class PublicacionController : Controller
    {
        //
        // GET: /Publicacion/

        public ActionResult Index()
        {
            var myRepoPublicacion = new PublicacionRepositorio();
            var myRepoEmpresa = new EmpresaRepositorio();
            var myRepoCat = new CategoriumRepositorio();
            var myRepoSub = new SubCategoriumRepositorio();
            // Lista de todas las publicaciones
            var listaPublicacion = myRepoPublicacion.GetAll();
            if (listaPublicacion != null)
            {
                foreach (var publicacion in listaPublicacion)
                {
                    //asigno las foraneas de cada publicacion
                    publicacion.Empresa = myRepoEmpresa.GetById(publicacion.IdEmpresa);
                    publicacion.SubCategorium = myRepoSub.GetById(publicacion.IdSubCategoria);
                    publicacion.SubCategorium.Categorium = myRepoCat.GetById(publicacion.SubCategorium.IdCategoria);
                }
            }
            return View(listaPublicacion);
        }

        
        public ActionResult Show(int id)
        {
            //renderizar las imagenes en la vista
            var repoImagen = new ImageneRepositorio();
            var imageData = repoImagen.GetById(id).DatosTrans;
            return File( imageData, "image/jpg" );
        }
        

        //
        // GET: /Publicacion/Details/5

        public ActionResult Details(int id)
        {
            var myRepoPublicacion = new PublicacionRepositorio();
            var myRepoImagene = new ImageneRepositorio();
            var myRepoServicioP = new PublicacionServicioRepositorio();
            var myRepoCat = new CategoriumRepositorio();
            var myRepoSubCat = new SubCategoriumRepositorio();
            var myRepoEmpresa = new EmpresaRepositorio();
            var myRepoServicio = new ServicioRepositorio();
            var myRepoIdioma = new IdiomaRepositorio();
            var myRepoPrecio = new PrecioRepositorio();
            var p = myRepoPublicacion.GetById(id);
            if (p != null)
            {
                var listaImagenes = myRepoImagene.GetAll();
                var listaImagenesAux = listaImagenes.Where(imagene => imagene.IdPublicacion == id).ToList();
                p.Imagenes = listaImagenesAux;
                var listaIdioma = myRepoIdioma.GetAll();
                if (listaIdioma!=null)
                {
                    p.Idioma = new List<Idioma>();
                    foreach (var idioma in listaIdioma.Where(idioma => idioma.IdPublicacion == id))
                    {
                        p.Idioma.Add(idioma);
                    }
                }
               
                var listaServicio = myRepoServicioP.GetAll();
                if (listaServicio != null)
                {
                    p.Servicios = new List<Servicio>();
                    foreach (var servicio in listaServicio.Where(servicio => servicio.IdPublicacion == id))
                    {
                        p.Servicios.Add(myRepoServicio.GetById(servicio.IdServicio));
                    }
                }
                p.Empresa = myRepoEmpresa.GetById(p.IdEmpresa);
                p.SubCategorium = myRepoSubCat.GetById(p.IdSubCategoria);
                p.Categorium = myRepoCat.GetById(p.SubCategorium.IdCategoria);
                var listaPrecios = myRepoPrecio.GetAll();
                p.Precios = listaPrecios.Where(listaPrecio => listaPrecio.IdPublicacion == id).ToList();
                p.Reservacion = p.Reservacion == "S" ? "Si" : "No";
                if (p.Idioma[0].Categoria != "1" && p.Idioma[0].Categoria != "2" && p.Idioma[0].Categoria != "3" && p.Idioma[0].Categoria != "4" && p.Idioma[0].Categoria != "5")
                {
                    p.Idioma.Add(new Idioma { Categoria = p.Idioma[0].Categoria });
                    p.Idioma[0].Categoria = "0";
                }
                    
                return View(p);
            }
            return RedirectToAction("Index");

        }

        //
        // GET: /Publicacion/Create

        public ActionResult Create()
        {
            var repoSubCat = new SubCategoriumRepositorio();
            var repoCat = new CategoriumRepositorio();
            //Lista de Subcategoria para las publicaciones
            var miLista = repoSubCat.GetAll();
            if (miLista != null)
            {
                var items = (from subCategorium in miLista
                             let miCategorium = repoCat.GetById(subCategorium.IdCategoria)
                             select miCategorium.Nombre + " - " + subCategorium.Nombre).ToList();

                ViewData["SubCategorium.Nombre"] = new SelectList(items);
            }
            //Lista de Categoria de la publicacion
            var itemsCategoria = new List<string>
                                               {
                                                   "1 Estrella",
                                                   "2 Estrella",
                                                   "3 Estrella",
                                                   "4 Estrella",
                                                   "5 Estrella",
                                                   "Otra"
                                               };
            ViewData["Idioma[0].Categoria"] = new SelectList(itemsCategoria);
            //Lista de Servicios Para la Publiacion
            var repoServ = new ServicioRepositorio();
            var miListaServ = repoServ.GetAll();
            var itemsServ = miListaServ.Select(servicio => servicio.Nombre).ToList();
            ViewData["Servicios"] = new SelectList(itemsServ);
            return View(miListaServ);
        } 

        //
        // POST: /Publicacion/Create

        [HttpPost]
        public ActionResult Create(Publicacion p,FormCollection collection)
        {
            //Empresa
            var nombreEmpresa =collection[0];
            if(String.IsNullOrEmpty(nombreEmpresa))
            {   
                ModelState.AddModelError("NombreE","Nombre Empresa es Necesario");
                return View(p);
            }
            var repoEmp = new EmpresaRepositorio();
            var listaEmp = repoEmp.GetAll();
            foreach (var empresa in listaEmp.Where(empresa => empresa.Nombre == nombreEmpresa))
            {
                p.IdEmpresa = empresa.IdEmpresa;
            }
            //fin Empresa
            //Sub Categoria
            var repoSub = new SubCategoriumRepositorio();
            var listaSub = repoSub.GetAll();
            var subCategorias =p.SubCategorium.Nombre.Split('-');
            var subCategoria = "";
            subCategoria = subCategorias[1].Substring(1);
            p.SubCategorium = new SubCategorium();
            foreach (var subCategorium in listaSub.Where(subCategorium => subCategorium.Nombre == subCategoria))
            {
                p.IdSubCategoria = subCategorium.IdSubCategoria;
            }
            //fin Sub Categoria
            var repoPubli = new PublicacionRepositorio();
            var idPublicacion =repoPubli.Save(p);
            //Servicios
            var misServicios = new List<Servicio>(p.Servicios);
            foreach (var misServicio in misServicios)
            {
                if (misServicio.IdServicio == 0) continue;
                var pB = new PublicacionServicio
                             {
                                 IdPublicacion = idPublicacion,
                                 IdServicio = misServicio.IdServicio
                             };
                var repoPubSer = new PublicacionServicioRepositorio();
                repoPubSer.Save(pB);
            }
            //fin Servicios
            //Idioma 
            var repoIdioma = new IdiomaRepositorio();
            var idioma = p.Idioma[0];
            idioma.IdPublicacion = idPublicacion;
            if(p.Idioma[0].Categoria != "Otra")
            {
                p.Idioma[0].Categoria.Substring(0, 1);
               repoIdioma.Save(idioma);
            } 
            else
            {
                idioma.Categoria = p.Idioma[1].Categoria;
                repoIdioma.Save(idioma);
            }
            //fin Idioma
            //Session para las fotos
            Session["IdPublicacion"] = idPublicacion;

           return RedirectToAction("Upload");
          
        }
        
        //
        // GET: /Publicacion/Edit/5
        [ChildActionOnly]
        public ActionResult Edit()
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
            var repoImagen = new ImageneRepositorio();
            var myImagene = new Imagene();
            if (files != null)
            {
                foreach (var miArchivo in from file in files where file != null select ConvertFile(file))
                {
                    myImagene.DatosOriginal = miArchivo;
                    myImagene.DatosTrans = Resize(miArchivo);
                    myImagene.Tipo = "P";
                    myImagene.IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
                    repoImagen.Save(myImagene);
                }
            }
            return RedirectToAction("Index");
      }

        public Byte[] ConvertFile(HttpPostedFileBase source)
        {

            var destination = new Byte[source.ContentLength];
            source.InputStream.Position = 0;
            source.InputStream.Read(destination, 0, source.ContentLength);
            return destination;

        }

        public Byte[] Resize(Byte[] imageFile)
        {
            const int targetSize = 300;
            var original = Image.FromStream(new MemoryStream(imageFile));
            int targetH, targetW;
            if (original.Height > original.Width)
            {
                targetH = targetSize;
                targetW = (int)(original.Width * ((float)targetSize / (float)original.Height));
            }
            else
            {
                targetW = targetSize;
                targetH = (int)(original.Height * ((float)targetSize / (float)original.Width));
            }
            var imgPhoto = Image.FromStream(new MemoryStream(imageFile));
            // Create a new blank canvas.  The resized image will be drawn on this canvas.
            var bmPhoto = new Bitmap(targetW, targetH, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(72, 72);
            var grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            grPhoto.DrawImage(imgPhoto, new Rectangle(0, 0, targetW, targetH), 0, 0, original.Width, original.Height, GraphicsUnit.Pixel);
            var mm = new MemoryStream();
            bmPhoto.Save(mm, System.Drawing.Imaging.ImageFormat.Jpeg);
            original.Dispose();
            imgPhoto.Dispose();
            bmPhoto.Dispose();
            grPhoto.Dispose();
            return mm.GetBuffer();
        }
       
    }
}
