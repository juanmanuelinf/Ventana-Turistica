using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace VentanaTuristica.Controllers
{
    
    public class ImageneController : Controller
    {

        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
        }


        //
        // GET: /Empresa/
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Index()
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            IList<Imagene> todasImagenes = repoImagen.GetAll();
            IList<Imagene> imagenes = new List<Imagene>();

                foreach (var imagene in todasImagenes)
                {
                    if (imagene.Tipo == "I")
                    {
                        imagenes.Add(imagene);
                    }
                }
            
            return View(imagenes);
        }

        //
        // GET: /Empresa/Details/5
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Empresa/Create
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create()
        {
           return View();
        } 

        //
        // POST: /Empresa/Create
        [Authorize(Users = "admin,j2lteam")]
        [HttpPost]
        public ActionResult Create(Imagene imagene)
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            if (imagene.File != null)
            {
                imagene.DatosOriginal = ConvertFile(imagene.File);
                imagene.DatosTrans = Resize(ConvertFile(imagene.File));
                repoImagen.Save(imagene);
                return RedirectToAction("Index");
            }
            return View(imagene);
        }

        [Authorize(Users = "admin,j2lteam")]
        [HttpPost]
        public ActionResult CreateForPublicacion(Imagene imagene)
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            if (imagene.File != null)
            {
                imagene.DatosOriginal = ConvertFile(imagene.File);
                imagene.DatosTrans = Resize(ConvertFile(imagene.File));
                repoImagen.Save(imagene);
                return RedirectToAction("Index");
            }
            return View(imagene);
        }

        public ActionResult CreateForPublicacion()
        {
            return View();
        }

        public ActionResult EditForPublicacion(int idPubli)
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            var listaImg = repoImagen.GetAll();
            var listaImg2 = new List<Imagene>();
            foreach (var imagene in listaImg)
            {
                if(imagene.IdPublicacion==idPubli)
                {
                    listaImg2.Add(imagene);
                }
            }
            Session["IdPublicacion"] = idPubli;
            return View(listaImg2);
        }
        
        
        //
        // GET: /Empresa/Delete/5
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id)
        {
            IRepositorio<Imagene> repo = new ImageneRepositorio();
            repo.Delete(repo.GetById(id));
            return RedirectToAction("Index");
        }

        [Authorize(Users = "admin,j2lteam")]
        public ActionResult DeleteForPublicacion(int id)
        {
            IRepositorio<Imagene> repo = new ImageneRepositorio();
            repo.Delete(repo.GetById(id));
            return RedirectToAction("EditForPublicacion",new {idPubli=Session["IdPublicacion"]});
        }

        public ActionResult Show(int id)
        {
            //renderizar las imagenes en la vista
            var repoImagen = new ImageneRepositorio();
            var imageData = repoImagen.GetById(id).DatosOriginal;
            return File(imageData, "image/jpg");
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

        public ActionResult Imagenes()
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            IList<Imagene> myImagene = repoImagen.GetAll();
            IList<Imagene> imagenes = new List<Imagene>();

            foreach (var imagene in myImagene)
            {
                if (imagene.Tipo == "I")
                {
                    imagenes.Add(imagene);
                }
            }
            return View(imagenes);
        }

    }
}
