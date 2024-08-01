<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="lost-found.aspx.cs" Inherits="cmpg223project.lost_found" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:label runat="server" ID="lblTest" class="text-2xl font-bold">Lost and Found Claims</asp:label>
    
    <main class="flex flex-col justify-center items-center">
        
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <p class="text-black-50">
                If you have lost or forgot your items in the room you were occupying, please fill in the form to check if any items were found.
            </p>
            
                <div class="card mt-5 p-5 g-3 justify-content-center align-items-center">
                    <asp:Label CssClass="form-label" ID="Label1" runat="server" Text="Enter Reservation code to proceed"></asp:Label>
                    <asp:TextBox placeholder="Code" CssClass="form-control" ID="txtReservationCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Reservation Code is required to proceed!!" ControlToValidate="txtReservationCode"></asp:RequiredFieldValidator>
                    <asp:Button CssClass="btn btn-primary w-75" ID="btnCheckItems" runat="server" Text="Check Items" OnClick="btnCheckItems_Click" />

                </div>
           
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="card flex flex-col md:flex-row justify-around items-start p-3 w-100 mb-3">
                <div>
                    <p>Fill in the form below to process your claim</p>
                    <p class="text-black-50 fs-6">This is to confirm your identity</p>
                    <!---Form starts here--->
                        <asp:Label CssClass="form-label" ID="Label4" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox CssClass="form-control" placeholder="johndoe@mail.com" ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:Label CssClass="form-label" ID="Label6" runat="server" Text="Phone Number"></asp:Label>
                        <asp:TextBox CssClass="form-control" placeholder="067 123 1234" ID="txtNumber" type="number" runat="server"></asp:TextBox>
                        <asp:Label CssClass="form-label" ID="Label5" runat="server" Text="Reservation Code"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txtConfirmCode" runat="server"></asp:TextBox>
                        <asp:Button CssClass="btn btn-primary mt-2 w-100 mb-3" ID="Button1" runat="server" Text="Claim Items" OnClick="ClaimItems" />
                    <!---Form ends here--->
                </div>
                <div>
                    <h3>Your Items</h3>
                    <p><asp:Label runat="server" ID="lblNumItems"></asp:Label>items were found linked to reservation code: <asp:Label CssClass="fw-bold" ID="Label2" runat="server" Text="Label"></asp:Label></p>
                    <div class="h-100 overflow-auto">
                        <asp:GridView ID="gridLostFound" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
                    </div>
                </div>
            </div>
        </asp:View>

        <asp:View ID="View3" runat="server">
            Unfortunately, no items were found linking to reservation code: <asp:Label CssClass="fw-bold" ID="Label3" runat="server" Text="Label"></asp:Label>

        </asp:View>
    </asp:MultiView>
    </main>

</asp:Content>
