using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Context;

namespace Website.Controllers
{
    public class ProductController : Controller
    {
        WebsiteEntities obj = new WebsiteEntities();

        public ActionResult Detail(int Id)
        {
            var objProduct = obj.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }



        // GET: Product

        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) ;
                    objProduct.Avatar = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Controllers/images/"), fileName));
                }
                obj.Products.Add(objProduct);
                obj.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }
    }
}