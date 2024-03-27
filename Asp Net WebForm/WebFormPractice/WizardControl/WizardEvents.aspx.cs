using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice.WizardControl
{
    public partial class WizardEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // ActiveStepChanged - Fires when the active step of the index is changed.
        protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
        {
            Response.Write("Active Step Changed to " + Wizard1.ActiveStepIndex.ToString() + "<br/>");
        }
        // CancelButtonClick - Fires when the cancel button of the wizard control is clicked. 
        // To display the cancel button, set DisplayCancelButton=True.
        protected void Wizard1_CancelButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("Cancel Button Clicked");
        }
        // NextButtonClick - Fires when the next button of the wizard control is clicked. 
        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Response.Write("Current Step Index = " + e.CurrentStepIndex.ToString() + "<br/>");
            Response.Write("Next Step Index = " + e.NextStepIndex.ToString() + "<br/>");
            if (chkBoxCancel.Checked)
            {
                Response.Write("Navigation to next step will be cancelled");
                e.Cancel = true;
            }
        }
        // FinishButtonClick - Fires when the finish button is clicked
        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Response.Write("Finish button clicked <br/>");
            Response.Write("Current Step Index = " + e.CurrentStepIndex.ToString() + "<br/>");
            Response.Write("Next Step Index = " + e.NextStepIndex.ToString());
        }
        // PreviousButtonClick - Fires when the previous button is clicked
        protected void Wizard1_PreviousButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Response.Write("Previous button clicked<br/>");
        }
        // SideBarButtonClick - Fires when the sidebar button is clicked
        protected void Wizard1_SideBarButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Response.Write("Sidebar button clicked<br/>");
        }
    }
}