<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auth.aspx.cs" Inherits="cmpg223project.Auth" %>

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
    <link href="Content/boostrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <title>Authentication: PSH</title>
    <style>
        *{
            font-family: Open Sans, sans-serif;
        }
        h1,h2,h3,h4,h5,h6{
            font-family: Poppins, sans-serif;
        }
        input[type=text],input[type=password]{
            border: 2px solid #bbb;
            height: 44px;
            border-radius: 10px;
            padding: 10px;
        }
        input[type=submit],.btn{
            margin-top: 1rem;
            border-radius: 10px;
            background-color: royalblue;
            color: white;
            padding: 1rem;
            min-width: 200px;
            transition: all 0.2s ease-in-out;
        }
        input[type=submit]:hover,.btn{
            transform: scale(0.95);
        }
        .link{
            color: royalblue;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="flex flex-col-reverse md:flex-row w-full gap-4 justify-between items-start">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="RegisterView" runat="server">
                <div>
                      <a href="javascript: history.go(-1)"><i style="font-size: 2rem" class="fa fa-arrow-left"></i> Back</a> 
                      <img src="Exterior/k.png" alt="logo" class="hidden md:flex object-fit"/>
                      <asp:LinkButton CssClass="btn bg-slate-900 w-full"  runat="server" OnClick="ToLogin" CausesValidation="false">Login here...</asp:LinkButton>

                </div>
                <main class="flex flex-col w-full sm:w-2/5 p-2">

                <h1 style="font-size: xx-large; font-weight: bold">Register</h1>

                    <div class="flex flex-col md:flex-row sm:justify-between gap-2 ">
                        <span class="flex flex-col items-start md:w-2/4">
                            <asp:Label CssClass="form-label" ID="LblName" runat="server" Text="Name:"></asp:Label>
                            <asp:TextBox CssClass="rounded-md w-full" ID="TxtbName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtbName" ErrorMessage="Enter name!" ForeColor="Red"></asp:RequiredFieldValidator>

                        </span>
                        <span class="flex flex-col items-start md:w-2/4">
                            <asp:Label ID="LblSurname" runat="server" Text="Surname:"></asp:Label>
                            <asp:TextBox CssClass="form-control rounded-md w-full" ID="TxtbSurname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtbSurname" ErrorMessage="Enter Surname!" ForeColor="Red"></asp:RequiredFieldValidator>

                        </span>
                    </div>
                    <asp:Label ID="LblAge" runat="server" Text="Age:"></asp:Label>
                    <asp:TextBox CssClass="form-control rounded-md"  ID="TxtbAge" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TxtbAge" ErrorMessage="Enter Age!" ForeColor="Red"></asp:RequiredFieldValidator>
               
                    <asp:Label ID="LblCellphone" runat="server" Text="Cellphone number:"></asp:Label>
                    <asp:TextBox CssClass="form-control rounded-md" ID="TxtbCellphone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtbCellphone" ErrorMessage="Enter Cellphone number!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="LblEmail" runat="server" Text="Email address:"></asp:Label>
                    <asp:TextBox CssClass="form-control rounded-md" ID="TxtbEmail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtbEmail" ErrorMessage="Enter valid Email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtbEmail" ErrorMessage="Enter Email!" ForeColor="Red"></asp:RequiredFieldValidator> 
                    <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
                    <asp:TextBox CssClass="form-control rounded" type="password" ID="TxtbPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtbPassword" ErrorMessage="Enter Password!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:Label ID="LblConfirm" runat="server" Text="Confirm Password:"></asp:Label>
                    <asp:TextBox CssClass="form-control rounded-md" type="password" ID="TxtbConfirm" runat="server"></asp:TextBox>
                    <asp:Button CssClass="bg-blue-500 rounded-md p-3" OnClick="Register" ID="BtnRegister" runat="server" Font-Bold="True" Font-Size="Medium" Text="Register" />

                    </main>
            </asp:View>
            <asp:View ID="LoginView" runat="server">
               <div class="w-full flex flex-col items-center">
                   <div class="flex bg-gray-900 items-center text-white fixed w-screen top-0 gap-10 py-8">
                        <a href="javascript: history.go(-1)"><i style="font-size: 2rem;margin-left: 1rem;" class="fa fa-arrow-left"></i> Back</a> 
                        <h1 class="font-bold text-3xl  align-center">Login</h1>
                   </div>
                   <main class="flex flex-col w-full sm:w-2/5 p-2 mt-24">
                    <asp:Label runat="server" ID="loginAlert" class="mb-5">Enter your login details to proceed</asp:Label>

                    <asp:Label ID="LblEmail0" runat="server" Text="Email address:"></asp:Label>
                    <asp:TextBox ID="TxtbEmail0" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtbEmail0" ErrorMessage="Enter valid Email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtbEmail0" ErrorMessage="Enter Email!"></asp:RequiredFieldValidator>
                    <asp:Label ID="LblPassword0" runat="server" Text="Password:" ToolTip="Your password" EnableViewState="False"></asp:Label>
                    <asp:TextBox type="password" ID="TxtbPassword0" runat="server" ToolTip="Your password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtbPassword0" ErrorMessage="Enter Password!"></asp:RequiredFieldValidator>
                    <asp:Button CssClass="btn btn-primary" ID="BtnLogin" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="Login" Text="Login" />
                    <asp:Button CssClass="btn btn-primary bg-slate-900" style="background-color: navy;" ID="Button1" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="ToRegister" Text="Register" CausesValidation="false" />
                    
                    </main>
                   <asp:LinkButton runat="server" CssClass="underline my-5 text-blue-500" CausesValidation="false" OnClick="ToForgotPassword_Click">Forgot password</asp:LinkButton>
                   
                </div>
                

            </asp:View>
        </asp:MultiView>
    </form>

</body>
</html>
