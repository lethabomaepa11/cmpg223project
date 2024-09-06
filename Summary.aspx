<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Summary.aspx.cs" Inherits="cmpg223project.Summary" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="text-bg-dark text-center">
            <h1>Summary</h1>
            <p>Confirmation of Information</p>
        </div>
        <div class="container">
                <div class="row">
                <div class="col-sm-12">
                    <button class="bg-blue-500 text-white p-3 my-1 rounded" onclick="window.print()">Download Page</button>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th scope="row" style="width: 80px;">First Name</th>
                                <td style="width: 200px;"><asp:Label runat="server" ID="lblName"></asp:Label></td>
                            </tr>
                            <tr>
                                <th scope="row">Last Name</th>
                                <td><asp:Label runat="server" ID="lblSurname"></asp:Label></td>
                            </tr>
                            <tr>
                                <th scope="row">Email</th>
                                <td><asp:Label runat="server" ID="lblEmail"></asp:Label></td>
                            </tr>
                            <tr>
                                <th scope="row">Phone Number</th>
                                <td><asp:Label runat="server" ID="lblPhone"></asp:Label></td>
                            </tr>
                            <tr>
                                <th scope="row">Reservance code</th>
                                <td><asp:Label runat="server" ID="lblCode"></asp:Label></td>
                            </tr>
                            <tr>
                            <th scope="row">Rooms Booked</th>
                            <td><asp:Label runat="server" ID="lblNumRooms"></asp:Label></td>
                            </tr>
                            <tr>
                            <th scope="row">Total Amount</th>
                            <td>R <asp:Label runat="server" ID="lblAmount"></asp:Label></td>
                            </tr>
                            <tr>
                            <th scope="row">Number of people</th>
                            <td><asp:Label runat="server" ID="lblNumPeople"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
</asp:Content>
