using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class NewEmployeesController : Controller
    {
        private NewEmployeeEntities db = new NewEmployeeEntities();

        // GET: NewEmployees
        public ActionResult Index()
        {
            return View(db.NewEmployees.ToList());
        }

        public JsonResult isUserNameExists(string FirstName)
        {
            using (var context = new NewEmployeeEntities())  // Assuming NewEmployeeEntities is a database context
            {
                return Json(!context.NewEmployees.Any(user => user.FirstName == FirstName),JsonRequestBehavior.AllowGet);
            }
        }


        // GET: NewEmployees/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewEmployee newEmployee = db.NewEmployees.Find(id);
            if (newEmployee == null)
            {
                return HttpNotFound();
            }
            return View(newEmployee);
        }

        // GET: NewEmployees/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NewEmployees/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EmployeeID,FirstName,LastName,BirthDate,JoiningDate,Salary,IsActive,DepartmentID")] NewEmployee newEmployee)
        {
            if(db.NewEmployees.Any(x=>x.FirstName == newEmployee.FirstName))
            {
                ModelState.AddModelError("UserName", "UserName Already Exists!");
            }

            if (ModelState.IsValid)
            {
                db.NewEmployees.Add(newEmployee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(newEmployee);
        }

        // GET: NewEmployees/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewEmployee newEmployee = db.NewEmployees.Find(id);
            if (newEmployee == null)
            {
                return HttpNotFound();
            }
            return View(newEmployee);
        }

        // POST: NewEmployees/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmployeeID,FirstName,LastName,BirthDate,JoiningDate,Salary,IsActive,DepartmentID")] NewEmployee newEmployee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(newEmployee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newEmployee);
        }

        // GET: NewEmployees/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewEmployee newEmployee = db.NewEmployees.Find(id);
            if (newEmployee == null)
            {
                return HttpNotFound();
            }
            return View(newEmployee);
        }

        // POST: NewEmployees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NewEmployee newEmployee = db.NewEmployees.Find(id);
            db.NewEmployees.Remove(newEmployee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
