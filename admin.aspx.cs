using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.DynamicData;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace cmpg223project
{
    public partial class admin : System.Web.UI.Page
    {
        Database db = new Database();
        bool isInLostFound = false;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            MultiView1.ActiveViewIndex = 0;

            DateTime date = DateTime.Today;
            //toast.Enabled = false;
            //Calendar1.SelectedDate = date;
            //int[] clients = { 5, 9 };
            //check session id if its admin
            //Session["session_id"] = "ad1010";
            if (Session["session_id"]  == null || Session["session_id"] != "ad1010")
            {
                Response.Redirect("/Auth");
            }

            //total bookings
            if (db.selectClients("WHERE client_type='b'"))
                lblRegisteredClients.Text = "" + db.clientData.Rows.Count;
            if(db.selectClients())
                lblAllUsers.Text = ""+(db.clientData.Rows.Count-1);
            if (db.selectBookings("ORDER BY price DESC"))
            {
                double revenue = 0;
                lblTotalBookings.Text = "" + db.bookingData.Rows.Count;
                foreach(DataRow row in db.bookingData.Rows)
                {
                    revenue += double.Parse(row["price"].ToString());
                }
                lblRevenue.Text = revenue.ToString("c");
            }
                
            if (!IsPostBack)
            {
                if (db.selectBookings("ORDER BY price DESC"))
                    gridBookings.DataSource = db.bookingData; gridBookings.DataBind();
            }
            
            if(db.selectLostFound())
                gridLostFound.DataSource = db.lostFoundData;gridLostFound.DataBind();
            //lblNewBookings.Text = date.ToString();
            if(db.selectLostFound("WHERE description LIKE '%claimed by%'"))
                lblClaimedItems.Text = ""+db.lostFoundData.Rows.Count;
            if (db.selectLostFound("WHERE description NOT LIKE '%claimed by%'"))
                lblUnclaimedItems.Text = "" + db.lostFoundData.Rows.Count;
            if (db.selectRooms())
            {
                roomID.DataSource = db.roomData;
                roomID.DataTextField = "room_id";
                roomID.DataValueField = "room_id";
                roomID.DataBind();
                
             
            }
            //chart to show top 5 most spenders 
            DataTable ChartData = db.bookingData;
            //Booking[] topBookings;
            //storing total rows count to loop on each Record                          
            string[] XPoints = new string[ChartData.Rows.Count];
            int[] YPOints = new int[ChartData.Rows.Count];
            for (int count = 0; count < 5; count++)
            {
                // store values for X axis  
                XPoints[count] = ChartData.Rows[count]["user_email"].ToString();
                //store values for Y Axis  
                YPOints[count] = Convert.ToInt32(ChartData.Rows[count]["price"]);
            }
            //binding chart control  
            ClientsChart.Series[0].Points.DataBindXY(XPoints, YPOints);
            ClientsChart.Series[0].Label = "R #VALY";
            ClientsChart.Series[0].BorderWidth = 2;
            ClientsChart.Series[0].BorderColor = Color.White;
            //setting Chart type   
            ClientsChart.Series[0].ChartType = SeriesChartType.Doughnut;
            //enable to show legend
            ClientsChart.Series[0].LegendText = "#VALX";
           // ClientsChart.Legends[0].Enabled = true;
            //show chart in 3d
            //ClientsChart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;//dashboard
        }
        protected void Logout(object sender, EventArgs e)
        {
            Session["session_id"] = null;
            Response.Redirect("/");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;//bookings
            if (db.selectBookings("ORDER BY price DESC"))
            {
                bookingsEmpty.Text = "";
                gridBookings.DataSource = db.bookingData;
                gridBookings.DataBind();
            }
            else
            {
                bookingsEmpty.Text = "Nothing to see here...";
            }
            
        }
        protected void sortBookings(object sender, EventArgs e)
        {
            string sorter = dropSortBookings.Text;
            if(db.selectBookings($"ORDER BY {sorter}"))
            {
                gridBookings.DataSource = db.bookingData;
                gridBookings.DataBind();
                MultiView1.ActiveViewIndex = 2;//bookings
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;//lost and found
            if (db.selectLostFound())
            {
                lostFoundEmpty.Text = "";
                gridLostFound.DataSource = db.lostFoundData;
                gridLostFound.DataBind();
            }
            else
            {
                lostFoundEmpty.Text = "Nothing to see here...";
            }
            
        }
        
        protected void addLostFound(object sender, EventArgs e)
        {
            string room = roomID.SelectedValue;
            
            string description = txtDescription.Text;
            lblClaimedItems.Text = room;
            DateTime dateFound = DateTime.Parse(txtDateFound.Text);
            LostFound item = new LostFound(description, dateFound, room);
            if (db.insertLostFound(item))
            {
                //success message
                //toast.Enabled = true;
                Response.Redirect("/admin");
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void gridLostFound_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get the index clicked
        }

        protected void gridLostFound_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            if(index > 0 && index < gridLostFound.Rows.Count)
            {
                GridViewRow row = gridLostFound.Rows[index];
                int id = int.Parse(row.Cells[2].Text);//because the first two indices, 0 and 1 are the buttons
                if (db.delete("lostfounditems", $"item_id = {id}"))
                {
                    db.selectLostFound();
                    gridLostFound.DataSource = db.lostFoundData;
                    gridLostFound.DataBind();
                    MultiView1.ActiveViewIndex = 1;
             
                }
            }
            else
            {
                Response.Redirect("/admin");
            }
            
        }

        protected void gridLostFound_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //display the edit form and give the id of the lost found
            //Response.Redirect("/auth");
        }

        protected void gridBookings_Sorting(object sender, GridViewSortEventArgs e)
        {
            db.bookingData = ViewState["DataTable"] as DataTable;

            if (db.bookingData != null)
            {
                DataView dataView = new DataView(db.bookingData);

                if (ViewState["SortDirection"] == null || ViewState["SortDirection"].ToString() == "ASC")
                {
                    dataView.Sort = e.SortExpression + " DESC";
                    ViewState["SortDirection"] = "DESC";
                }
                else
                {
                    dataView.Sort = e.SortExpression + " ASC";
                    ViewState["SortDirection"] = "ASC";
                }

                gridBookings.DataSource = dataView;
                gridBookings.DataBind();
            }
            MultiView1.ActiveViewIndex = 2;//bookings
        }

        protected void DisplayHelp(object sender, GridViewSortEventArgs e)
        {
            //get the multiview1 index, set the active page, display help info according to the active page
            string[] pages = { "dashboard", "lostfound", "bookings" };
            int index = MultiView1.ActiveViewIndex;
            string activePage = pages[index];
            switch (activePage)
            {
                case "dashboard":
                    break;
                case "lostfound":
                    break;
                case "bookings":
                    break;
                default:
                    break;
                    
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            String date = searchDate.Text;
            db.selectBookings($"WHERE check_in='{date}'");
            gridBookings.DataSource = db.bookingData; gridBookings.DataBind();  
            if(!(db.bookingData.Rows.Count > 0))
            {
                bookingsEmpty.Text = "No items were found!";
            }
            else
            {
                bookingsEmpty.Text = "";
            }
            MultiView1.ActiveViewIndex = 2;
        }
        protected void ResetBookingFilter(object sender, EventArgs e)
        {
            db.selectBookings();
            gridBookings.DataSource = db.bookingData; gridBookings.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }
    }
}