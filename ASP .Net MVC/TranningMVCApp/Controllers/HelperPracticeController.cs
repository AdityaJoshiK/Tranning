using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages.Html;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class HelperPracticeController : Controller
    {
        // GET: HelperPractice
        public ActionResult Index()
        {
            EmployeeContext employeeContext = new EmployeeContext();

            //ViewBag.Departments = new SelectList(employeeContext.Department, "Id", "name");
            //Now if we need to do like one checkbox which is already selected then we need to pass another param which is 1
            ViewBag.Departments = new SelectList(employeeContext.Department, "Id", "name", "1");


            //another way is to select using new column isselected
            //List[SelectListItem] selectListItems = new List[SelectListItem]();

            //foreach (Department department in db.Departments)
            //{
            //    SelectListItem selectListItem = new SelectListItem
            //    {
            //        Text = department.Name,
            //        Value = department.Id.ToString(),
            //        Selected = department.IsSelected.HasValue ? department.IsSelected.Value : false
            //    };
            //    selectListItems.Add(selectListItem);
            //}

            //ViewBag.Departments = selectListItems;
            return View();
        }
    }
}