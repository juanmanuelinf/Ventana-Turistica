﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class CategoriumController : Controller
    {
        //
        // GET: /Categorium/

        public ActionResult Index()
        {
            IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
            IList<Categorium> listaCategoriums = myRepoCategorium.GetAll();
            return View(listaCategoriums);
        }

        //
        // GET: /Categorium/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Categorium/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Categorium/Create

        [HttpPost]
        public ActionResult Create(Categorium categorium)
        {
            try
            {
                IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
                 myRepoCategorium.Save(categorium);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Categorium/Edit/5
 
        public ActionResult Edit(int id)
        {
            IRepositorio<Categorium> myRepoCategorium = new CategoriumRepositorio();
           return View(myRepoCategorium.GetById(id));
        }

        //
        // POST: /Categorium/Edit/5

        [HttpPost]
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
        public ActionResult Delete(int id, Categorium categorium)
        {
            return RedirectToAction("Index");
        }
    }
}
