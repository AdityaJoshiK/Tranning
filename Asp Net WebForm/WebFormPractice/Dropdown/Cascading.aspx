<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cascading.aspx.cs" Inherits="WebFormPractice.Dropdown.Cascading" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="ddlContinents" Width="200px" DataTextField="ContinentName"
            DataValueField="ContinentId" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="ddlContinents_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="ddlCountries" DataValueField="CountryId"
            DataTextField="CountryName" Width="200px" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        <asp:DropDownList ID="ddlCities" Width="200px" DataTextField="CityName"
            DataValueField="CityId" runat="server" OnSelectedIndexChanged="ddlCities_SelectedIndexChanged">
        </asp:DropDownList>

    </form>
</body>
</html>
