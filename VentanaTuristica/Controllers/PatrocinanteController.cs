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
    public class PatrocinanteController : Controller
    {

        protected override void Initialize(RequestContext requestContext)
        {
            IEnumerable<string> items = new string[] { "Sponsor", "Logo" };
            ViewData["Logo"] = new SelectList(items);
            base.Initialize(requestContext);
        }


        //
        // GET: /Empresa/

        public ActionResult Index(String tipo)
        {
            IRepositorio<Patrocinante> repoPatrocinante = new PatrocinanteRepositorio();
            IList<Patrocinante> patrocinantesAux = new List<Patrocinante>();
            IList<Patrocinante> patrocinantes = repoPatrocinante.GetAll();

            IRepositorio<Telefono> repoTelefono = new TelefonoRepositorio();
            IList<Telefono> TodosTelefonos = repoTelefono.GetAll();
            IList<Telefono> telefonos = new List<Telefono>();

            IRepositorio<Contacto> repoContacto = new ContactoRepositorio();
            IList<Contacto> TodosContactos = repoContacto.GetAll();
            IList<Contacto> contactos = new List<Contacto>();

            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            IList<Imagene> imagenes = repoImagen.GetAll();

            foreach (var patrocinante in patrocinantes)
            {
                foreach (var contacto in TodosContactos)
                {
                    if (contacto.IdPatrocinante == patrocinante.IdPatrocinante)
                    {
                        foreach (var telefono in TodosTelefonos)
                        {
                            if (telefono.IdContacto == contacto.IdContacto)
                            {
                                telefonos.Add(telefono);
                            }
                        }
                        contacto.Telefono = telefonos;
                        contactos.Add(contacto);
                    }
                }
                patrocinante.Contacto = contactos;
                foreach (var imagene in imagenes)
                {
                    if (imagene.IdPatrocinante == patrocinante.IdPatrocinante)
                    {
                        patrocinante.Imagene = imagene;
                        if (tipo != null)
                        {
                            if (tipo == "S")
                            {
                                if (imagene.Tipo == "S")
                                    patrocinantesAux.Add(patrocinante);
                            }
                            else
                            {
                                if (imagene.Tipo == "L")
                                    patrocinantesAux.Add(patrocinante);
                            }
                        }
                    }
                }
            }
            if (tipo != null)
                return View(patrocinantesAux);
            
            return View(patrocinantes);
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
        public ActionResult Create(Patrocinante patrocinante)
        {
            if (patrocinante.File != null)
            {
                HttpFileCollectionBase files = ControllerContext.HttpContext.Request.Files;
                var repoImagen = new ImageneRepositorio();
                var myImagene = new Imagene();
                myImagene.DatosOriginal = ConvertFile(patrocinante.File);
                myImagene.DatosTrans = Resize(ConvertFile(patrocinante.File));
                myImagene.Link = patrocinante.Link;
                patrocinante.Contacto[0].Tipo = "P";
                patrocinante.Contacto[0].Telefono[0].Tipo = "P";
                patrocinante.Contacto[0].IdEmpresa = null;

                var tipo = Request["Logo"] as string;
                if (tipo == "Sponsor")
                {
                    myImagene.Tipo = "S";
                }
                else
                {
                    myImagene.Tipo = "L";
                }

                if (ModelState.IsValid)
                {
                    IRepositorio<Patrocinante> repoPatrocinante = new PatrocinanteRepositorio();
                    repoPatrocinante.Save(patrocinante);

                    IRepositorio<Contacto> repoContacto = new ContactoRepositorio();
                    patrocinante.Contacto[0].IdPatrocinante = patrocinante.IdPatrocinante;
                    repoContacto.Save(patrocinante.Contacto[0]);

                    IRepositorio<Telefono> repoTelefono = new TelefonoRepositorio();
                    patrocinante.Contacto[0].Telefono[0].IdContacto = patrocinante.Contacto[0].IdContacto;
                    repoTelefono.Save(patrocinante.Contacto[0].Telefono[0]);

                    myImagene.IdPatrocinante = patrocinante.IdPatrocinante;
                    repoImagen.Save(myImagene);

                    return RedirectToAction("Index");
                }
            }
            // Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
            return View(patrocinante);
        }
        
        //
        // GET: /Empresa/Edit/5
 
        public ActionResult Edit(int id)
        {
            IRepositorio<Patrocinante> repoPatrocinante = new PatrocinanteRepositorio();
            IList<Patrocinante> patrocinantesAux = new List<Patrocinante>();
            Patrocinante patrocinante = repoPatrocinante.GetById(id);

            IRepositorio<Telefono> repoTelefono = new TelefonoRepositorio();
            IList<Telefono> TodosTelefonos = repoTelefono.GetAll();
            IList<Telefono> telefonos = new List<Telefono>();

            IRepositorio<Contacto> repoContacto = new ContactoRepositorio();
            IList<Contacto> TodosContactos = repoContacto.GetAll();
            IList<Contacto> contactos = new List<Contacto>();

            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            IList<Imagene> imagenes = repoImagen.GetAll();

            foreach (var contacto in TodosContactos)
            {
                if (contacto.IdPatrocinante == patrocinante.IdPatrocinante)
                {
                    foreach (var telefono in TodosTelefonos)
                    {
                        if (telefono.IdContacto == contacto.IdContacto)
                        {
                            telefonos.Add(telefono);
                        }
                    }
                    contacto.Telefono = telefonos;
                    contactos.Add(contacto);
                }
            }
            patrocinante.Contacto = contactos;
            foreach (var imagene in imagenes)
            {
                if (imagene.IdPatrocinante == patrocinante.IdPatrocinante)
                {
                    patrocinante.Imagene = imagene;
                }
            }
            
            return View(patrocinante);

        }
        //
        // POST: /Empresa/Edit/5

        [HttpPost]
        public ActionResult Edit(Patrocinante patrocinante)
        {
            patrocinante.Contacto[0].Tipo = "P";
            patrocinante.Contacto[0].IdPatrocinante = patrocinante.IdPatrocinante;
            patrocinante.Contacto[0].Telefono[0].Tipo = "P";
            patrocinante.Contacto[0].IdEmpresa = null;

            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            Imagene myImagene = new Imagene();
            if (patrocinante.File != null)
            {
                HttpFileCollectionBase files = ControllerContext.HttpContext.Request.Files;
                myImagene.DatosOriginal = ConvertFile(patrocinante.File);
                myImagene.DatosTrans = Resize(ConvertFile(patrocinante.File));
                patrocinante.Contacto[0].Tipo = "P";
                patrocinante.Contacto[0].Telefono[0].Tipo = "P";
                patrocinante.Contacto[0].IdEmpresa = null;
                
                IList<Imagene> imagenes = repoImagen.GetAll();
                foreach (var imagene in imagenes)
                {
                    if (imagene.IdPatrocinante == patrocinante.IdPatrocinante)
                        myImagene.IdImagen = imagene.IdImagen;
                }

                var tipo = Request["Logo"] as string;
                if (tipo == "Sponsor")
                {
                    myImagene.Tipo = "S";
                }
                else
                {
                    myImagene.Tipo = "L";
                }
            }

            if (ModelState.IsValid)
            {
                IRepositorio<Patrocinante> repoPatrocinante = new PatrocinanteRepositorio();
                repoPatrocinante.Update(patrocinante);

                IRepositorio<Contacto> repoContacto = new ContactoRepositorio();
                patrocinante.Contacto[0].IdPatrocinante = patrocinante.IdPatrocinante;
                repoContacto.Update(patrocinante.Contacto[0]);

                IRepositorio<Telefono> repoTelefono = new TelefonoRepositorio();
                patrocinante.Contacto[0].Telefono[0].IdContacto = patrocinante.Contacto[0].IdContacto;
                repoTelefono.Update(patrocinante.Contacto[0].Telefono[0]);

                myImagene.IdPatrocinante = patrocinante.IdPatrocinante;
                repoImagen.Update(myImagene);

                return RedirectToAction("Index");
            }

            // Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
            return View(patrocinante);
        }

        //
        // GET: /Empresa/Delete/5
 
        public ActionResult Delete(int id)
        {
            IRepositorio<Patrocinante> repo = new PatrocinanteRepositorio();
            repo.Delete(repo.GetById(id));
            return RedirectToAction("Index");
        }

       
        public ActionResult Find(string q)
        {
            IRepositorio<Patrocinante> repoP = new PatrocinanteRepositorio();
            IList<Patrocinante> patrocinantes = repoP.GetAll();
            IList<Patrocinante> posiblesPatrocinantes = new List<Patrocinante>();

            foreach (var item in patrocinantes)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesPatrocinantes.Add(item);
                }
            }
            string[] emp = new string[posiblesPatrocinantes.Count];
            int i = 0;
            foreach (var patrocinante in posiblesPatrocinantes)
            {
                emp[i] = patrocinante.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }

        public ActionResult Sponsors()
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            IList<Imagene> myImagene = repoImagen.GetAll();
            IList<Imagene> sponsorImage = new List<Imagene>();
            IList<Imagene> sponsorImageCopy = new List<Imagene>();

            foreach (var imagene in myImagene)
            {
                if (imagene.Tipo == "S")
                {
                    sponsorImageCopy.Add(imagene);
                    sponsorImage.Add(imagene);
                }
            }

            IList<Imagene> sponsorImageDesordenada = new List<Imagene>();

            Random randNum = new Random();
            while (sponsorImage.Count > 0)
            {
                int val = randNum.Next(0, sponsorImage.Count - 1);
                sponsorImageDesordenada.Add(sponsorImage[val]);
                sponsorImage.RemoveAt(val);
            }

            int contador = 1;
            while (sponsorImageDesordenada.Count % 4 != 0)
            {
                sponsorImageDesordenada.Add(sponsorImageCopy.ElementAt(contador));
                contador++;
            }
            return View(sponsorImageDesordenada);
        }

        public ActionResult Logos()
        {
            IRepositorio<Imagene> repoImagen = new ImageneRepositorio();
            IList<Imagene> myImagene = repoImagen.GetAll();
            IList<Imagene> logoImages = new List<Imagene>();
            
            foreach (var imagene in myImagene)
            {
                if (imagene.Tipo == "L")
                {
                    logoImages.Add(imagene);
                }
            }
            return View(logoImages);
        }

        public ActionResult Show(int id)
        {
            //renderizar las imagenes en la vista
            var repoImagen = new ImageneRepositorio();
            var imageData = repoImagen.GetById(id).DatosOriginal;
            return File(imageData, "image/jpg");
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
