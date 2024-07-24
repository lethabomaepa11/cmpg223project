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
        <div class="min-h-screen flex justify-between">
            <aside class="hidden lg:flex flex-col min-h-screen w-1/5 bg-slate-950 text-white p-3 gap-5">
                <header>
                    <h1 class="text-2xl font-bold">PS<span class="text-yellow-300">Admin</span></h1>
                </header>
                <nav class="flex flex-col gap-1  p-3 rounded-lg">
                    <asp:LinkButton ID="Home" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-chart-line"></i> Dashboard</asp:LinkButton>
                    <asp:LinkButton ID="Lostfound" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton2_Click"><i class="fa fa-handshake"></i> Lost and Found</asp:LinkButton>
                    <asp:LinkButton ID="transactions" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-database"></i> Transactions</asp:LinkButton>
                    <asp:LinkButton ID="help" CssClass="w-full transtion-all hover:bg-blue-500 p-2 hover:rounded-md" runat="server" OnClick="LinkButton3_Click"><i class="fa fa-info-circle"></i> Help</asp:LinkButton>
                </nav>
                <asp:LinkButton runat="server" CssClass="rounded-md bg-red-600 p-2 fixed bottom-0 mb-5 transition-all hover:bg-red-400" ID="logout"><i class="fa fa-right-from-bracket"></i> Logout</asp:LinkButton>
            </aside>
            <main class="min-h-screen w-full md:w-4/5 text-black bg-slate-200">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <header class="bg-slate-200 w-full p-3">
                            <h1 class="text-2xl font-bold">Dashboard</h1>
                        </header>
                        <main class="flex flex-col p-3 gap-3">
                            <div class="flex gap-2 flex-wrap text-white">
                                <div class="bg-gradient-to-b from-slate-900 to-slate-600 rounded-lg p-4 transition-all hover:-translate-y-2">
                                    <h1 class="font-bold text-lg">100</h1>
                                    <p class="text-gray-300">New Bookings</p>
                                </div>
                                <div class="bg-gradient-to-b from-slate-900 to-slate-600 rounded-lg p-4 transition-all hover:-translate-y-2 hover:text-yellow-200">
                                    <h1 class="font-bold text-lg">121</h1>
                                    <p class="text-gray-300">Total Bookings</p>
                                </div>
                                <div class="bg-gradient-to-b from-slate-900 to-slate-600 rounded-lg p-4 transition-all hover:-translate-y-2 hover:text-yellow-200">
                                    <h1 class="font-bold text-lg">98</h1>
                                    <p class="text-gray-300">Currently Checked in</p>
                                </div>
                                <div class="bg-gradient-to-b from-slate-900 to-slate-600 rounded-lg p-4 transition-all hover:-translate-y-2 hover:text-yellow-200">
                                    <h1 class="font-bold text-lg">14</h1>
                                    <p class="text-gray-300">Registered clients</p>
                                </div>
                            </div>
                            <section class="flex gap-2">
                                <div class="bg-white rounded-lg w-2/4 p-3  flex justify-between">
                                    <h1 class="font-bold">Transactions</h1>
                                    <asp:LinkButton runat="server" OnClick="LinkButton3_Click">View All <i class="fa fa-up-right-from-square"></i></asp:LinkButton>
                                    <!--- Use GridView -->
                                </div>
                                <div class="bg-white rounded-lg w-2/4 p-3  flex justify-between">
                                    <h1 class="font-bold">Lost and found items</h1>
                                    <asp:LinkButton runat="server" OnClick="LinkButton2_Click">View All <i class="fa fa-up-right-from-square"></i></asp:LinkButton>
                                    <!--- Use GridView -->
                                </div>
                            </section>
                            <section class="flex justify-between">

                            
                                <asp:Calendar CssClass="calendar w-2/5 bg-slate-300" ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                                <div class="bg-white w-4/6 rounded-lg p-3">
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
                        <header class="bg-slate-200 w-full p-3">
                            <h1 class="text-2xl font-bold">Lost and found</h1>
                            <!--- Use GridView -->
                        </header>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <header class="bg-slate-200 w-full p-3">
                            <h1 class="text-2xl font-bold">Transactions</h1>
                           <!--- Use GridView -->
                        </header>
                    </asp:View>
                </asp:MultiView>
            </main>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>
