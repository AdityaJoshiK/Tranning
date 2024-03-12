<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BulletedList.aspx.cs" Inherits="WebFormPractice.RadioButtonList.BulletedList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:BulletedList ID="CountriesBulletedList" runat="server"
            BulletStyle="Numbered" DisplayMode="HyperLink" OnClick="CountriesBulletedList_Click">
            <asp:ListItem Text="Google" Value="http://google.com"></asp:ListItem>
            <asp:ListItem Text="Youtube" Value="http://Youtube.com"></asp:ListItem>
            <asp:ListItem Text="Blogger" Value="http://Blooger.com"></asp:ListItem>
            <asp:ListItem Text="Gmail" Value="http://Gmail.com"></asp:ListItem>
        </asp:BulletedList>


        <asp:BulletedList ID="BulletedList1" runat="server"
            DisplayMode="LinkButton" OnClick="CountriesBulletedList_Click">
            <asp:ListItem Text="Google" Value="1"></asp:ListItem>
            <asp:ListItem Text="Microsoft" Value="2"></asp:ListItem>
            <asp:ListItem Text="Dell" Value="3"></asp:ListItem>
            <asp:ListItem Text="IBM" Value="4"></asp:ListItem>
        </asp:BulletedList>
    </form>
</body>
</html>
