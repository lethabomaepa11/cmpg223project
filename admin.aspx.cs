using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class admin : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            DateTime date = DateTime.Today;
            //Calendar1.SelectedDate = date;
            //int[] clients = { 5, 9 };
            //check session id if its admin
            Session["session_id"] = "a1010";
            if (Session["session_id"]  == null || Session["session_id"] != "a1010")
            {
                Response.Redirect("/");
            }

            //total bookings
            if (db.selectClients("WHERE client_type='b'"))
                lblRegisteredClients.Text = "" + db.clientData.Rows.Count;
            if(db.selectClients("WHERE client_type='c'"))
                lblnotRegistered.Text = ""+db.clientData.Rows.Count;
            if(db.selectBookings())
                lblTotalBookings.Text = ""+db.bookingData.Rows.Count;
            if (db.selectBookings())
                gridBookings.DataSource = db.bookingData; gridBookings.DataBind();
            if(db.selectLostFound())
                gridLostFound.DataSource = db.lostFoundData;gridLostFound.DataBind();
            //lblNewBookings.Text = date.ToString();

            
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
            if (db.selectBookings("ORDER BY check_in DESC"))
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

        protected void gridLostFound_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get the index clicked
        }
    }
}