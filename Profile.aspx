<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="cmpg223project.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Panel ID="ViewPanel" runat="server" Height="275px">
            <h2>View Profile</h2>
            <p style="font-weight: 700">
                Name:
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                Surname:
                <asp:Label ID="lblSurname" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                Email Address:
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                Cell Number:
                <asp:Label ID="lblCellNumber" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                &nbsp;</p>
            <p style="font-weight: 700">
                <asp:Button ID="btnEditInfo" runat="server" OnClick="btnEditInfo_Click" Text="Edit Info" Width="144px" />
            </p>
        </asp:Panel>
        <asp:Panel ID="EditPanel" runat="server" Height="289px" style="margin-top: 22px">
            <h2>Edit Profile</h2>
            <p style="font-weight: 700">
                Name:
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </p>
            <p style="font-weight: 700">
                Surname:
                <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            </p>
            <p style="font-weight: 700">
                Email Address:
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid email address!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </p>
            <p style="font-weight: 700">
                Cell Number:
                <asp:TextBox ID="txtCellNumber" runat="server"></asp:TextBox>
            </p>
            <p style="font-weight: 700">
                &nbsp;</p>
            <p style="font-weight: 700">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save Changes" Width="144px" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Width="142px" />
            </p>
        </asp:Panel>
    </form>
</body>
</html>
