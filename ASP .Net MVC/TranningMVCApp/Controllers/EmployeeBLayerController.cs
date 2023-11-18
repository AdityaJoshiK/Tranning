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
        // With Viewbag and Viewdata We can't use in another view if we write in Controller Index method then it is avaialble only in index view not other
        public ActionResult Index()
        {
            EmployeeBuisnessLayer e = new EmployeeBuisnessLayer();

            List<Employee> employees = e.Employees.ToList();
            TempData["msg"] = "Hii From Index";
            ViewData["Check"] = "Check From Index";
            return View(employees);
        }

        [HttpGet]
        [ActionName("Create")]
        public ActionResult Create_Get()
        {
            ViewBag.msg = TempData["msg"];
            //We Already Use TempData msg so now it will be empty and below Edit method it will be empty to solve we need to add Tempdata.Keep method it will keep data in tempdata
            TempData.Keep();

            //it will save all data in tempdatas if we need to use specific then we can pass name also Tempdata.Keep("msg)

            //ViewBag.msg = TempData.Peek("msg"); it is same as above but it will keep and display both
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
            //We Already Use TempData msg in above Create method so here tempdata is empty to solve we need to add Tempdata.Keep method it will keep data in tempdata 
            ViewBag.msg = TempData["msg"];
            var msg = ViewData["Check"];
            EmployeeBuisnessLayer employeeBuisnessLayer = new EmployeeBuisnessLayer();  
            Employee employee = employeeBuisnessLayer.Employees.Single(emp => emp.EmployeeId == id);
            return View(employee);
        }

        [HttpPost]
        [ActionName("Edit")]
        public ActionResult Edit_Data([Bind(Include ="EmployeeId,Gender,City,DateOfBirth")] Employee employee)
        //public ActionResult Edit_Data([Bind(Exclude ="Name")] Employee employee) //we can also exclude it
        {
            //to prevent unintended updates means change data of read only fields while requesting to solve this we can pass specific parameters in updatemodel function
            EmployeeBuisnessLayer employeeBuisnessLayer = new EmployeeBuisnessLayer();
            
            //Employee employee = employeeBuisnessLayer.Employees.Single(x => x.EmployeeId == id); //Normal Edit
            employee.Name = employeeBuisnessLayer.Employees.Single(x => x.EmployeeId == employee.EmployeeId).Name; //Bind Practice
            UpdateModel(employee, new string[] { "EmployeeId", "Gender", "City", "DateOfBirth" });
            //Now Name will be not updated

            //We can also give one param which will be not passed
            //UpdateModel(employee,null,null,new string[] {"Name"}

            if (ModelState.IsValid)
            {
                employeeBuisnessLayer.saveEmployee(employee);

                return RedirectToAction("Index");
            }
            return View(employee);
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            EmployeeBuisnessLayer employeeBuisnessLayer = new EmployeeBuisnessLayer();
            employeeBuisnessLayer.deleteEmployee(id);

            return RedirectToAction("Index");
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