using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TranningMVCApp.Models;

namespace TranningMVCApp.Controllers
{
    public class CityController : Controller
    {
        // GET: City
        [HttpGet]
        public ActionResult Index()
        {
            SampleDataEntities sampleDataEntities = new SampleDataEntities();
            return View(sampleDataEntities.Cities);
        }

        [HttpPost]
        public string Index(IEnumerable<City> cities)
        {
            if (cities.Count(x => x.IsSelected) == 0)
            {
                return "No City Selected";
            }
            else
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("You Selected ");
                foreach (City city in cities)
                {
                    if (city.IsSelected)
                    {
                        stringBuilder.Append(city.Name+" ");
                    }
                }

                return stringBuilder.ToString();
            }
        }
    }
}