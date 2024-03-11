<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListFormBasic.aspx.cs" Inherits="WebFormPractice.ListBox.ListFormBasic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Rows="2">
            <asp:ListItem Text="Diploma" Value="1"></asp:ListItem>
            <asp:ListItem Text="Graduate" Value="2"></asp:ListItem>
            <asp:ListItem Text="Post Graduate" Value="3"></asp:ListItem>
            <asp:ListItem Text="Doctrate" Value="4"></asp:ListItem>
        </asp:ListBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

    </form>
</body>
</html>
