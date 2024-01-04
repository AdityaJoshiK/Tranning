using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Common
{
    public class CurrentDateAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            DateTime dateTime = Convert.ToDateTime(value);

            if (dateTime<=DateTime.Now)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}