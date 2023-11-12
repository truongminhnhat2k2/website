using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website.Context;

namespace Website.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        WebsiteEntities obj = new WebsiteEntities();

        // GET: Admin/Product
        public ActionResult Index()
        {
            var lstProduct = obj.Products.ToList();
            return View(lstProduct);
        }

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
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
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
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objProduct = obj.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Edit(int id, Product objProduct)
        {


            if (objProduct.ImageUpload != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                fileName = fileName + extension;
                objProduct.Avatar = fileName;
                objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Controllers/images/"), fileName));
            }
            obj.Entry(objProduct).State = EntityState.Modified;
            obj.SaveChanges();
            return View(objProduct);

        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objProduct = obj.Products.Where(n => n.Id == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(Product product)
        {
            var objProduct = obj.Products.Where(n => n.Id == product.Id).FirstOrDefault();
            obj.Products.Remove(objProduct);
            obj.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}