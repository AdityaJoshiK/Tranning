using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class CheckboxPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PostGraduateCheckBox.Focus();
                GraduateCheckBox.Checked = true;
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sbUserChoices = new StringBuilder();
            if (GraduateCheckBox.Checked)
            {
                sbUserChoices.Append(GraduateCheckBox.Text);
            }
            if (PostGraduateCheckBox.Checked)
            {
                sbUserChoices.Append(", " + PostGraduateCheckBox.Text);
            }
            if (DoctrateCheckBox.Checked)
            {
                sbUserChoices.Append(", " + DoctrateCheckBox.Text);
            }
            Response.Write("Your Selections: " + sbUserChoices.ToString());
        }

        protected void GraduateCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            Response.Write("Graduate Checkbox Selection changed");
        }
    }
}