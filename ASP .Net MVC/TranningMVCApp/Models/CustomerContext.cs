using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    public class CustomerContext : DbContext
    {
        public CustomerContext() : base("name=EmployeeContext")
        { 
        
        }

        public DbSet<Customer> Customers { get; set; }
    }
}