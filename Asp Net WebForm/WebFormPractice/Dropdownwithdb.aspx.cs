using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class Dropdownwithdb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //to prevent db call on everytime page refresh
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("Select CityId, CityName, Country from tblCity", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DropDownList1.DataSource = rdr;

                    //Instead Of this we can directly set it into drodpown
                    //DropDownList1.DataValueField = "CityId";
                    //DropDownList1.DataTextField = "CityName";

                    DropDownList1.DataBind();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}