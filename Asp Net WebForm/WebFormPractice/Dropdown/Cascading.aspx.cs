using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice.Dropdown
{
    public partial class Cascading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlContinents.DataSource =  GetData("spGetContinents", null);
            ddlContinents.DataBind();

            ListItem li = new ListItem("Select Continent", "-1");
            ddlContinents.Items.Insert(0,li);

            ListItem licountry = new ListItem("Select Country", "-1");
            ddlCountries.Items.Insert(0, licountry);

            ListItem licity = new ListItem("Select City", "-1");
            ddlCities.Items.Insert(0, licity);

            ddlCountries.Enabled = false;
            ddlCities.Enabled = false;
        }

        private DataSet GetData(string SPName,SqlParameter SPParmater)
        {
            string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if(SPParmater != null)
            {
                da.SelectCommand.Parameters.Add(SPParmater);
            }

            DataSet DS = new DataSet();
            da.Fill(DS);

            return DS;
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCities_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlContinents_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlContinents.SelectedIndex == 0)
            {

            }
        }
    }
}