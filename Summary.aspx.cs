using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class Summary : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["booking_email"] == null)
            {
                Response.Redirect("/booking");
            }
            else
            {
                DataRow client, booking;
                string email = Session["booking_email"].ToString();
                string code = Session["code"].ToString();
                string clientCondtion = $"WHERE email = '{email}'";
                string bookingCondition = $"WHERE reservation_code = '{code}'";
                if (db.selectClients(clientCondtion) && db.selectBookings(bookingCondition)){
                    client = db.clientData.Rows[0];
                    booking = db.bookingData.Rows[0];
                    //data from client
                    lblName.Text = client["name"].ToString();
                    lblSurname.Text = client["surname"].ToString();
                    lblPhone.Text = client["cell_number"].ToString();
                    lblEmail.Text = client["email"].ToString();
                    //data from booking
                    lblCode.Text = code;
                    lblNumPeople.Text = booking["num_people"].ToString();
                    lblNumRooms.Text = booking["num_rooms"].ToString();
                    lblAmount.Text = booking["price"].ToString();
                    //must include check_in,out and price

                    //clear all the session variables excluding the session_id
                    Session["booking_email"] = null;
                    Session["code"] = null;
                    Session["rooms"] = null;
                    Session["amount"] = null;
                    Session["from_login"] = null;
                }

            }
        }
    }
}