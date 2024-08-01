<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="cmpg223project.admin" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

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
    <title>Admin Page</title>
    <style>
    *{
        font-family: Open Sans, sans-serif;
    }
    h1,h2,h3,h4,h5,h6{
        font-family: Poppins, sans-serif;
    }
</style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="min-h-screen flex justify-between bg-gray-950">
            <aside class="hidden lg:flex flex-col min-h-screen w-fit  text-white p-3 gap-5">
                <header>
                    <h1 class="text-2xl font-bold">PS<span class="text-yellow-300">Admin</span></h1>
                </header>
                <nav class="flex flex-col gap-1  p-3 rounded-lg">
                    <asp:LinkButton ID="Home" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-chart-line"></i> Dashboard</asp:LinkButton>
                    <asp:LinkButton ID="Lostfound" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton2_Click"><i class="fa fa-handshake"></i> Lost and Found</asp:LinkButton>
                    <asp:LinkButton ID="bookings" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-database"></i> Bookings</asp:LinkButton>
                    <asp:LinkButton ID="help" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-info-circle"></i> Help</asp:LinkButton>
                </nav>
                <asp:LinkButton runat="server" OnClick="Logout" CssClass="rounded-md bg-red-600 p-2 fixed bottom-0 mb-5 transition-all hover:bg-red-400" ID="logout"><i class="fa fa-right-from-bracket"></i> Logout</asp:LinkButton>
            </aside>
            <main class="min-h-screen w-full md:w-4/5 text-black bg-gray-900 flex flex-col gap-2">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <nav class="bg-white border-gray-200 dark:bg-gray-900">
                          <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                            <a href="https://flowbite.com/" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">DashBoard</span>
                            </a>
                          </div>
                        </nav>
                        <main class="flex flex-col p-3 gap-3">
                            <div class="flex gap-2 flex-wrap text-white">
                                <div class="block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all hover:-translate-y-2">
                                    <asp:label runat="server" ID="lblNewBookings" class="font-bold text-lg">0</asp:label>
                                    <p class="text-gray-300">New Bookings</p>
                                </div>
                                <div class="block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all hover:-translate-y-2">
                                    <asp:label runat="server" ID="lblTotalBookings" class="font-bold text-lg">0</asp:label>
                                    <p class="text-gray-300">Total Bookings</p>
                                </div>
                                <div class="block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all hover:-translate-y-2">
                                    <asp:label runat="server" ID="lblnotRegistered" class="font-bold text-lg">0</asp:label>
                                    <p class="text-gray-300">Unregistered clients</p>
                                </div>
                                <div class="block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all hover:-translate-y-2">
                                    <asp:label runat="server" ID="lblRegisteredClients" class="font-bold text-lg">0</asp:label>
                                    <p class="text-gray-300">Registered clients</p>
                                </div>
                            </div>
                            <section class="flex gap-2">
                                <div class="text-white rounded-lg w-2/4 p-3  flex justify-between p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all">
                                    <h1 class="font-bold">New Bookings</h1>
                                    <asp:LinkButton runat="server" OnClick="LinkButton3_Click">View All <i class="fa fa-up-right-from-square"></i></asp:LinkButton>
                                    
                                </div>
                                <div class="text-white rounded-lg w-2/4 p-3  flex justify-between p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all">
                                    <h1 class="font-bold">New Lost and found items</h1>
                                    <asp:LinkButton runat="server" OnClick="LinkButton2_Click">View All <i class="fa fa-up-right-from-square"></i></asp:LinkButton>
                                    

                                </div>
                            </section>
                            <section class="flex justify-between">    
                                <div id="datepicker-actions" datepicker datepicker-autoselect-today></div>
                                <div class="text-white w-4/6 p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 rounded-lg p-4 transition-all">
                                    <h1>Charts Registered Clients VS Non-registered</h1>
                                    <asp:Chart ID="ClientsChart" runat="server">
                                        <Series>
                                            <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </section>
                        </main>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <nav class="bg-white border-gray-200 dark:bg-gray-900">
                          <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                            <a href="https://flowbite.com/" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">LostFound</span>
                            </a>
                          </div>
                        </nav>
                            <!--- Use GridView -->
                            <asp:Label runat="server" ID="lostFoundEmpty"></asp:Label>
                            <asp:GridView ID="gridLostFound" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="gridLostFound_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <nav class="bg-white border-gray-200 dark:bg-gray-900">
                          <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                            <a href="https://flowbite.com/" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Bookings</span>
                            </a>
                          </div>
                        </nav>
                           <!--- Use GridView -->
                            <asp:Label runat="server" ID="bookingsEmpty"></asp:Label>
                            <asp:GridView ID="gridBookings" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                            </asp:GridView>

                    </asp:View>
                </asp:MultiView>
            </main>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>
