<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckboxList.aspx.cs" Inherits="WebFormPractice.Checkbox.CheckboxList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBoxList ID="checkboxListEducation" runat="server"
                RepeatDirection="Horizontal" RepeatColumns="2">
                <asp:ListItem Text="Diploma" Value="1"></asp:ListItem>
                <asp:ListItem Text="Graduate" Value="2"></asp:ListItem>
                <asp:ListItem Text="Post Graduate" Value="3"></asp:ListItem>
                <asp:ListItem Text="Doctrate" Value="4"></asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="SelectAll" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Deselectall" />
        </div>

    </form>
</body>
</html>
