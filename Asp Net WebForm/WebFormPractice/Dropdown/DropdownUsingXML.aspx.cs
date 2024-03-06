using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class DropdownUsingXML : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            string path = Server.MapPath("Countries.xml");
            ds.ReadXml(path);

            DropDownList1.DataTextField = "CountryName";
            DropDownList1.DataValueField = "CountryID";
            DropDownList1.DataSource = ds;
            DropDownList1.DataBind();

            //Insert Default "Select" Parameter
            ListItem li = new ListItem("Select","-1");
            DropDownList1.Items.Insert(0,li);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}