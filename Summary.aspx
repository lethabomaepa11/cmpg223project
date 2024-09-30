<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Summary.aspx.cs" Inherits="cmpg223project.Summary" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        const print = () => {
            document.getElementById("printBtn").style.display = "none";
            const printable = document.getElementById("printable");
            const title = document.getElementById("title");
            const timestamp = document.getElementById("printTimestamp");
            const now = new Date();
            const options = {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                second: 'numeric'
            };

            const formattedDate = now.toLocaleString('en-ZA', options);

            //alert(date.toString())
            timestamp.textContent = formattedDate
            

            printable.classList.add("fixed", "top-0", "min-h-screen", "z-40", "w-screen","left-0");
            printable.style.width = "100vw";
            printable.style.height = "100vh";
            let name = '';
            const className = document.getElementsByClassName("name");
            for (var i = 0; i < className.length; i++) {
                name += className[i].textContent + " ";
            }
            let ti = "Booking report for " + name ;
            title.innerHTML = `<a href="/" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="Exterior/k.png" class="h-8" alt="Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Potch Stream Hotel</span>
                               </a><br/>` + ti;
            document.title = ti + "-" + formattedDate;
            window.print();
        }
    </script>
        <div class="text-bg-dark text-center">
            <h1>Summary</h1>
            <p>Confirmation of Information</p>
        </div>
        <div class="container">
                <div class="">
                <div class="col-sm-12 bg-white" id="printable">
                    <button id="printBtn" class="bg-blue-500 text-white p-3 my-1 rounded" onclick="print()">Download Page</button>
                    <p id="title" class="text-gray-600 font-bold text-2xl my-10"></p>
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
                                <th scope="row">Reservation code</th>
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
                    <footer class="flex justify-between my-10">
                        <p class="text-gray-500" >Page 1 of 1</p><p class="text-gray-500" id="printTimestamp"></p>
                    </footer>
                    <p class="text-center text-gray-200">END OF REPORT</p>
                </div>
                    
            </div>
            
            
        </div>
</asp:Content>
