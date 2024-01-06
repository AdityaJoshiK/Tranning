using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class AjaxPracticeController : Controller
    {
        // GET: AjaxPractice
        NewEmployeeEntities newEmployeeEntities = new NewEmployeeEntities();

        [Route("/GetData")]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return View(newEmployeeEntities.NewEmployees.ToList());
        }

        [HttpPost]
        public ActionResult List(string searchTerm)
        {
            List<NewEmployee> employees = new List<NewEmployee>();

            if (string.IsNullOrEmpty(searchTerm))
            {
                employees = newEmployeeEntities.NewEmployees.ToList();
            }
            else
            {
                employees = newEmployeeEntities.NewEmployees.Where(x=>x.FirstName.StartsWith(searchTerm)).ToList();
            }
            return View(employees);
        }

        public JsonResult GetEmployees(string term)
        {
            List<string> employees;

            employees = newEmployeeEntities.NewEmployees.Where(x => x.FirstName.StartsWith(term)).Select(y => y.FirstName).ToList();

            return Json(employees, JsonRequestBehavior.AllowGet);
        }

        public PartialViewResult All()
        {
            System.Threading.Thread.Sleep(1000);
            List<NewEmployee> model = newEmployeeEntities.NewEmployees.ToList();
            return PartialView("_NewEmployees", model);
        }

        public PartialViewResult Top3()
        {
            System.Threading.Thread.Sleep(1000);
            List<NewEmployee> model = newEmployeeEntities.NewEmployees.OrderByDescending(x => x.FirstName).Take(3).ToList();
            return PartialView("_NewEmployees", model);
        }

        public PartialViewResult Bottom3()
        {
            System.Threading.Thread.Sleep(1000);
            List<NewEmployee> model = newEmployeeEntities.NewEmployees.OrderBy(x => x.FirstName).Take(3).ToList();
            return PartialView("_NewEmployees", model);
        }
    }
}