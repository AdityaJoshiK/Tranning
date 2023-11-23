using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class OrdersController : Controller
    {
        // GET: Orders
        public ActionResult Index(int id)
        {
            OrderEntities orderEntities = new OrderEntities();
            Order order = orderEntities.Orders.Single(x => x.OrderID == id);
            return View(order);
        }

        //Displaymodel For Practice
        public ActionResult DetailsWithDisplayfor(int id)
        {
            OrderEntities orderEntities = new OrderEntities();
            Order order = orderEntities.Orders.Single(x => x.OrderID == id);
            return View(order);
        }

        public ActionResult Details(int id)
        {
            OrderEntities orderEntities = new OrderEntities();
            Order order = orderEntities.Orders.Single(x => x.OrderID == id);
            return View(order);
        }

        //Editmodelfor practice
        public ActionResult Edit(int id)
        {
            OrderEntities orderEntities = new OrderEntities();
            Order order = orderEntities.Orders.Single(x => x.OrderID == id);
            return View(order);
        }
    }
}