<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommandEventPractice.aspx.cs" Inherits="WebFormPractice.CommandEventPractice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function showAlert() {
            alert('Button clicked!');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick="showAlert()" Text="Button" />
        </div>
    <asp:Button ID="PrintButton" runat="server" Text="Print" OnCommand="CommandButton_Click" CommandName="Print" OnClick="PrintButton_Click" />

    <asp:Button ID="DeletButton" runat="server" Text="Delete" OnCommand="CommandButton_Click" CommandName="Delete" OnClick="DeletButton_Click" />



    <asp:Button ID="Top10Button" runat="server" Text="Show Top 10 Employees" OnCommand="CommandButton_Click"
        CommandName="Show" CommandArgument="Top10" OnClick="Top10Button_Click" />

    <asp:Button ID="Bottom10Button" runat="server" Text="Show Bottom 10 Employees" OnCommand="CommandButton_Click"
        CommandName="Show" CommandArgument="Bottom10" OnClick="Bottom10Button_Click" />

    <asp:Label ID="OutputLabel" runat="server"></asp:Label>
    </form>

</body>
</html>
