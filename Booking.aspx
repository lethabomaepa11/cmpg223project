<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="cmpg223project.Booking1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bookings</title>
    <style>
        body {
            background-color: #f2f2f2; /* Light gray background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .form-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff; /* White background */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Light shadow */
        }
        .form-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container select {
            width: calc(100% - 12px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }
        .form-container select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-color: #fff;
        }
        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            animation-name: animatetop;
            animation-duration: 0.4s;
        }
        .modal-header h2 {
            margin-top: 0;
        }
        .modal-body {
            padding: 10px 0;
        }
        .modal-footer {
            text-align: center;
        }
        .btn-confirm {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn-confirm:hover {
            background-color: #45a049;
        }
        .btn-cancel {
            background-color: #ccc;
            color: #333;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            margin-left: 10px;
        }
        .btn-cancel:hover {
            background-color: #999;
        }
        @keyframes animatetop {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Welcome to Potch Stream Hotel</h2>

            <asp:Label ID="lblLoginStatus" runat="server" Text="Do you have an account with the Potch Stream Hotel?"></asp:Label>
            <asp:RadioButtonList ID="rbLoginStatus" runat="server" AutoPostBack="True">
                <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="no"></asp:ListItem>
            </asp:RadioButtonList>

            <div id="divLogin" runat="server" style="display: none;">
                <label for="txtUsername">Username:</label>
                <input type="text" id="txtUsername" runat="server" />

                <label for="txtPassword">Password:</label>
                <input type="password" id="txtPassword" runat="server" />

                <asp:Button ID="btnLogin" runat="server" Text="Login" />
            </div>

            <div id="divAccountDetails" runat="server" style="display: none;">
                <label for="txtName">Full Name:</label>
                <input type="text" id="txtName" runat="server" />

                <label for="txtSurname">Surname:</label>
                <input type="text" id="txtSurname" runat="server" />

                <label for="txtEmail">Email:</label>
                <input type="email" id="txtEmail" runat="server" />
            </div>

            <label for="txtCheckIn">Check-in Date:</label>
            <input type="date" id="txtCheckIn" runat="server" required />

            <label for="txtCheckOut">Check-out Date:</label>
            <input type="date" id="txtCheckOut" runat="server" required />

            <label for="ddlAdults">Number of Adults:</label>
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>
            </asp:DropDownList>

            <label for="ddlChildren">Number of Children:</label>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Text="0" Value="0"></asp:ListItem>
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
            </asp:DropDownList>
            <label for="ddlRoomType">Room Type:</label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Text="Standard" Value="Standard">Standard - Spacious room with basic amenities.</asp:ListItem>
                <asp:ListItem Text="Deluxe" Value="Deluxe">Deluxe - Luxury room with additional space and premium features.</asp:ListItem>
                <asp:ListItem Text="Suite" Value="Suite">Suite - Exclusive suite with separate living area and enhanced amenities.</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnSubmit" runat="server" Text="Book Now"/>
        </div>
    

    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Confirm Booking Details</h2>
            </div> 
            <div class="modal-body">
                <p><strong>Name:</strong> <span id="confirmName"></span></p>
                <p><strong>Surname:</strong> <span id="confirmSurname"></span></p>
                <p><strong>Email:</strong> <span id="confirmEmail"></span></p>
                <p><strong>Check-in Date:</strong> <span id="confirmCheckIn"></span></p>
                <p><strong>Check-out Date:</strong> <span id="confirmCheckOut"></span></p>
                <p><strong>Adults:</strong> <span id="confirmAdults"></span></p>
                <p><strong>Children:</strong> <span id="confirmChildren"></span></p>
                <p><strong>Room Type:</strong> <span id="confirmRoomType"></span></p>
                <p><strong>Description:</strong> <span id="roomDescription"></span></p>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" CssClass="btn-confirm" />
                <button type="button" class="btn-cancel">Cancel</button>
            </div>
        </div>
    </div>
    </form>


</body>
</html>
