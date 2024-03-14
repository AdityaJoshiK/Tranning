using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class FileUploadPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension  = System.IO.Path.GetExtension(FileUpload1.FileName);

                if(fileExtension.ToLower() != ".doc" && fileExtension.ToLower() != ".docx")
                {
                    Label1.Text = "Only files with .doc and .docx extension are allowed";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }

                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Images/" + FileUpload1.FileName));
                    Label1.Text = "File Uploaded";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                int filesize = FileUpload1.PostedFile.ContentLength;

                if(filesize > 2097152)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "File size cannot be greater than 2 MB";
                }
                else { 
                    Label1.Text = "Please Select a File";
                    Label1.ForeColor = System.Drawing.Color.Red;
                
                }
            }
        }
    }
}