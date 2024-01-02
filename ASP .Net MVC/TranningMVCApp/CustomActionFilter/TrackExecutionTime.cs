using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TranningMVCApp.CustomActionFilter
{
    public class TrackExecutionTime : ActionFilterAttribute, IExceptionFilter
    {
        private void LogExecutionTime(string data)
        {
            File.AppendAllText(HttpContext.Current.Server.MapPath("~/CustomActionFilter/Data.txt"), data);
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string msg = "\n" + filterContext.ActionDescriptor.ControllerDescriptor.ControllerName +
                " -> " + filterContext.ActionDescriptor.ActionName + "-> OnActionExecuting \t- " +
                DateTime.Now.ToString() + "\n";
            LogExecutionTime(msg);
            LogExecutionTime("-----------------------------------");
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            string msg = "\n" + filterContext.ActionDescriptor.ControllerDescriptor.ControllerName +
    " -> " + filterContext.ActionDescriptor.ActionName + "-> OnActionExecuted \t- " +
    DateTime.Now.ToString() + "\n";
            LogExecutionTime(msg);
            LogExecutionTime("-----------------------------------");
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            string msg = "\n" + filterContext.RouteData.Values["controller"] +
    " -> " + filterContext.RouteData.Values["action"] + "-> OnResultExecuting \t- " +
    DateTime.Now.ToString() + "\n";
            LogExecutionTime(msg);
            LogExecutionTime("-----------------------------------");
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            string msg = "\n" + filterContext.RouteData.Values["controller"] +
" -> " + filterContext.RouteData.Values["action"] + "-> OnResultExecuted \t- " +
DateTime.Now.ToString() + "\n";
            LogExecutionTime(msg);
            LogExecutionTime("-----------------------------------");
        }

        void IExceptionFilter.OnException(ExceptionContext filterContext)
        {
            string msg = "\n" + filterContext.RouteData.Values["controller"] +
" -> " + filterContext.RouteData.Values["action"] + "->"+ filterContext.Exception.Message + " \t- " +
DateTime.Now.ToString() + "\n";
            LogExecutionTime(msg);
            LogExecutionTime("-----------------------------------");
        }
    }
}