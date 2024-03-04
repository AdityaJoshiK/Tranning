using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class HyperLinkPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if focus on hyperlink when page opens
            HyperLink1.Focus();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}