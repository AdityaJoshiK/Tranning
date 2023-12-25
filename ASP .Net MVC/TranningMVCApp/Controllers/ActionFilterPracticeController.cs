using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TranningMVCApp.Controllers
{
    public class ActionFilterPracticeController : Controller
    {
        // GET: ActionFilterPractice
        public ActionResult Index()
        {
            return View();
        }

        /* Countries view is invoked by index method in index view if we directly call countries then it throws error 
         * because it required countryName so if we use childactiononly then we can't call it directly */
        [ChildActionOnly]
        public ActionResult Countries(List<string> countryNames)
        {
            return View(countryNames);
        }

        //Custom error page, enable custome error in web.config, customize error page in shared folder
        public ActionResult Index1()
        {
            return View();
        }

        //custom error page can't handle not found error so we create new error controller and register in web.config

        //Output cache use to store output of method fo given duaration
        [OutputCache(Duration = 10)]
        public ActionResult Data()
        {
            System.Threading.Thread.Sleep(2); 
            return View();
        }
    }
}