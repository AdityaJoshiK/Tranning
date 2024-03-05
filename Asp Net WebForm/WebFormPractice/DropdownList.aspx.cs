using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class DropdownList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Manually Bind DropdownList
            if (!IsPostBack)
            {
                ListItem maleListItem = new ListItem("Male", "1");
                ListItem femaleListItem = new ListItem("Female", "2");

                DropDownList2.Items.Add(maleListItem);
                DropDownList2.Items.Add(femaleListItem);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}