using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Context;

namespace Website.Controllers
{
    public class CategoryController : Controller
    {
        WebsiteEntities obj = new WebsiteEntities();
        // GET: Category
        public ActionResult Index()
        {
            var lstCategory = obj.Categories.ToList();
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int Id)
        {
            var listProduct = obj.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}