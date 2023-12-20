using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext() : base("name=product")
        { 

        }

        public DbSet<ProductModel> Products { get; set; }
    }
}