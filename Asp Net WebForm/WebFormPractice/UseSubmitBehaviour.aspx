<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UseSubmitBehaviour.aspx.cs" Inherits="WebFormPractice.UseSubmitBehaviour" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial">
            <strong>Name : </strong>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
            &nbsp;
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
        </div>
    </form>
</body>
</html>
