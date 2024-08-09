<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="cmpg223project.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="icons/css/all.min.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="true"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.css" rel="stylesheet" />
    <title>Profile Page</title>
    <style>
        *{
            font-family: Open Sans, sans-serif;
        }
        h1,h2,h3,h4,h5,h6{
            font-family: Poppins, sans-serif;
        }
        input[type=text]{
            border: 2px solid #bbb;
            height: 44px;
            border-radius: 10px;
            padding: 10px;
        }
        input[type=submit]{
            margin-top: 1rem;
            border-radius: 10px;
            background-color: royalblue;
            color: white;
            padding: 0.8rem;
            min-width: 200px;
            transition: all 0.2s ease-in-out;
        }
        input[type=submit]:hover{
            transform: scale(0.95);
        }
        .link{
            color: royalblue;
            text-decoration: underline;
        }
        #btnCancel{
            background-color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="p-10">
        
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
<body >
    <form id="form1" runat="server">
        <div class="text-bg-dark text-center">
            <h1>Profile</h1>
        </div
            <p style="font-weight: 700">
                Name:
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                Surname:
                <asp:Label ID="lblSurname" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                Email Address:
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                Cell Number:
                <asp:Label ID="lblCellNumber" runat="server"></asp:Label>
            </p>
            <p style="font-weight: 700">
                &nbsp;</p>
            <p style="font-weight: 700">
                <asp:Button ID="btnEditInfo" runat="server" OnClick="btnEditInfo_Click" Text="Edit Info" Width="144px" />
            </p>
        </asp:Panel>
        <asp:Panel ID="EditPanel" runat="server" Height="289px" style="margin-top: 22px">
            <h2>Edit Profile</h2>
            <p style="font-weight: 700">
                Name:
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </p>
            <p style="font-weight: 700">
                Surname:
                <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            </p>
            <p style="font-weight: 700">
                Email Address:
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter a valid email address!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </p>
            <p style="font-weight: 700">
                Cell Number:
                <asp:TextBox ID="txtCellNumber" runat="server"></asp:TextBox>
            </p>
            <p style="font-weight: 700">
                &nbsp;</p>
            <p style="font-weight: 700">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save Changes" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            </p>
        </asp:Panel>
    </form>
</body>
</html>
