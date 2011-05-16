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
    public class LugarController : Controller
    {

        protected override void Initialize(RequestContext requestContext)
        {
            IEnumerable<string> items = new string[] { "--Seleccione--", "Pais", "Estado", "Localidad" };
            ViewData["Lugar"] = new SelectList(items);
            IEnumerable<string> items2 = new string[] { " " };
            ViewData["Foranea"] = new SelectList(items2);
            base.Initialize(requestContext);
        }

        //
        // GET: /Lugar/
        [ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Index()
        {
            IRepositorio<Lugar> myRepoLugar = new LugarRepositorio();
            IList<Lugar> listaLugar = myRepoLugar.GetAll();
            return View(listaLugar);
        }

        //
        // GET: /Lugar/Create
        [ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetForaneas()
        {

            IRepositorio<Lugar> repoMotor = new LugarRepositorio();
            IList<Lugar> query2 = repoMotor.GetAll();
            IRepositorio<Lugar> repoMarca = new LugarRepositorio();
            IList<Lugar> query = repoMarca.GetAll();
            List<JsonSelectObject> citiesList = new List<JsonSelectObject>();
            citiesList.Add(new JsonSelectObject
                        {
                            When = "Pais",
                            Value = null,
                            Text = null
                        });
            foreach (var lugar in query)
            {
                if (lugar.Tipo == "Pais")
                        citiesList.Add(new JsonSelectObject
                        {
                            When = "Estado",
                            Value = lugar.IdLugar.ToString(),
                            Text = lugar.Nombre
                        });
            }
           
            foreach (var lugar in query)
            {
                if (lugar.Tipo == "Estado")
                    citiesList.Add(new JsonSelectObject
                    {
                        When = "Localidad",
                        Value = lugar.IdLugar.ToString(),
                        Text = lugar.Nombre
                    });
            }
           
            
            return Json(citiesList, JsonRequestBehavior.AllowGet);
        }
        //
        // POST: /Lugar/Create

        [HttpPost, ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Create(Lugar lugar,FormCollection collection)
        {
            try
            {
                if (collection.GetValue("Foranea").AttemptedValue.CompareTo("null")!=0)
                {
                    ValueProviderResult valor = collection.GetValue("Foranea");
                    int idForanea = Convert.ToInt32(valor.AttemptedValue);
                    ValueProviderResult valorNombre = collection.GetValue("Nombre");
                    String Nombre = valorNombre.AttemptedValue;
                    ValueProviderResult valorTipo = collection.GetValue("Lugar");
                    String Tipo = valorTipo.AttemptedValue;
                    lugar = new Lugar();
                    lugar.Nombre = Nombre;
                    lugar.Tipo = Tipo;
                    lugar.FkLugar = idForanea;
                    IRepositorio<Lugar> myRepoLugar = new LugarRepositorio();
                    myRepoLugar.Save(lugar);
                }
                else
                {
                    ValueProviderResult valorNombre = collection.GetValue("Nombre");
                    String Nombre = valorNombre.AttemptedValue;
                    ValueProviderResult valorTipo = collection.GetValue("Lugar");
                    String Tipo = valorTipo.AttemptedValue;
                    lugar = new Lugar();
                    lugar.Nombre = Nombre;
                    lugar.Tipo = Tipo;
                    lugar.FkLugar = null;
                    IRepositorio<Lugar> myRepoLugar = new LugarRepositorio();
                    myRepoLugar.Save(lugar);
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Lugar/Edit/5
        [ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(int id)
        {
            IRepositorio<Lugar> myRepoLugar = new LugarRepositorio();
            return View(myRepoLugar.GetById(id));
        }

        //
        // POST: /Lugar/Edit/5

        [HttpPost, ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Edit(Lugar Lugar, int id, FormCollection collection)
        {
            try
            {
                IRepositorio<Lugar> myRepoLugar = new LugarRepositorio();
                Lugar.IdLugar = id;
                myRepoLugar.Update(Lugar);
                return RedirectToAction("Index");
            }
            catch (Exception O)
            {
                return View();
            }
        }

        //
        // GET: /Lugar/Delete/5
        [ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Delete(int id)
        {
            try
            {
                IRepositorio<Lugar> myRepoLugar = new LugarRepositorio();
                myRepoLugar.Delete(myRepoLugar.GetById(id));
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

        //
        // POST: /Lugar/Delete/5

        [HttpPost, ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
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

        [ValidateInput(false)]
        [Authorize(Users = "admin,j2lteam")]
        public ActionResult Find(string q)
        {
            IRepositorio<Lugar> repoC = new LugarRepositorio();
            IList<Lugar> Lugares = repoC.GetAll();
            IList<Lugar> posiblesLugares = new List<Lugar>();

            foreach (var item in Lugares)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesLugares.Add(item);
                }
            }
            string[] emp = new string[posiblesLugares.Count];
            int i = 0;
            foreach (var Lugar in posiblesLugares)
            {
                emp[i] = Lugar.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    }
}
