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

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection formCollection)
        {
            Employee employee = new Employee();
            employee.Name= formCollection["Name"];
            employee.City = formCollection["City"];
            employee.Gender = formCollection["Gender"];
            employee.DateOfBirth = Convert.ToDateTime(formCollection["DateOfBirth"]);

            EmployeeBuisnessLayer employeeblayer = new BusinessLayer.EmployeeBuisnessLayer();
            employeeblayer.addEmployee(employee);

            //foreach(string key in formCollection.Keys)
            //{
            //    Response.Write("Key:" + key);
            //    Response.Write(formCollection[key]);
            //    Response.Write("</br>");
            //}
            return RedirectToAction("Index");
        }
    }
}