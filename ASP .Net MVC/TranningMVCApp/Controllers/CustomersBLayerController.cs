using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TranningMVCApp.Controllers
{
    public class CustomersBLayerController : Controller
    {
        // GET: CustomersBLayer
        public ActionResult Index()
        {
            CustomersBusinessLayer customersBusinessLayer = new CustomersBusinessLayer();

            List<Customers> customers = customersBusinessLayer.Customers.ToList();
            return View(customers);
        }
    }
}