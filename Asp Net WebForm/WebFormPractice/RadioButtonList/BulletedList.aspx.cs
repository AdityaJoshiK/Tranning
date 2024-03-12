using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice.RadioButtonList
{
    public partial class BulletedList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CountriesBulletedList_Click(object sender, BulletedListEventArgs e)
        {
            ListItem li = CountriesBulletedList.Items[e.Index];
            Response.Write("Text = " + li.Text + "<br/>");
            Response.Write("Value = " + li.Value + "<br/>");
            Response.Write("Index = " + e.Index.ToString());
        }
    }
}