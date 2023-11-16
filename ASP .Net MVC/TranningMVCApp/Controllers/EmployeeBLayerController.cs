using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayer;
//using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class EmployeeBLayerController : Controller
    {
        // GET: EmployeeBusinessLayer
        public ActionResult Index()
        {
            EmployeeBuisnessLayer e = new EmployeeBuisnessLayer();

            List<Employee> employees = e.Employees.ToList();
            return View(employees);
        }

        [HttpGet]
        [ActionName("Create")]
        public ActionResult Create_Get()
        {
            return View();
        }

        [HttpPost]
        [ActionName("Create")]
        public ActionResult Create_Post()
        {
                EmployeeBuisnessLayer employeeblayer = new EmployeeBuisnessLayer();

                Employee employee = new Employee();
                //UpdateModel<Employee>(employee); //it will return exception 
                TryUpdateModel<Employee>(employee); //it will return true or false
            if (ModelState.IsValid)
            {

                employeeblayer.addEmployee(employee);
                return RedirectToAction("Index");
            }
            return View();
        }

        //Create Using Form Collection
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Createusingform(FormCollection formCollection)
        {
            Employee employee = new Employee();
            employee.Name= formCollection["Name"];
            employee.City = formCollection["City"];
            employee.Gender = formCollection["Gender"];
            employee.DateOfBirth = Convert.ToDateTime(formCollection["DateOfBirth"]);

            EmployeeBuisnessLayer employeeblayer = new EmployeeBuisnessLayer();
            employeeblayer.addEmployee(employee);

            //foreach(string key in formCollection.Keys)
            //{
            //    Response.Write("Key:" + key);
            //    Response.Write(formCollection[key]);
            //    Response.Write("</br>");
            //}
            return RedirectToAction("Index");
        }

        //Create Using Model
        [HttpPost]
        public ActionResult CreateUsingModel(Employee employee)
        {
            if (ModelState.IsValid)
            {
                EmployeeBuisnessLayer employeeblayer = new EmployeeBuisnessLayer();
                employeeblayer.addEmployee(employee);   
                return RedirectToAction("Index");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            EmployeeBuisnessLayer employeeBuisnessLayer = new EmployeeBuisnessLayer();  
            Employee employee = employeeBuisnessLayer.Employees.Single(emp => emp.EmployeeId == id);
            return View(employee);
        }

        [HttpPost]
        [ActionName("Edit")]
        public ActionResult Edit_Data(int id)
        {
            //to prevent unintended updates means change data of read only fields while requesting to solve this we can pass specific paraters in updatemodel function
            EmployeeBuisnessLayer employeeBuisnessLayer = new EmployeeBuisnessLayer();

            Employee employee = employeeBuisnessLayer.Employees.Single(x => x.EmployeeId == id);
            UpdateModel(employee, new string[] { "EmployeeId", "Gender", "City", "DateOfBirth" });
            //Now Name will be not updated

            if (ModelState.IsValid)
            {
                employeeBuisnessLayer.saveEmployee(employee);

                return RedirectToAction("Index");
            }
            return View(employee);
        }

        public ActionResult NotFound()
        {
            // Code logic here
            return HttpNotFound("Testing The resource was not found.");
        }

        public ActionResult JSON()
        {
            // Code logic here
            return Json(new { Name = "Aditya" }, JsonRequestBehavior.AllowGet);
        }

    }
}