using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            EmployeeContext context = new EmployeeContext();
            List<Employee> employees = context.Employees.ToList();
            return View(employees);
        }

        public ActionResult GetByDepartmentID(int departmentid)
        {
            EmployeeContext context = new EmployeeContext();
            List<Employee> employees = context.Employees.Where(emp => emp.DepartmentID==departmentid).ToList();
            return View("Index",employees);
        }
        public ActionResult Details(int id)
        {
            //Employee employee = new Employee()
            //{
            //    EmployeeId = 1,
            //    Name = "A",
            //    Gender= "M",
            //    City="Rajkot"
            //};

            //Databse Connection
            EmployeeContext context = new EmployeeContext();
            Employee employee = context.Employees.Single(emp => emp.EmployeeID == id);

            return View(employee);
        }

        public ActionResult EmployeesByDepartment() {

            EmployeeContext context = new EmployeeContext();

            var departmentTotals = context.Employees
     .GroupBy(x => x.Department.name)
     .Select(y => new
     {
         DepartmentName = y.Key,
         Total = y.Count()
     })
     .AsEnumerable() // Switch to LINQ to Objects for the projection
     .Select(z => new DepartmentTotal
     {
         Name = z.DepartmentName,
         Total = z.Total
     })
     .ToList();

            return View(departmentTotals);
        }
    }
}