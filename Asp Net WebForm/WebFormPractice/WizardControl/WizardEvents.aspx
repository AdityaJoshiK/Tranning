<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WizardEvents.aspx.cs" Inherits="WebFormPractice.WizardControl.WizardEvents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-family: Arial">
            <asp:Wizard ID="Wizard1" runat="server"
                OnActiveStepChanged="Wizard1_ActiveStepChanged"
                OnCancelButtonClick="Wizard1_CancelButtonClick"
                OnNextButtonClick="Wizard1_NextButtonClick"
                OnFinishButtonClick="Wizard1_FinishButtonClick"
                OnPreviousButtonClick="Wizard1_PreviousButtonClick"
                OnSideBarButtonClick="Wizard1_SideBarButtonClick">
                <SideBarStyle VerticalAlign="Top" />
                <WizardSteps>
                    <asp:WizardStep runat="server" Title="Step 1">
                        <asp:CheckBox ID="chkBoxCancel" Text="Cancel Navigation" runat="server" />
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Step 2">
                    </asp:WizardStep>
                    <asp:WizardStep runat="server" Title="Step 3">
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>
        </div>

    </form>
</body>
</html>
