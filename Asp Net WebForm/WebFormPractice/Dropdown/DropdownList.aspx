<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropdownList.aspx.cs" Inherits="WebFormPractice.DropdownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="1">Male</asp:ListItem>
                <asp:ListItem Value="2">Female</asp:ListItem>
                <%--Enable and Disable Option--%>
                <asp:ListItem Value="3" Text="Other" Enabled="false"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <p>
            <%--//Manually Create Drodpown Option On Page Load--%>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
        </p>
    </form>
</body>
</html>
