﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class DepartmentController : Controller
    {
        // GET: Department
        public ActionResult Index()
        {
            EmployeeContext employeeContext = new EmployeeContext();
            //List<Department> departments = employeeContext.Departments.ToList();
            List<Department> departments = employeeContext.Department.ToList();
            return View(departments);
        }
    }
}