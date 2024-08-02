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
        <div class="min-h-screen flex justify-between bg-gray-900">
            <aside class="hidden lg:flex flex-col min-h-screen w-fit  text-white p-3 gap-5">
                <div class="flex flex-col bg-gray-800 rounded-md w-full p-5 gap-5 min-h-screen">
                    <header>
                        <h1 class="text-2xl font-bold">PS<span class="text-yellow-300">Admin</span></h1>
                    </header>
                    <nav class="flex flex-col gap-1  p-3 rounded-lg">
                        <asp:LinkButton ID="Home" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-chart-line"></i> Dashboard</asp:LinkButton>
                        <asp:LinkButton ID="Lostfound" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton2_Click"><i class="fa fa-handshake"></i> Lost and Found</asp:LinkButton>
                        <asp:LinkButton ID="bookings" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-database"></i> Bookings</asp:LinkButton>
                        <asp:LinkButton ID="help" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-info-circle"></i> Help</asp:LinkButton>
                    </nav>
                    <asp:LinkButton runat="server" OnClick="Logout" CssClass="rounded-md bg-red-600 p-2 absolute bottom-0 mb-5 transition-all hover:bg-red-400" ID="logout"><i class="fa fa-right-from-bracket"></i> Logout</asp:LinkButton>

                </div>
            </aside>
            <main class="min-h-screen w-full md:w-4/5 text-black bg-gray-900 flex flex-col gap-2">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <nav class="bg-white border-gray-200 dark:bg-gray-900">
                          <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                            <a href="/admin" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="Exterior/k.png" class="h-10" alt="Flowbite Logo" />
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
                            <a href="/admin" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="Exterior/k.png" class="h-8" alt="Flowbite Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">LostFound</span>
                            </a>
                          </div>
                        </nav>
                            <!--- Use GridView -->
                            <asp:Label runat="server" ID="lostFoundEmpty"></asp:Label>
                            <asp:LinkButton runat="server" CssClass="text-white bg-blue-500 p-2 rounded-md w-fit"><i class="fa fa-add"></i> Add New</asp:LinkButton>
                            <asp:GridView ID="gridLostFound" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" CellPadding="8" GridLines="Horizontal" OnSelectedIndexChanged="gridLostFound_SelectedIndexChanged" ForeColor="Black">
                                <Columns>
                                    <asp:CommandField  ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="rounded p-2 bg-red-500 text-white">
                                    <ControlStyle CssClass="rounded p-2 bg-red-500 text-white" />
                                    </asp:CommandField>
                                    <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="rounded p-2 px-4 bg-blue-500 text-white">
                                    <ControlStyle CssClass="rounded-md p-2 px-4 bg-blue-500 text-white" />
                                    </asp:CommandField>
   
                                </Columns>
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
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <nav class="bg-white border-gray-200 dark:bg-gray-900">
                          <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
                            <a href="/admin" class="flex items-center space-x-3 rtl:space-x-reverse">
                                <img src="Exterior/k.png" class="h-8" alt="Flowbite Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Bookings</span>
                            </a>
                          </div>
                        </nav>
                           <!--- Use GridView -->
                            <asp:Label runat="server" ID="bookingsEmpty"></asp:Label>
                            <asp:GridView ID="gridBookings" runat="server" BackColor="White" BorderColor="#CCCCCC" Rad BorderWidth="0px" CellPadding="8" GridLines="Horizontal" ForeColor="Black">
                                 <RowStyle ForeColor="white" BackColor="#1f2937" />
                                     <FooterStyle BackColor="#CCCCCC" />
                                     <HeaderStyle BackColor="#374151" Font-Bold="True" ForeColor="#9ca3af"  />
                                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                     <SortedAscendingHeaderStyle BackColor="#808080" />
                                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                     <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>

                    </asp:View>
                </asp:MultiView>
            </main>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>
