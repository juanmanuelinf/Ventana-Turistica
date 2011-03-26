using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class PatrocinanteController : Controller
    {
        //
        // GET: /Empresa/

        public ActionResult Index()
        {
            IRepositorio<Patrocinante> repoPatrocinante = new PatrocinanteRepositorio();
            IList<Patrocinante> patrocinantes = repoPatrocinante.GetAll();

            IRepositorio<Telefono> repoTelefono = new TelefonoRepositorio();
            IList<Telefono> TodosTelefonos = repoTelefono.GetAll();
            IList<Telefono> telefonos = new List<Telefono>();

            IRepositorio<Contacto> repoContacto = new ContactoRepositorio();
            IList<Contacto> TodosContactos = repoContacto.GetAll();
            IList<Contacto> contactos = new List<Contacto>();

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
            }
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
            patrocinante.Contacto[0].Tipo = "Patrocinante";
            patrocinante.Contacto[0].Telefono[0].Tipo = "Patrocinante";
            patrocinante.Contacto[0].IdEmpresa = null;
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

                return RedirectToAction("Index");
            }

            // Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
            return View(patrocinante);
        }
        
        //
        // GET: /Empresa/Edit/5
 
        public ActionResult Edit(int id)
        {
            IRepositorio<Patrocinante> repoPatrocinante = new PatrocinanteRepositorio();
            Patrocinante patrocinante = repoPatrocinante.GetById(id);

            IRepositorio<Telefono> repoTelefono = new TelefonoRepositorio();
            IList<Telefono> TodosTelefonos = repoTelefono.GetAll();
            IList<Telefono> telefonos = new List<Telefono>();

            IRepositorio<Contacto> repoContacto = new ContactoRepositorio();
            IList<Contacto> TodosContactos = repoContacto.GetAll();
            IList<Contacto> contactos = new List<Contacto>();

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
                    contacto.IdPatrocinante = patrocinante.IdPatrocinante;
                    contactos.Add(contacto);
                }
            }
            patrocinante.Contacto = contactos;
            
            return View(patrocinante);
        }
        //
        // POST: /Empresa/Edit/5

        [HttpPost]
        public ActionResult Edit(Patrocinante patrocinante)
        {
            patrocinante.Contacto[0].Tipo = "Patrocinante";
            patrocinante.Contacto[0].Telefono[0].Tipo = "Patrocinante";
            patrocinante.Contacto[0].IdEmpresa = null;
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
    }
}
