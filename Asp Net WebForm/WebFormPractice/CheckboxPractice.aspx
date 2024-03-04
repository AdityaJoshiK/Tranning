<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckboxPractice.aspx.cs" Inherits="WebFormPractice.CheckboxPractice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial">
            <fieldset style="width: 350px">
                <legend><b>Education</b></legend>
                <asp:CheckBox ID="GraduateCheckBox" Checked="true" Text="Graduate" runat="server"
                    oncheckedchanged="GraduateCheckBox_CheckedChanged" />
                <asp:CheckBox ID="PostGraduateCheckBox" Text="Post Graduate" runat="server" />
                <asp:CheckBox ID="DoctrateCheckBox" Text="Doctrate" runat="server" />
            </fieldset>
            &nbsp;
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
        </div>
    </form>
</body>
</html>
