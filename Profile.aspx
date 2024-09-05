<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="cmpg223project.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        const back = () => {
            history.go(-1);
        }
    </script>

        <div class="p-4 w-full flex justify-between">
            <a href="javascript: history.go(-1)"><i style="font-size: 1.3rem" class="fa fa-arrow-left"></i> Back</a> 
            <asp:LinkButton runat="server" ID="logout" CssClass="p-3 rounded bg-red-500 text-white" OnClick="Logout"><i class="fa fa-right-from-bracket"></i> Logout</asp:LinkButton>
        </div>
        <asp:Panel ID="ViewPanel" runat="server" Height="275px">
            <div class="flex flex-col gap-2 p-5 card">
                <h2 class="font-bold text-xl">View Profile</h2>
                <p>
                    Name:
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                </p>
                <p>
                    Surname:
                    <asp:Label ID="lblSurname" runat="server"></asp:Label>
                </p>
                <p>
                    Email Address:
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </p>
                <p>
                    Cell Number:
                    <asp:Label ID="lblCellNumber" runat="server"></asp:Label>
                </p>
                <p>
                    &nbsp;</p>
                <p>
                    <asp:Button ID="btnEditInfo" runat="server" OnClick="btnEditInfo_Click" Text="Edit Info" Width="144px" />
                </p>
           </div>
            <hr />
            <div class="flex w-full justify-around divide-x h-[70vh]">
                <div class="w-2/4 p-5">
                    <h1 class="text-lg font-bold">Your lostfound items</h1>
                    <asp:GridView ID="gridClaimedLostFound" runat="server">
                        <RowStyle ForeColor="white" BackColor="#1f2937" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#374151" Font-Bold="True" ForeColor="#9ca3af" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>
                
                <div class="w-2/4 p-5">
                    <h1 class="text-lg font-bold">History</h1>
                    <asp:GridView ID="gridBookings" runat="server">
                        <RowStyle ForeColor="white" BackColor="#1f2937" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="#374151" Font-Bold="True" ForeColor="#9ca3af" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>
                
            </div>
        </asp:Panel>
        <asp:Panel ID="EditPanel" runat="server" CssClass="w-full" Height="289px" style="margin-top: 22px;padding: 1rem;display:flex;justify-content:center;align-items:center;flex-direction:column">
            <h2 class="text-2xl">Edit Profile</h2>
            <div class="grid grid-cols-2 gap-2 align-items-center justify-center w-2/4">
            <p style="font-weight: 700">
                Name:
                
            </p>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <p style="font-weight: 700">
                Surname:
                
            </p>
            <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            <p style="font-weight: 700">
                Email Address:
            </p>
            <asp:TextBox CssClass="bg-slate-300" ID="txtEmail" runat="server" disabled></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid email address!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            <p style="font-weight: 700">
                Cell Number:
            </p>
            <asp:TextBox ID="txtCellNumber" runat="server"></asp:TextBox>
            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save Changes" />
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" style="background-color: red;" Text="Cancel" />

            </div>
         </asp:Panel>
</asp:Content>