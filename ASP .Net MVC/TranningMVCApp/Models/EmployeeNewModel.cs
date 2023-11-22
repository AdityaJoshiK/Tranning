using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    [MetadataType(typeof(EmployeeMetaData))]
    [Table("Employeenew")]
    public partial class Employeenew
    {
    }
        
    public class EmployeeMetaData
    {
        [Display(Name = "Full Name")]
        public string FullName { get; set; }
    }

}