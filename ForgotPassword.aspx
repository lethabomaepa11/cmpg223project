<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="cmpg223project.ForgotPassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="flex flex-col w-screen p-2">
                <h1 class="text-2xl ">Forgot Password</h1>
                <div class="flex flex-col p-3 w-2/3 justify-center items-center gap-3">
                    <asp:Label runat="server" ID="lblError" CssClass="text-red-500"></asp:Label>
                    <div class="flex flex-col items-start">
                        <asp:Label runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" CssClass="w-full" runat="server" placeholder="Email" type="email" ></asp:TextBox>
                    </div>
                    <div class="flex flex-col items-start">
                        <asp:Label runat="server" Text="Phone number:"></asp:Label>
                        <asp:TextBox ID="txtPhone" CssClass="w-full" runat="server" placeholder="Phone number" ></asp:TextBox>
                    </div>
                    <div class="flex flex-col items-start">
                        <asp:Label runat="server" Text="Age:"></asp:Label>
                        <asp:TextBox ID="txtAge" CssClass="w-full" runat="server" placeholder="Age" type="number" ></asp:TextBox>
                    </div>

                    <asp:Button runat="server" Text="Reset Password" OnClick="Reset_Click" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="flex flex-col justify-center items-center my-10">
                <div class="flex flex-col items-start">
                    <asp:Label runat="server" Text="New Password:"></asp:Label>
                    <asp:TextBox ID="txtNewPassword" CssClass="w-full" runat="server" type="password" placeholder="*****" ></asp:TextBox>
                </div>
                <asp:Button runat="server" Text="Change Password" OnClick="Change_Click" />

            </div>
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
