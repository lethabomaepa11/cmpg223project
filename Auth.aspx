<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="cmpg223project.Auth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="RegisterView" runat="server">
                <p>Register</p>
                <asp:LinkButton runat="server" OnClick="ToLogin">Login here...</asp:LinkButton>
            </asp:View>
            <asp:View ID="LoginView" runat="server">
                <p>Login</p>
                <asp:LinkButton runat="server" OnClick="ToRegister">Register here...</asp:LinkButton>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
