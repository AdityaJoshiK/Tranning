<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropdownUsingXML.aspx.cs" Inherits="WebFormPractice.DropdownUsingXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
