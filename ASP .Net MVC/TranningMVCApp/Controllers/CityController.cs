using Microsoft.Ajax.Utilities;
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
                        stringBuilder.Append(city.Name + " ");
                    }
                }

                return stringBuilder.ToString();
            }
        }

        [HttpGet]
        public ActionResult CityListBox()
        {
            SampleDataEntities SampleDataEntities = new SampleDataEntities();
            List<SelectListItem> selectList = new List<SelectListItem>();

            foreach (City city in SampleDataEntities.Cities)
            {
                SelectListItem selectListItem = new SelectListItem()
                {
                    Text = city.Name,
                    Value = city.ID.ToString(),
                    Selected = city.IsSelected,
                };
                selectList.Add(selectListItem);
            }

            CitiesViewModel citiesViewModel = new CitiesViewModel();
            citiesViewModel.Cities = selectList;

            return View(citiesViewModel);
        }

        [HttpPost]
        public string CityListBox(IEnumerable<string> selectedCities)
        {
            if (selectedCities == null)
            {
                return "No City Selected";
            }
            else
            {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append("You Selected " + string.Join(",", selectedCities));
                return stringBuilder.ToString();
            }
        }

        public ActionResult PartialviewPractice()
        {
            SampleDataEntities sampleDataEntities = new SampleDataEntities();
            return View(sampleDataEntities.Cities);
        }
    }
}