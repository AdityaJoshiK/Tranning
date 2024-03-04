<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButtonPractice.aspx.cs" Inherits="WebFormPractice.ButtonPractice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick="alert('You are about to submit this page')" Text="Submit" />
            <br />
        </div>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('You are about to submit this page')" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
        <br />
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/logo.png" OnClick="ImageButton1_Click" />
    </form>
</body>
</html>
