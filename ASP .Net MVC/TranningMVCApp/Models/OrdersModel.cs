using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TranningMVCApp.Models
{
    [MetadataType(typeof(OrdersMetaData))]
    public partial class Orders
    {
    }

    public class OrdersMetaData
    {
        //If you don't want to display a column use ScaffoldColumn attribute.
        //This only works when you use @Html.DisplayForModel() helper
        [ScaffoldColumn(false)]
        [Display(Name = "ID")]
        [DisplayFormat(NullDisplayText = "Not Specified")]
        public Nullable<int> CustomerID { get; set; }

        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy hh:mm:ss tt}")]
        //To get time in 24 hour notation
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy HH:mm:ss}")]

        //To get time in 12 hour notation with AM PM
        //[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy hh:mm:ss tt}")]
        [DisplayName("Order Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
        public Nullable<System.DateTime> OrderDateTime { get; set; }

        // Display mailto hyperlink
        [DataType(DataType.EmailAddress)]
        public string EmailAddress { get; set; }

        // Display currency symbol. For country specific currency, set 
        // culture using globalization element in web.config. 
        // For Great Britain Pound symbol
        // <globalization culture="en-gb"/>
        [DataType(DataType.Currency)]
        public int? Salary
        {
            get; set;

        }

        // Generate a hyperlink
        [DataType(DataType.Url)]
        public string PersonalWebSite { get; set; }

        // Display only Time Part
        // [DataType(DataType.Time)]
        // Display only Date Part
        [DataType(DataType.Date)]
        public DateTime? HireDate { get; set; }

        //DisplayColumn attribute is useful, when a class has a property of complex type, and you want to pick one property
        //of this complex object for display purpose. 
        /*
         [DisplayColumn("FullName")]
         public partial class Employee
         {
         }

        //from all attributes it display only full name


        //[DataType(DataType.Url)]
        [UIHint("newtaburl")]
        public string PersonalWebSite { get; set; }

        //UIhint use to specify how this url will be treated
         */

        //HiddenInput attribute is useful when you want to render a property using input type=hidden.
        [HiddenInput(DisplayValue = false)]
        public int Id { get; set; }

        //Readonly attribute, in view it is visible and we can change it also but it will be not updatedin db because it is readonly
        [ReadOnly(true)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
    }
}