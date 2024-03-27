<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WizadControl.aspx.cs" Inherits="WebFormPractice.WizardControl.WizadControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>
    <asp:Wizard ID="Wizard1" runat="server" 
        onfinishbuttonclick="Wizard1_FinishButtonClick" 
        onnextbuttonclick="Wizard1_NextButtonClick" ActiveStepIndex="1" DisplayCancelButton="True">
        <SideBarStyle HorizontalAlign="Left" VerticalAlign="Top" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" StepType="Start" Title="Step 1 - Personal Details">
                <table style="border: 1px solid black">
                    <tr>
                        <td>
                            First Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server">
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" StepType="Step" Title="Step 2 - Contact Details">
                <table style="border: 1px solid black">
                    <tr>
                        <td>
                            Email Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile Number
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" StepType="Finish" Title="Step 3 - Summary">
                <table style="border: 1px solid black">
                    <tr>
                        <td colspan="2">
                            <h3>
                                Personal Details</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            First Name
                        </td>
                        <td>
                            :<asp:Label ID="lblFirstName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name
                        </td>
                        <td>
                            :<asp:Label ID="lblLastName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            :<asp:Label ID="lblGender" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>
                                Contact Details</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email Address
                        </td>
                        <td>
                            :<asp:Label ID="lblEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile Number
                        </td>
                        <td>
                            :<asp:Label ID="lblMobile" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</div>

    </form>
</body>
</html>
