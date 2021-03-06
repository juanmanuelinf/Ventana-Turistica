﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
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

        protected override void Initialize(RequestContext requestContext)
        {
            var items3 = new List<string>();
            IRepositorio<Lugar> repoMarca = new LugarRepositorio();
            IList<Lugar> query = repoMarca.GetAll();
            items3.Add("--Seleccione--");
            foreach (var lugar in query)
            {
                if (lugar.Tipo == "Pais")
                {
                    items3.Add(lugar.Nombre);
                }

            }
            ViewData["Pais"] = new SelectList(items3);
            IEnumerable<string> items2 = new string[] { "--Seleccione--" };
            ViewData["Estado"] = new SelectList(items2);
            IEnumerable<string> items4 = new string[] { "--Seleccione--" };
            ViewData["Ciudad"] = new SelectList(items4);
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
                                                   "2 Estrellas",
                                                   "3 Estrellas",
                                                   "4 Estrellas",
                                                   "5 Estrellas",
                                                   "Otra"
                                               };
            ViewData["Idioma[0].Categoria"] = new SelectList(itemsCategoria);
            var itemsPrecio = new List<string>
                                               {
                                                   "Bs.",
                                                   "$",
                                                   "€",
                                                   "£",
                                                   "¥"
                                               };
            ViewData["Precios[0].Moneda"] = new SelectList(itemsPrecio);
            ViewData["Precios[1].Moneda"] = new SelectList(itemsPrecio);
            //Lista de Servicios Para la Publiacion
            var repoServ = new ServicioRepositorio();
            var servicios = repoServ.GetAll();
            var itemsCategoria3 = new List<string>();
            var itemsCategoria2 = new List<string>();
            foreach (var servicio in servicios)
            {
                if (servicio.Idioma.CompareTo("es-MX") == 0)
                {
                    itemsCategoria3.Add(servicio.Nombre);
                    itemsCategoria2.Add(servicio.IdServicio.ToString());
                }
            }

            ViewData["Servicios-Es"] = itemsCategoria3;
            ViewData["Servicios-Es-id"] = itemsCategoria2;

            itemsCategoria3 = new List<string>();
            itemsCategoria2 = new List<string>();
            foreach (var servicio in servicios)
            {
                if (servicio.Idioma.CompareTo("en-US") == 0)
                {
                    itemsCategoria3.Add(servicio.Nombre);
                    itemsCategoria2.Add(servicio.IdServicio.ToString());
                }
            }

            ViewData["Servicios-En"] = itemsCategoria3;
            ViewData["Servicios-En-id"] = itemsCategoria2;
            base.Initialize(requestContext);
        }
        //
        // GET: /Publicacion/
        [Authorize(Users = "admin,j2lteam")]
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

        [HttpGet]
        public ActionResult GetForaneas()
        {

            IRepositorio<Lugar> repoMotor = new LugarRepositorio();
            IList<Lugar> query2 = repoMotor.GetAll();
            IRepositorio<Lugar> repoMarca = new LugarRepositorio();
            IList<Lugar> query = repoMarca.GetAll();
            IRepositorio<Lugar> repoMarca2 = new LugarRepositorio();
            IList<Lugar> query3 = repoMarca.GetAll();
            List<JsonSelectObject> citiesList = new List<JsonSelectObject>();

            foreach (var pais in query)
            {
                foreach (var estado in query2)
                {
                    if (pais.IdLugar == estado.FkLugar)
                    {
                        citiesList.Add(new JsonSelectObject
                                           {
                                               When = pais.Nombre,
                                               Value = estado.IdLugar.ToString(),
                                               Text = estado.Nombre
                                           });
                        foreach (var localidad in query3)
                        {
                            if (estado.IdLugar == localidad.FkLugar)
                                citiesList.Add(new JsonSelectObject
                                                   {
                                                       When = estado.IdLugar.ToString(),
                                                       Value = localidad.IdLugar.ToString(),
                                                       Text = localidad.Nombre
                                                   });
                        }
                    }
                }

            }
            return Json(citiesList, JsonRequestBehavior.AllowGet);
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
                if (p.Idioma[0].Categoria.CompareTo("1 Estrella") == 0 || p.Idioma[0].Categoria.CompareTo("2 Estrellas") == 0 || p.Idioma[0].Categoria.CompareTo("3 Estrellas") == 0 || p.Idioma[0].Categoria.CompareTo("4 Estrellas") == 0 || p.Idioma[0].Categoria.CompareTo("5 Estrellas") == 0)
                {
                    p.Idioma[0].Categoria = p.Idioma[0].Categoria.Substring(0, 1);

                }else
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
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create()
        {
            Publicacion p = new Publicacion();
            p.Precios = new List<Precio>();
            p.Precios.Add(new Precio());
            p.Precios.Add(new Precio());
            p.Precios[0].Tipo = "TB";
            p.Precios[1].Tipo = "TA";
            return View();
        } 

        //
        // POST: /Publicacion/Create
        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create(Publicacion p,FormCollection collection)
        {
            //Empresa
            var nombreEmpresa =collection[0];
            var repoEmp = new EmpresaRepositorio();
            var listaEmp = repoEmp.GetAll();
            foreach (var empresa in listaEmp.Where(empresa => empresa.Nombre == nombreEmpresa))
            {
                p.IdEmpresa = empresa.IdEmpresa;
            }
            if(String.IsNullOrEmpty(nombreEmpresa)|| p.IdEmpresa==0)
            {   
                ModelState.AddModelError("NombreE","Nombre Empresa es Necesario");
                return View(p);
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
            IList<Idioma> myIdiomas = p.Idioma;
            p.Idioma = null;
            var repoLug = new LugarRepositorio();
            p.Ciudad = repoLug.GetById(Convert.ToInt32(p.Ciudad)).Nombre;
            p.Estado = repoLug.GetById(Convert.ToInt32(p.Estado)).Nombre;
            var idPublicacion =repoPubli.Save(p);

            //Precios
            IList<Precio> listaPrecios = p.Precios;
            var repoPrecios = new PrecioRepositorio();
            foreach (var precio in listaPrecios)
            {
                precio.IdPublicacion = idPublicacion;
                repoPrecios.Save(precio);
            }

            //fin Precios
            p.Idioma = myIdiomas;
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
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(int id)
        {
            var repoPubli = new PublicacionRepositorio();
            var repoIdioma = new IdiomaRepositorio();
            var repoSer = new ServicioRepositorio();
            var publi = repoPubli.GetById(id);
            var servicios = repoSer.GetAll();
            var itemsCategoria = new List<string>();
            var itemsCategoria2 = new List<string>();
            foreach (var servicio in servicios)
            {
                if(servicio.Idioma.CompareTo("es-MX")==0){
                    itemsCategoria.Add(servicio.Nombre);
                    itemsCategoria2.Add(servicio.IdServicio.ToString());
                }
            }
           
            ViewData["Servicios-Es"] = itemsCategoria;
            ViewData["Servicios-Es-id"] = itemsCategoria2;

            itemsCategoria = new List<string>();
            itemsCategoria2 = new List<string>();
            foreach (var servicio in servicios)
            {
                if (servicio.Idioma.CompareTo("en-US") == 0){
                    itemsCategoria.Add(servicio.Nombre);
                    itemsCategoria2.Add(servicio.IdServicio.ToString());
                }
            }

            ViewData["Servicios-En"] = itemsCategoria;
            ViewData["Servicios-En-id"] = itemsCategoria2;


            
            var repoServiPubli = new PublicacionServicioRepositorio();
            var listaSerPub = repoServiPubli.GetAll();
            var listaPubSer = new List<PublicacionServicio>();
            foreach (var publicacionServicio in listaSerPub)
            {
                if(publicacionServicio.IdPublicacion==publi.IdPublicacion)
                    listaPubSer.Add(publicacionServicio);
            }
            var listaSer= listaPubSer.Select(publicacionServicio => repoSer.GetById(publicacionServicio.IdServicio)).ToList();

            publi.Servicios = listaSer;
            var listIdioma = repoIdioma.GetAll();
            publi.Idioma=new List<Idioma>();
            foreach (var idioma in listIdioma.Where(idioma => idioma.IdPublicacion == publi.IdPublicacion))
            {
                publi.Idioma.Add(idioma);
            }

            var repoPrecios = new PrecioRepositorio();
            var listaPre = repoPrecios.GetAll();
            var listaPre2 = new List<Precio>();
            foreach (var precio in listaPre)
            {
                if(precio.IdPublicacion== publi.IdPublicacion)
                    listaPre2.Add(precio);
            }
            publi.Precios = listaPre2;
         /*   var repoImg = new ImageneRepositorio();
            var listaImg = repoImg.GetAll();
            var listaImg2 = new List<Imagene>();
            foreach (var imagene in listaImg)
            {
                if(imagene.IdPublicacion==id)
                    listaImg2.Add(imagene);
            }
            publi.Imagenes = listaImg2;*/
            return View(publi);
        }

       
        public ActionResult Mail()
        {
            return View();
        }

        public ActionResult Lista(int pagActual, int orden, string cat, string sub, string lug)
        {
            
            var myRepoPublicacion = new PublicacionRepositorio();
            var myRepoSubCat = new SubCategoriumRepositorio();
            var myRepoCat = new CategoriumRepositorio();
            var myRepoPrecio = new PrecioRepositorio();
            IList<IList<Publicacion>> listaDeLista = new List<IList<Publicacion>>();
            IList<Publicacion> listaPub = new List<Publicacion>();
            IList<Publicacion> listaPub2 = myRepoPublicacion.GetAll();
            foreach (var publicacion in listaPub2)
            {
                publicacion.SubCategorium = myRepoSubCat.GetById(publicacion.IdSubCategoria);
                if(lug!=null && sub!=null && cat!=null)
                {
                    publicacion.Categorium = myRepoCat.GetById(publicacion.SubCategorium.IdCategoria);
                    if (publicacion.SubCategorium.Nombre == sub && publicacion.Categorium.Nombre == cat && publicacion.Estado ==lug)
                        listaPub.Add(publicacion);
                }
                else
                {
                    if (sub != null && cat != null)
                    {
                        publicacion.Categorium = myRepoCat.GetById(publicacion.SubCategorium.IdCategoria);
                        if (publicacion.SubCategorium.Nombre == sub && publicacion.Categorium.Nombre == cat)
                            listaPub.Add(publicacion);
                    }else
                    {
                        if (sub != null && lug != null)
                        {
                            if (publicacion.SubCategorium.Nombre == sub && publicacion.Estado == lug)
                            listaPub.Add(publicacion);
                        }
                        else
                        {
                            if (cat != null && lug != null)
                            {
                                publicacion.Categorium = myRepoCat.GetById(publicacion.SubCategorium.IdCategoria);
                                if (publicacion.Categorium.Nombre == sub && publicacion.Estado == lug)
                                listaPub.Add(publicacion);
                            }else
                            {
                                if (sub != null)
                                {
                                    if (publicacion.SubCategorium.Nombre == sub)
                                    listaPub.Add(publicacion);
                                }
                                else
                                {
                                    if (cat != null)
                                    {
                                        publicacion.Categorium = myRepoCat.GetById(publicacion.SubCategorium.IdCategoria);
                                        if (publicacion.Categorium.Nombre == cat)
                                        listaPub.Add(publicacion);
                                    }
                                    else
                                    {
                                        if (lug != null)
                                        {
                                            if (publicacion.Estado == lug)
                                            listaPub.Add(publicacion);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
                
               

                
            }
            if (listaPub.Count() == 0)
            {
                ViewData["nroPaginas"] = 1;
                ViewData["pagActual"] = 1;
                ViewData["cuenta"] = 0;
                return View(new List<Publicacion>());
            }
            foreach (var publicacion in listaPub)
            {
                publicacion.Precios = new List<Precio>();
                IList<Precio> lPrecio = myRepoPrecio.GetAll();
                foreach (var precio in lPrecio)
                {
                    if (precio.IdPublicacion == publicacion.IdPublicacion)
                    {
                        publicacion.Precios.Add(precio);
                    }
                }
            }
            IOrderedEnumerable<Publicacion> lista;
            if (orden != 1)
            {
                lista =listaPub.OrderBy(model => model.Precios[0].PrecioMin);
            }else
            {
                lista =listaPub.OrderByDescending(model => model.Precios[0].PrecioMax);
            }
            listaPub=lista.ToList();
            int nroPaginas = listaPub.Count/8;
            IList<Publicacion> listaPubAux = new List<Publicacion>();
            var cont = 0;
            var cont2 = 0;
            foreach (var publicacion in listaPub)
            {
                var myRepoIma = new ImageneRepositorio();
                var listaImagen = myRepoIma.GetAll();
                foreach (var imagene in listaImagen)
                {
                    if (imagene.IdPublicacion == publicacion.IdPublicacion)
                    {
                        publicacion.Imagen = imagene;
                        break;
                    }
                }
                cont++;
                cont2++;
                if (cont < 9)
                {
                    listaPubAux.Add(publicacion);
                }
                else
                {
                    listaDeLista.Add(listaPubAux);
                    listaPubAux = new List<Publicacion>();
                    listaPubAux.Add(publicacion);
                    cont = 0;
                }
                if (cont2 == listaPub.Count && cont < 9)
                {
                    listaDeLista.Add(listaPubAux);
                }
            }
            if (pagActual <= listaDeLista.Count && pagActual > 0)
            {
                ViewData["nroPaginas"] = nroPaginas;
                ViewData["pagActual"] = pagActual;
                ViewData["cuenta"] = listaDeLista[pagActual - 1].Count;
                return View(listaDeLista[pagActual - 1]);
            }

            return View();
        
    }

        //
        // POST: /Publicacion/Edit/5

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(Publicacion p, FormCollection collection)
        {
            int idPublicacion = p.IdPublicacion;
            //Precios
            IList<Precio> listaPrecios = p.Precios;
            var repoPrecios = new PrecioRepositorio();
            foreach (var precio in listaPrecios)
            {
                precio.IdPublicacion = idPublicacion;
                bool update = repoPrecios.Update(precio);
            }

            //fin Precios
            //Servicios
            
            var misServicios = new List<Servicio>(p.Servicios);
            var repoPubSer = new PublicacionServicioRepositorio();
            var repoSer = new ServicioRepositorio();
            var listaPubServ = repoPubSer.GetAll();
            bool flag = false;
            bool flag2 = false;
            foreach (var misServicio in misServicios)
            {
                if (misServicio.IdServicio != 0)
                {
                    foreach (var publicacionServicio in listaPubServ)
                    {
                        if(publicacionServicio.IdPublicacion==idPublicacion)
                        {
                            if(publicacionServicio.IdServicio==misServicio.IdServicio)
                            {
                                flag = true;
                                break;
                            }
                        }
                    }
                    if(!flag)
                    {
                        var pB = new PublicacionServicio
                        {
                            IdPublicacion = idPublicacion,
                            IdServicio = misServicio.IdServicio

                        };
                        repoPubSer.Save(pB);
                    }
                    flag = false;
                }else
                {
                    foreach (var publicacionServicio in listaPubServ)
                    {
                        if (publicacionServicio.IdPublicacion == idPublicacion)
                        {
                            if (publicacionServicio.IdServicio==misServicio.FkIdServicio)
                            {
                                flag2 = true;
                                misServicio.IdServicio = publicacionServicio.IdServicio;
                                break;
                            }
                        }
                    }
                    if (flag2)
                    {
                        var pB = new PublicacionServicio
                        {
                            IdPublicacion = idPublicacion,
                            IdServicio = misServicio.IdServicio

                        };
                        repoPubSer.Delete(pB);
                    }
                    flag2 = false;
                   
                }

            }
            Idioma i = p.Idioma[0];
            var repoIdioma = new IdiomaRepositorio();
            i.IdPublicacion = p.IdPublicacion;
            repoIdioma.Update(i);

            var repoPubli = new PublicacionRepositorio();
            var b = repoPubli.Update(p);
            Session["IdPublicacion"] = idPublicacion;
            return RedirectToAction("EditForPublicacion","Imagene", new {idPubli = idPublicacion});
            
        }

        //
        // GET: /Publicacion/Delete/5
        [HandleError] 
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id)
        {
            var repoPubli = new PublicacionRepositorio();
            repoPubli.Delete(repoPubli.GetById(id));
            return RedirectToAction("Index");
        }

        //
        // POST: /Publicacion/Delete/5

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var repoPubli = new PublicacionRepositorio();
            repoPubli.Delete(repoPubli.GetById(id));
            return RedirectToAction("Index");
            
        }

         public ActionResult Upload()
         {
             return View();
         }

        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
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
        [HttpPost]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult UploadForEdit(IEnumerable<HttpPostedFileBase> files)
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
            return RedirectToAction("EditForPublicacion", "Imagene", new { idPubli = Session["IdPublicacion"] });
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
        public ActionResult Find(string q)
        {
            IRepositorio<Publicacion> repoP = new PublicacionRepositorio();
            IList<Publicacion> Publicacions = repoP.GetAll();
            IList<Publicacion> posiblesPublicacions = Publicacions.Where(item => item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower())).ToList();

            string[] pub = new string[posiblesPublicacions.Count];
            int i = 0;
            foreach (var publicacion in posiblesPublicacions)
            {
                pub[i] = publicacion.Nombre;
                i++;
            }

            return Content(string.Join("\n", pub)); ;
        }
       
    }
}
