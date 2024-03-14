<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalenderControl.aspx.cs" Inherits="WebFormPractice.CalenderControl.CalenderControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" Width="115px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" />
            <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender"
                OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        </div>
    </form>
</body>
</html>
