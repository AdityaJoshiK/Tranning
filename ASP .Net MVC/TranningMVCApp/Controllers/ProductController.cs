using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            ProductContext productContext = new ProductContext();
            List<ProductModel> products = productContext.Products.ToList();
            return View(products);
        }

        public ActionResult Practice()
        {
            ProductContext productContext = new ProductContext();
            List<ProductModel> products = productContext.Products.ToList();
            return View(products);
        }

        public ActionResult Practice(ProductModel model)
        {
            ProductContext productContext = new ProductContext();   
            productContext.Products.Add(model);
            return RedirectToAction("Index");
        }

        public ActionResult Create() { 
            return View();
        }
    }
}