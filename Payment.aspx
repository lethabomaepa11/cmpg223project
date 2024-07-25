<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 658px;
        }
        .auto-style2 {
            width: 660px;
        }
    </style>
</head>
    <link rel="stylesheet" href="CSS.css" />
<body>
    <form id="form1" runat="server">
        
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
                        <asp:TextBox ID="TextBox2" runat="server" Height="36px" Width="511px"></asp:TextBox>
&nbsp;</div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        &nbsp;<asp:Label ID="Label3" runat="server" Text="Expiry"></asp:Label>
                        <br />
                            <asp:TextBox ID="TextBox3" runat="server" Height="36px" Width="514px"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-column">
                        <asp:Label ID="Label2" runat="server" Text="CVV/CVC"></asp:Label>
                        <br />
                            <asp:TextBox ID="TextBox4" runat="server" Height="36px" Width="512px"></asp:TextBox>
                        &nbsp;</div>
                </div>
                <div class="col-12">
                    <div class="btn btn-primary mb-3">
                       
                        <asp:Label ID="Label1" runat="server" Text="Total Payment: R"></asp:Label>
                        <span class="fas fa-arrow-right"></span>
                    </div>
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
