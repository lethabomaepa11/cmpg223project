<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="cmpg223project.Booking1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bookings</title>
    <link rel="stylesheet" href="icons/css/all.min.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>


    <style>
        *{
            font-family: Open Sans, sans-serif;
        }
        h1,h2,h3,h4,h5,h6{
            font-family: Poppins, sans-serif;
        }
        body {
            margin: 0;
            padding: 0;
            background-image: url("Exterior/k.png");
            background-attachment: fixed;
        }
        .form-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #ffffff; /* White background */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Light shadow */
        }
        .form-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container label, .label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="date"],
        .form-container select {
            width: calc(100% - 12px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
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
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 80%;
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
        .flex{
            width: 100%;
            height: fit-content;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        @keyframes animatetop {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }
        .responsive-grid {
    width: 100%;
    overflow-x: auto;
    display: block;
}

        .responsive-grid table {
            width: 100%;
            border-collapse: collapse;
        }

        .responsive-grid th, .responsive-grid td {
            padding: 8px;
            text-align: left;
        }

        @media (max-width: 768px) {
            .form-container{
                width: 100%;
            }
            .responsive-grid th, .responsive-grid td {
                display: block;
                width: 100%;
                box-sizing: border-box;
            }

            .responsive-grid th {
                background-color: #374151;
                color: #9ca3af;
            }

            .responsive-grid td {
                background-color: #1f2937;
                color: white;
            }

            .responsive-grid tr {
                display: block;
                margin-bottom: 10px;
            }
        }
        .room-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            width: 75%;
            height: 500px;
            overflow: auto;
        }
        .room-card {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        .room-card:hover {
            transform: scale(1.05);
        }
        .room-card img {
            max-width: 100%;
            border-radius: 10px;
        }
        .room-card .price {
            font-size: 1.2em;
            color: #28a745;
            margin: 10px 0;
        }
        .room-card button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .room-card button:hover {
            background-color: #0056b3;
        }
        .flex-between{
            display: flex;
            justify-content: space-around;
            align-items: start;
            gap: 0.5rem;
        }
        .selectedRooms{
            width: 25%;
            overflow-wrap: anywhere;
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            align-items: center;
        }
        .form{
            display: flex;
            flex-direction: column;
            width: 70%;
        }
        .error{
            color: indianred;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Room booking</h2>
            <a href="javascript: history.go(-1)"><i style="font-size: 1.3rem" class="fa fa-arrow-left"></i> Back</a> 
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="roomRequest" runat="server">
                    
                    <p>RoomRequest</p>
                    <div>
                         <label for="txtCheckIn">Check-in Date:</label>
                         <asp:TextBox type="date" ID="txtCheckIn" runat="server" required></asp:TextBox>
                        <asp:Label runat="server" CssClass="error" ID="checkInError"></asp:Label>
                         <label for="txtCheckOut">Check-out Date:</label>
                         <asp:TextBox type="date" id="txtCheckOut" runat="server" required></asp:TextBox>
                         <asp:Label runat="server" CssClass="error" ID="checkOutError"></asp:Label>

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
                        <div class="flex">
                            <asp:Button ID="toRates" runat="server" OnClick="nextPage" Text="Proceed"/>
                        </div>
                    </div>
                    
                </asp:View>
                <asp:View ID="roomRates" runat="server">
                    
                    <p>Select one or more rooms below, when you are done click Book Now</p>
                    <main class="flex-between">
                          <div class="room-container">
                              <asp:Repeater ID="rooms" runat="server">
                                  <ItemTemplate>
                                      <div class="room-card">
                                      <img src='<%# Eval("image_url") %>' alt='<%# Eval("description") %>' />
                                      <h3><%# Eval("description") %></h3>
                                      <p class="price"> <%# Eval("price", "{0:c}") %></p>
                                      <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="SelectRoom_Click" CommandArgument='<%# Eval("room_id") %>' />
                              </div>
                                  </ItemTemplate>
                              </asp:Repeater>
                          </div>
                        <div class="selectedRooms room-card">
                            <asp:Label runat="server" ID="lblSelectedRooms">

                            </asp:Label>
                            <asp:Label runat="server" ID="lblAmount"></asp:Label><br />
                            <asp:Button runat="server" Text="Book Now" OnClick="nextPager" ID="btnBookNow"/><br />
                            <asp:Button CssClass="btn-cancel" ID="btnClear" OnClick="clearSelection" BackColor="red" runat="server" Text="Clear" />
                        </div>
                    </main>
                </asp:View>
                <asp:View ID="Contact" runat="server">
                    
                    <div class="flex">
                        <asp:MultiView OnActiveViewChanged="trackViewChanged" ID="MultiViewContact" runat="server">
                            <asp:View ID="accountQuestions" runat="server">
                                <asp:Label ID="lblLoginStatus" runat="server" Text="Do you have an account with the Potch Stream Hotel?"></asp:Label>
                                <asp:RadioButtonList OnSelectedIndexChanged="accountQuestion" ID="rbLoginStatus" runat="server" AutoPostBack="True">
                                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:View>
                            <asp:View ID="View1" runat="server">
                                <asp:Label runat="server" ID="clientAlert" Text="Complete the form below to proceed."></asp:Label>
                                <main class="form w-full sm:w-2/5 p-2">
                                        <asp:Label CssClass="label" ID="LblName" runat="server" Text="Name:"></asp:Label>
                                        <asp:TextBox CssClass="rounded-md w-full" ID="TxtbName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtbName" ErrorMessage="Enter name!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:Label CssClass="label" ID="LblSurname" runat="server" Text="Surname:"></asp:Label>
                                        <asp:TextBox CssClass="form-control rounded-md w-full" ID="TxtbSurname" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtbSurname" ErrorMessage="Enter Surname!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:Label CssClass="label" ID="LblCellphone" runat="server" Text="Cellphone number:"></asp:Label>
                                        <asp:TextBox CssClass="form-control rounded-md" ID="TxtbCellphone" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtbCellphone" ErrorMessage="Enter Cellphone number!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:Label CssClass="label" ID="LblEmail" runat="server" Text="Email address:"></asp:Label>
                                        <asp:TextBox CssClass="form-control rounded-md" ID="TxtbEmail" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtbEmail" ErrorMessage="Enter valid Email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtbEmail" ErrorMessage="Enter Email!" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        <div class="flex">
                                            <asp:Button CssClass="bg-blue-500 rounded-md p-3" ID="BtnBook" runat="server" OnClick="toPayment" Font-Bold="True" Font-Size="Medium" Text="Proceed to payment" />
                                        </div>    
                                </main>
                            </asp:View>
                        </asp:MultiView>
                        
                    </div>
                </asp:View>
            </asp:MultiView>
            <!--
                    
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
    </div>-->
</div>
            
    </form>


</body>
</html>
