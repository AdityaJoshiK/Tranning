using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayer;

namespace TranningMVCApp.Controllers
{
    public class EmployeeBLayerController : Controller
    {
        // GET: EmployeeBusinessLayer
        public ActionResult Index()
        {
            EmployeeBuisnessLayer e = new BusinessLayer.EmployeeBuisnessLayer();

            List<Employee> employees = e.Employees.ToList();
            return View(employees);
        }
    }
}