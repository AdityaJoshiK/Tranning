<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HyperLinkPractice.aspx.cs" Inherits="WebFormPractice.HyperLinkPractice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.google.com/" ForeColor="#CCFF33" ImageUrl="~/Images/logoq.png">HyperLink</asp:HyperLink>
        </div>
    </form>
</body>
</html>
