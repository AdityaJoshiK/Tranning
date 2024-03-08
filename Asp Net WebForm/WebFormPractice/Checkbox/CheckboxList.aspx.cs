using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice.Checkbox
{
    public partial class CheckboxList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)    
        {
            if (checkboxListEducation.SelectedIndex != -1)
            {
                Response.Write(checkboxListEducation.SelectedItem.Text);
            }
            //foreach(ListItem li in checkboxListEducation.Items)
            //{
            //    if (li.Selected)
            //    {
            //        Response.Write("Text = " + li.Text + ", ");
            //        // Retrieve the value of the selected list item
            //        Response.Write("Value = " + li.Value + ", ");
            //        // Retrieve the index of the selected list item
            //        Response.Write("Index = " + checkboxListEducation.Items.IndexOf(li).ToString());
            //        Response.Write("<br/>");
            //    }
            //}
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in checkboxListEducation.Items)
            {
                li.Selected = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in checkboxListEducation.Items)
            {
                li.Selected = true;
            }
        }
    }
}