    using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string id)
        {
            //return "Hello From Index id is " + id + " and your name is " + Request.QueryString["name"]
            ViewBag.Countries = new List<string>
            {
                "India",
                "US",
                "UK",
                "Canada"
            };

            return View();
        }

        //custom route practice
        public String Country(string id,string name)
        {
            return "Hello From Country id is " + id + " and your name is " + name;
        }

        public ActionResult States()
        {
            ViewData["States"] = new List<string>
            {
                "Gujarat",
                "Punjab",
                "Delhi",
                "Keral"
            };

            return View("States");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        //TextBox vs Texbox for and dropdown vs dropdownfor
        public ActionResult Company()
        {
            Company company = new Company("A");

            ViewBag.Departments = new SelectList(company.Departments, "Id", "Name");
            ViewBag.CompanyName = company.CompanyName;

            return View();
        }

        [HttpGet]
        public ActionResult CompanyUsingHtmlFor()
        {
            Company company = new Company("A");
            return View(company);
        }
        [HttpPost]
        public string CompanyUsingHtmlFor(Company company)
        {
            if(string.IsNullOrEmpty(company.SelectedDepartment))
            {
                return "You did not select any department";
            }
            else
            {
                return "You selected department with ID = " + company.SelectedDepartment;
            }
        }
    }
}