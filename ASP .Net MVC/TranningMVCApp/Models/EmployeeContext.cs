using BusinessLayer;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    public class EmployeeContext : DbContext
    {
        public DbSet<Employee> Employees { get; set;}
        public DbSet<Department> Department { get; set; }

        public System.Data.Entity.DbSet<Customers> Customers { get; set; }

        public System.Data.Entity.DbSet<TranningMVCApp.Models.DepartmentTotal> DepartmentTotals { get; set; }
    }
}