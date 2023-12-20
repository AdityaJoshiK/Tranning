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
    }
}