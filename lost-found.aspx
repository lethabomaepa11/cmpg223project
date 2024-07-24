<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="lost-found.aspx.cs" Inherits="cmpg223project.lost_found" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Lost and Found</h1>
    
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
            <div class="card flex flex-col justify-center items-center  w-100 mb-3">
                <h3>Your Items</h3>
                <p>(Number) items were found linked to reservation code: <asp:Label CssClass="fw-bold" ID="Label2" runat="server" Text="Label"></asp:Label></p>
                <asp:ListBox CssClass="w-100" ID="listItems" runat="server"></asp:ListBox>
                <!--- Use GridView -->
                <p>Fill in the form below to process your claim</p>
                <p class="text-black-50 fs-6">This is to confirm your identity</p>
                <!---Form starts here--->
                    <asp:Label CssClass="form-label" ID="Label4" runat="server" Text="Name and Surname"></asp:Label>
                    <asp:TextBox CssClass="form-control" placeholder="John Doe" ID="txtName" runat="server"></asp:TextBox>
                    <asp:Label CssClass="form-label" ID="Label6" runat="server" Text="Phone Number"></asp:Label>
                    <asp:TextBox CssClass="form-control" placeholder="067 123 1234" ID="txtNumber" type="number" runat="server"></asp:TextBox>
                    <asp:Label CssClass="form-label" ID="Label5" runat="server" Text="Reservation Code"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtConfirmCode" runat="server"></asp:TextBox>
                    <asp:Button CssClass="btn btn-primary mt-2 w-100 mb-3" ID="Button1" runat="server" Text="Claim Items" />
                <!---Form ends here--->
            </div>
        </asp:View>

        <asp:View ID="View3" runat="server">
            Unfortunately, no items were found linking to reservation code: <asp:Label CssClass="fw-bold" ID="Label3" runat="server" Text="Label"></asp:Label>

        </asp:View>
    </asp:MultiView>
    </main>

</asp:Content>
