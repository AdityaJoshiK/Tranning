using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult Index()
        {
            CustomerContext customerContext = new CustomerContext();
            List<Customers> customerList = customerContext.Customers.ToList();
            return View(customerList);
        }
    }
}