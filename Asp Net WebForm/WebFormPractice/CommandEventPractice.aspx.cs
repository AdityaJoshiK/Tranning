using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class CommandEventPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Inserting Event In Button Manually
            Button1.Click += new EventHandler(Button1_ClickNew);
            Button1.Command += new CommandEventHandler(Button1_CommandNew);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("Button  Click Event <br/>");
        }   
        protected void Button1_ClickNew(object sender, EventArgs e)
        {
            Response.Write("Button Click New Event <br/>");
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
             Response.Write("Button Command Event <br/>");
        }        

        protected void Button1_CommandNew(object sender, CommandEventArgs e)
        {
            Response.Write("Button Command New Event");
        }

        protected void Top10Button_Click(object sender, EventArgs e)
        {

        }

        protected void Bottom10Button_Click(object sender, EventArgs e)
        {

        }

        protected void PrintButton_Click(object sender, EventArgs e)
        {

        }

        protected void DeletButton_Click(object sender, EventArgs e)
        {

        }

        protected void CommandButton_Click(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Print":
                    OutputLabel.Text = "You clicked Print Button";
                    break;
                case "Delete":
                    OutputLabel.Text = "You clicked Delete Button";
                    break;
                case "Show":
                    if (e.CommandArgument.ToString() == "Top10")
                    {
                        OutputLabel.Text = "You clicked Show Top 10 Employees Button";
                    }
                    else
                    {
                        OutputLabel.Text = "You clicked Show Bottom 10 Employees Button";
                    }
                    break;
                default:
                    OutputLabel.Text = "We don't know which button you clicked";
                    break;
            }
        }
    }
}