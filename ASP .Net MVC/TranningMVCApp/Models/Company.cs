using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    public class Company
    {

        private string _name;

        [Key]
        public int Id { get; set; }

        public Company(string name)
        {
            this._name = name;
        }

        public List<Department> Departments
        {
            get
            {
                EmployeeContext employeeContext = new EmployeeContext();
                List<Department> departments =employeeContext.Department.ToList();
                return departments;
            }
        }

        public string CompanyName
        {
            get
            {
                return _name;
            }       
            set 
            { _name = value; }
        }
    }
}