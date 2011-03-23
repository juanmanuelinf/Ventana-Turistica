using System.Collections.Generic;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            IRepositorio<Categorium> repositorio = new CategoriumRepositorio();
            IList<Categorium> todasCategorias = repositorio.GetAll();

            IRepositorio<SubCategorium> repositorioS = new SubCategoriumRepositorio();
            IList<SubCategorium> todasSubCategorias = repositorioS.GetAll();
            IList<SubCategorium> listaSubCategorias = new List<SubCategorium>();

            foreach (var categoria in todasCategorias)
            {
                foreach (var subCategoria in todasSubCategorias)
                {
                    if (subCategoria.IdCategoria == categoria.IdCategoria)
                    {
                        listaSubCategorias.Add(subCategoria);
                    }
                }
                categoria.SubCategoriums = listaSubCategorias;
                listaSubCategorias = new List<SubCategorium>();
            }
            return View(todasCategorias);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
