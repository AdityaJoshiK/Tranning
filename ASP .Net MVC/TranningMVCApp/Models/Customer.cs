using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    [Table("CUSTOMERS")]
    public class Customer
    {
        public int Id { get; set; }

        public string CName { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
    }
}