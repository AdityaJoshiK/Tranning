using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    public class DepartmentTotal
    {
        [Key] 
        public int Id { get; set; }

        public string Name { get; set; }
        public int Total { get; set; }
    }
}