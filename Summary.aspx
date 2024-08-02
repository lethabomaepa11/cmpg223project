<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="cmpg223project.Summary" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <title>Summary</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="text-bg-dark text-center">
            <h1>Summary</h1>
            <p>Confirmation of Information</p>
        </div>
        <div class="container" style="background-color: lightgrey;">
    <div class="row" style="background-color: lightgrey;">
        <div class="col-sm-12" style="background-color: yellow;">
           <h3>Client Details</h3>
            <table class="table table-bordered" style="background-color: white;">
                <tbody>
                    <tr>
                        <th scope="row" style="width: 80px;">First Name</th>
                        <td style="width: 200px;">Mark</td>
                    </tr>
                    <tr>
                        <th scope="row">Last Name</th>
                        <td>Otto</td>
                    </tr>
                    <tr>
                        <th scope="row">Username</th>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">Email</th>
                        <td>mark.otto@example.com</td>
                    </tr>
                    <tr>
                        <th scope="row">Phone Number</th>
                        <td>+27(78) 9745974</td>
                    </tr>
                    <tr>
                        <th scope="row">Reservance code</th>
                        <td>#23022</td>
                    </tr>
                    <tr>
                        <th scope="row">Rooms Booked</th>
                        <td>2</td>
                    </tr>
                    <tr>
                        <th scope="row">Description of room</th>
                        <td>Luxury</td>
                    </tr>
                    <tr>
                        <th scope="row">Number of people</th>
                        <td>4</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

    </form>
</body>
</html>
