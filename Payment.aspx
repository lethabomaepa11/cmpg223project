<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="cmpg223project.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Payment: PotchStream</title>
    <link href="Content/boostrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="icons/css/all.min.css"/>

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
        }
        input[type="submit"] {
            margin-top: 1rem;
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 100%;
        }
    </style>
    <link rel="stylesheet" href="CSS.css" />
</head>
    
<body>
    <form id="form1" runat="server">
        <a href="javascript: history.go(-1)"><i style="font-size: 1.3rem" class="fa fa-arrow-left"></i> Back</a> 
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div class="container p-0">
        <div class="card px-4">
            <p class="h8 py-3">
                <asp:Label ID="Label6" runat="server" Text="Payment Details"></asp:Label>
            </p>
            <div class="row gx-3">
                <div class="col-12">
                    <div class="d-flex flex-column">
                        
                        <span>Credit/Debit Card</span>
                              <div class="icons">
                                <img src="https://i.imgur.com/2ISgYja.png" width="30">
                                <img src="https://i.imgur.com/W1vtnOV.png" width="30">
                                <img src="https://i.imgur.com/35tC99g.png" width="30">
                                <img src="https://i.imgur.com/2ISgYja.png" width="30">
                              </div>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Card Number"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBox2" runat="server" Height="36px" Width="511px" placeholder="XXXX XXXX XXXX XXXX"></asp:TextBox>
&nbsp;</div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        &nbsp;<asp:Label ID="Label3" runat="server" Text="Expiry"></asp:Label>
                        <br />
                            <asp:TextBox ID="TextBox3" runat="server" Height="36px" Width="514px" placeholder="MM/YY"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        <asp:Label ID="Label2" runat="server" Text="CVV/CVC"></asp:Label>
                        <br />
                            <asp:TextBox ID="TextBox4" runat="server" Height="36px" Width="512px" placeholder="XXX"></asp:TextBox>
                        &nbsp;</div>
                </div>
                <div class="col-12">
                    <div class="btn btn-primary mb-3">
                       
                        <asp:Label runat="server" ID="lblAmount" Text="Total Payment: "></asp:Label>
                        <span class="fas fa-arrow-right"></span>
                    </div>
                    <asp:Button CssClass="confirm" runat="server" ID="confirm" OnClick="confirmPayment" Text="Confirm Payment"/>
                </div>
            </div>
        </div>
    </div>
                    &nbsp;</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="373px" ImageUrl="~/giphy.gif" Width="375px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <table style="width:100%;">
        <tr>
            <td class="auto-style2">
                      &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
    </body>
</html>
