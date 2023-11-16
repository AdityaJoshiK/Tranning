using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Employee
    {
        [Key]
        public int EmployeeId { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }  
        public string City { get; set; }
        public int DepartmentID { get; set; }
        public DateTime DateOfBirth { get; set; }
    }
}
