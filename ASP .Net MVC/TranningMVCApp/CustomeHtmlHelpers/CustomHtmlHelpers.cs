using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TranningMVCApp.CustomeHtmlHelpers
{
    public static class CustomHtmlHelpers
    {
        public static IHtmlString Images(this HtmlHelper helper, string src, string alt)
        {
            TagBuilder tb = new TagBuilder("img");
            tb.Attributes.Add("src", VirtualPathUtility.ToAbsolute(src));
            tb.Attributes.Add("alt", alt);

            //If you not want to return as IHtmlString and want to return as string then it will display as html tag to solve this use IHtmlString

            return new MvcHtmlString(tb.ToString(TagRenderMode.SelfClosing));
        }
    }
}