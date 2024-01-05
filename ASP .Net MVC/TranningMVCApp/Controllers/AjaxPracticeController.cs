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
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult All()
        {
            System.Threading.Thread.Sleep(4000);
            List<NewEmployee> model = newEmployeeEntities.NewEmployees.ToList();
            return PartialView("_NewEmployees", model);
        }

        public PartialViewResult Top3()
        {
            List<NewEmployee> model = newEmployeeEntities.NewEmployees.OrderByDescending(x => x.FirstName).Take(3).ToList();
            return PartialView("_NewEmployees", model);
        }

        public PartialViewResult Bottom3()
        {
            List<NewEmployee> model = newEmployeeEntities.NewEmployees.OrderBy(x => x.FirstName).Take(3).ToList();
            return PartialView("_NewEmployees", model);
        }
    }
}