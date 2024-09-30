<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="cmpg223project.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Payment: PotchStream</title>
        <link href="Content/boostrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="icons/css/all.min.css"/>
    <script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="icons/css/all.min.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <style type="text/css">

        .auto-style1 {
            width: 658px;
        }
        .auto-style2 {
            width: 660px;
        }
        input{
            padding: 20px;
            border-radius: 10px;
            border: 2px solid #ccc;
            outline-color: #4CAF50;
            width: 100%;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;

        }
        table, .table{
            border: 2px solid #ddd;
            border-radius: 8px;
        }
        table tr, table td{
            border: 2px solid #ddd;
            padding: 5px;
            border-radius: 8px;
        }
    </style>
    <link rel="stylesheet" href="CSS.css" />
</head>
    
<body>
    <form id="form1" runat="server" class="p-2 flex justify-around items-center gap-5">
        <div class="flex flex-col w-2/4">
            <a class="underline text-blue-500 m-2" href="javascript: history.go(-1)"><i style="font-size: 1.3rem" class="fa fa-arrow-left"></i> Back</a> 
            <asp:Label ID="Label6" runat="server" CssClass="text-3xl" Text="Payment Details"></asp:Label>
            <span>Credit/Debit Card</span>
            <div class="icons flex">
            <img src="https://i.imgur.com/2ISgYja.png" width="30">
            <img src="https://i.imgur.com/W1vtnOV.png" width="30">
            <img src="https://i.imgur.com/35tC99g.png" width="30">
            <img src="https://i.imgur.com/2ISgYja.png" width="30">
            </div>
            <asp:Label ID="Label4" runat="server" Text="Card Number"></asp:Label>

            <asp:TextBox ID="TextBox2" runat="server" placeholder="XXXX XXXX XXXX XXXX"></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="Expiry"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" placeholder="MM/YY"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="CVV/CVC"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" placeholder="XXX"></asp:TextBox>

            <div>
                <div class="btn btn-primary mb-3">
                    <asp:Label runat="server" ID="lblAmount" Text="Total Payment: "></asp:Label>
                    <span class="fas fa-arrow-right"></span>
                </div>
            </div>
        </div>
        <div class="flex flex-col w-2/4">
            <p>You can edit your booking info if you want to change it.</p>
            <table  class="table table-bordered">
                <tbody>
                    <tr>
                        <th scope="row" style="width: 80px;">First Name</th>
                        <td style="width: 200px;"><asp:Label runat="server" CssClass="name" ID="lblName"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Last Name</th>
                        <td><asp:Label runat="server" CssClass="name" ID="lblSurname"></asp:Label></td>
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
                        <th scope="row">Check-In date</th>
                        <td><asp:Label runat="server" ID="lblCheckIn"></asp:Label></td>
                    </tr>
                    <tr>
                        <th scope="row">Check-Out date</th>
                        <td><asp:Label runat="server" ID="lblCheckOut"></asp:Label></td>
                    </tr>
                    <tr>
                    <th scope="row">Rooms Booked</th>
                    <td><asp:Label runat="server" ID="lblNumRooms"></asp:Label></td>
                    </tr>
                    <tr>
                    <th scope="row">Number of people</th>
                    <td><asp:Label runat="server" ID="lblNumPeople"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <div class="flex gap-2 items-center">
                <asp:LinkButton runat="server" OnClick="editBookingInfo" CssClass="bg-red-500 text-center text-white w-2/4  py-3 mt-3">Edit  <i class="fa fa-pen-to-square"></i></asp:LinkButton>
                <asp:Button CssClass="confirm w-2/4 m-0" runat="server" ID="confirm"  OnClick="confirmPayment" Text="Confirm Payment"/>
            </div>
        </div>
    </form>
            <asp:PlaceHolder runat="server">
                <%: Scripts.Render("~/Scripts/bootstrap.js") %>
            </asp:PlaceHolder>
    </body>
</html>
