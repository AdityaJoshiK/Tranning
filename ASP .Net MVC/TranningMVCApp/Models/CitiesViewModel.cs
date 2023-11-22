using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TranningMVCApp.Models
{
    public class CitiesViewModel
    {
        [Key]
        public int Id { get; set; }
        public IEnumerable<SelectListItem> Cities { get; set; }
        public IEnumerable<string> SelectedCities { get; set; }
    }
}