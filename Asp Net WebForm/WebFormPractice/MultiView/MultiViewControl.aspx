<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiViewControl.aspx.cs" Inherits="WebFormPractice.MultiView.MultiViewControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div style="font-family: Arial">
    <asp:MultiView ID="multiViewEmployee" runat="server">
        <asp:View ID="viewPersonalDetails" runat="server">
            <table style="border:1px solid black">
                <tr>
                    <td colspan="2">
                        <h2>Step 1 - Personal Details</h2>
                    </td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right">
                        <asp:Button ID="btnGoToStep2" runat="server" 
                        Text="Step 2 >>" onclick="btnGoToStep2_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>    
        <asp:View ID="viewContactDetails" runat="server">
            <table style="border:1px solid black">
                <tr>
                    <td colspan="2">
                        <h2>Step 2 - Contact Details</h2>
                    </td>
                </tr>
                <tr>
                    <td>Email Address</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnBackToStep1" runat="server" Text="<< Step 1" 
                            onclick="btnBackToStep1_Click" />
                    </td>
                    <td style="text-align:right">
                        <asp:Button ID="btnGoToStep3" runat="server" Text="Step 3 >>" 
                            onclick="btnGoToStep3_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewSummary" runat="server">
            <table style="border:1px solid black">
                <tr>
                    <td colspan="2"><h2>Step 3 - Summary</h2></td>
                </tr>
                <tr>
                    <td colspan="2"><h3>Personal Details</h3></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>
                        :<asp:Label ID="lblFirstName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>
                        :<asp:Label ID="lblLastName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        :<asp:Label ID="lblGender" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><h3>Contact Details</h3></td>
                </tr>
                <tr>
                    <td>Email Address</td>
                    <td>
                        :<asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td>
                        :<asp:Label ID="lblMobile" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="<< Step 2" 
                            onclick="Button1_Click" />
                    </td>
                    <td style="text-align:right">
                        <asp:Button ID="Button2" runat="server" Text="Submit >>" 
                            onclick="Button2_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</div>


    </form>
</body>
</html>
