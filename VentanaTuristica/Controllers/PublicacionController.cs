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

        
        public ActionResult Show(int id)
        {
             IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            var imageData = repoImagen.GetById(id).DatosTrans;
            return File( imageData, "image/jpg" );
        }
        

        //
        // GET: /Publicacion/Details/5

        public ActionResult Details(int id)
        {
            IRepositorio<Publicacion> myRepoPublicacion = new PublicacionRepositorio();
            IRepositorio<Imagene> myRepoImagene = new ImageneRepositorio();
            Publicacion p = myRepoPublicacion.GetById(id);
            IList<Imagene> listaImagenes = myRepoImagene.GetAll();
            IList<Imagene> listaImagenesAux = new List<Imagene>();
            foreach (var imagene in listaImagenes)
            {
                if (imagene.IdPublicacion==id)
                {
                    listaImagenesAux.Add(imagene);
                }
            }
            p.Imagenes = listaImagenesAux;

            IRepositorio<Idioma> myRepoIdioma = new IdiomaRepositorio();
            IList<Idioma> listaIdioma = myRepoIdioma.GetAll();
            p.Idioma = new List<Idioma>();
            foreach (var idioma in listaIdioma)
            {
                if(idioma.IdPublicacion == id)
                {
                    p.Idioma.Add(idioma);
                }
            }

            IRepositorio<PublicacionServicio> myRepoServicioP = new PublicacionServicioRepositorio();
            IRepositorio<Servicio> myRepoServicio = new ServicioRepositorio();
            IList<PublicacionServicio> listaServicio = myRepoServicioP.GetAll();

            p.Servicios = new List<Servicio>();
            foreach (var servicio in listaServicio)
            {
                if (servicio.IdPublicacion == id)
                {
                    p.Servicios.Add(myRepoServicio.GetById(servicio.IdServicio));
                }
            }


            return View(p);
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

            IList<string> itemsCategoria = new List<string>
                                               {
                                                   "1 Estrella",
                                                   "2 Estrella",
                                                   "3 Estrella",
                                                   "4 Estrella",
                                                   "5 Estrella",
                                                   "Otra"
                                               };
            ViewData["Idioma[0].Categoria"] = new SelectList(itemsCategoria);
            

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
            Idioma idioma = new Idioma();
            IRepositorio<Idioma> repoIdioma = new IdiomaRepositorio();
            idioma = p.Idioma[0];
            idioma.IdPublicacion = idPublicacion;
            if(p.Idioma[0].Categoria != "Otra")
            {
               repoIdioma.Save(idioma);
            } 
            else
            {
                idioma.Categoria = p.Idioma[1].Categoria;
                repoIdioma.Save(idioma);
            }
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

            Byte[] destination = new Byte[source.ContentLength];
            source.InputStream.Position = 0;
            source.InputStream.Read(destination, 0, source.ContentLength);
            return destination;

        }

        public Byte[] Resize(Byte[] imageFile)
        {
            const int targetSize = 300;
            Image original = Image.FromStream(new MemoryStream(imageFile));
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
            Image imgPhoto = Image.FromStream(new MemoryStream(imageFile));
            // Create a new blank canvas.  The resized image will be drawn on this canvas.
            Bitmap bmPhoto = new Bitmap(targetW, targetH, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(72, 72);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            grPhoto.DrawImage(imgPhoto, new Rectangle(0, 0, targetW, targetH), 0, 0, original.Width, original.Height, GraphicsUnit.Pixel);
            MemoryStream mm = new MemoryStream();
            bmPhoto.Save(mm, System.Drawing.Imaging.ImageFormat.Jpeg);
            original.Dispose();
            imgPhoto.Dispose();
            bmPhoto.Dispose();
            grPhoto.Dispose();
            return mm.GetBuffer();
        }
       
    }
}
