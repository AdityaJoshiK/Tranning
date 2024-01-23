using EmployeeDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Web_API_MVC.Controllers
{
    public class EmployeesController : ApiController
    {
        public IEnumerable<Employeenew> Get()
        {
            using (AdityaPracticeEntities db = new AdityaPracticeEntities())
            {
                return db.Employeenews.ToList();
            }
        }

        public Employeenew Get(int id)
        {
            using (AdityaPracticeEntities db = new AdityaPracticeEntities())
            {
                return db.Employeenews.FirstOrDefault(x => x.Id == id);
            }
        }
    }
}
