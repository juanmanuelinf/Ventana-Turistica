using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VentanaTuristica.Model;
using VentanaTuristica.Repositorios;

namespace VentanaTuristica.Controllers
{
    public class BlogController : Controller
    {
        //
        // GET: /Blog/

        public ActionResult Index()
        {
            IRepositorio<Blog> myRepoBlog = new BlogRepositorio();
            IList<Blog> listaBlog = myRepoBlog.GetAll();
            return View(listaBlog);
        }

        //
        // GET: /Blog/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Blog/Create

        [HttpPost]
        public ActionResult Create(Blog blog)
        {
            try
            {
                IRepositorio<Blog> myRepoBlog = new BlogRepositorio();
                myRepoBlog.Save(blog);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Blog/Edit/5
 
        public ActionResult Edit(int id)
        {
            IRepositorio<Blog> myRepoBlog = new BlogRepositorio();
            return View(myRepoBlog.GetById(id));
        }

        //
        // POST: /Blog/Edit/5

        [HttpPost]
        public ActionResult Edit(Blog blog,int id, FormCollection collection)
        {
            try
            {
                IRepositorio<Blog> myRepoBlog = new BlogRepositorio();
                blog.IdBlog = id;
                myRepoBlog.Update(blog);
                return RedirectToAction("Index");
            }
            catch (Exception O)
            {
                return View();
            }
        }

        //
        // GET: /Blog/Delete/5
 
        public ActionResult Delete(int id)
        {
            try
            {
                IRepositorio<Blog> myRepoBlog = new BlogRepositorio();
                myRepoBlog.Delete(myRepoBlog.GetById(id));
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

        //
        // POST: /Blog/Delete/5

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

        public ActionResult Find(string q)
        {
            IRepositorio<Blog> repoC = new BlogRepositorio();
            IList<Blog> blogs = repoC.GetAll();
            IList<Blog> posiblesBlogs = new List<Blog>();

            foreach (var item in blogs)
            {
                if (item.Titulo.Contains(q.ToUpper()) || item.Titulo.Contains(q.ToLower()))
                {
                    posiblesBlogs.Add(item);
                }
            }
            string[] emp = new string[posiblesBlogs.Count];
            int i = 0;
            foreach (var blog in posiblesBlogs)
            {
                emp[i] = blog.Titulo;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    } 
}
