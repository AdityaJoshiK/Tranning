﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dropdownwithdb.aspx.cs" Inherits="WebFormPractice.Dropdownwithdb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="CityName" DataValueField="CityId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
