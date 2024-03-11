<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadioButtonListBasics.aspx.cs" Inherits="WebFormPractice.RadioButtonList.RadioButtonListBasics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:RadioButtonList ID="ColorRadioButtonList" runat="server"
                RepeatDirection="Horizontal">
                <asp:ListItem Text="Red" Value="1"></asp:ListItem>
                <asp:ListItem Text="Green" Value="2"></asp:ListItem>
                <asp:ListItem Text="Blue" Value="3"></asp:ListItem>
                <asp:ListItem Text="Orange" Value="4"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                OnClick="btnSubmit_Click" />&nbsp;
            <asp:Button ID="btnClearSelection" runat="server" Text="Clear Selection"
                OnClick="btnClearSelection_Click" />
        </div>
    </form>
</body>
</html>
