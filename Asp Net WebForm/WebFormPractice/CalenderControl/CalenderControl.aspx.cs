using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice.CalenderControl
{
    public partial class CalenderControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;

                //Method of date
                //Response.Write("ToString() - " + DateTime.Now.ToString() + "<br/>");
                //Response.Write("ToLongDateString() - " + DateTime.Now.ToLongDateString() + "<br/>");
                //Response.Write("ToShortDateString() - " + DateTime.Now.ToShortDateString() + "<br/>");
                //Response.Write("ToLongTimeString() - " + DateTime.Now.ToLongTimeString() + "<br/>");
                //Response.Write("ToShortTimeString() - " + DateTime.Now.ToShortTimeString() + "<br/>");
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsWeekend || e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.LightGray;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}