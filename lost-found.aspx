<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="lost-found.aspx.cs" Inherits="cmpg223project.lost_found" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Lost and Found</h1>
    
    
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <p class="text-black-50">
                If you have lost or forgot your items in the room you were occupying, please fill in the form to check if any items were found.
            </p>
            <div class="w-100 flex justify-content-between align-items-center">
                <div class="card p-5 g-3 justify-content-center align-items-center">
                    <asp:Label CssClass="form-label" ID="Label1" runat="server" Text="Enter Reservation code to proceed"></asp:Label>
                    <asp:TextBox placeholder="Code" CssClass="form-control" ID="txtReservationCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Reservation Code is required to proceed!!" ControlToValidate="txtReservationCode"></asp:RequiredFieldValidator>
                    <asp:Button CssClass="btn btn-primary w-75" ID="btnCheckItems" runat="server" Text="Check Items" OnClick="btnCheckItems_Click" />

                </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h3>This will show the items that were linked to the reservation code</h3>
            (Number) items were found linked to reservation code:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <h3>This will show the message explaining that no items were found</h3><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>

        </asp:View>
    </asp:MultiView>
    

</asp:Content>
