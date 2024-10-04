using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["booking_email"] == null)
            {
                Response.Redirect("/booking");
            }
            else
            {
                lblAmount.Text += double.Parse(Session["amount"].ToString()).ToString("c");
                lblCheckIn.Text = DateTime.Parse(Session["check_in"].ToString()).ToString("dddd, dd MMMM yyyy");
                lblCheckOut.Text = DateTime.Parse(Session["check_out"].ToString()).ToString("dddd, dd MMMM yyyy");
                lblNumPeople.Text = Session["num_people"].ToString();
                lblName.Text = Session["name"].ToString();
                lblEmail.Text = Session["email"].ToString();
                lblPhone.Text = Session["cell"].ToString();
                lblSurname.Text = Session["surname"].ToString();
                string[] rooms = Session["rooms"].ToString().Split('%');
                int num_rooms = rooms.Length - 1;
                lblNumRooms.Text = num_rooms.ToString();
            }

            double amount = double.Parse(Session["initAmount"].ToString());
            
            double discount = amount * 0.09;
            string finalDiscount = discount.ToString("c");
            if (Session["session_id"] != null)
            {
                //show discount for user
                lblDiscount.Text = $"Since you are a registered user, we have discounted you with {finalDiscount}";
                lblAmount.Text = "New amount \n" + (amount - discount).ToString("c");
                Session["amount"] = (amount - discount);
            }
            else
            {
                lblDiscount.Text = $"As a registered user, you would have qualified for a {finalDiscount}  discount";
            }
        }
        protected void editBookingInfo(object sender, EventArgs e)
        {
            Session["editBookingInfo"] = true;
            Response.Redirect("/booking");
        }
        protected void cancelBooking(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/");
        }
        protected void confirmPayment(object sender, EventArgs e)
        {
            Session["from_login"] = null;
            //make the booking
            Database db = new Database();
            string email, check_in, check_out;
            decimal price = (decimal)double.Parse(Session["amount"].ToString());
            int num_people = int.Parse(Session["num_people"].ToString());
            email = Session["booking_email"].ToString();
            check_in = Session["check_in"].ToString();
            check_out = Session["check_out"].ToString();
            string code = db.generateRandom(5);
            Session["code"] = code;
            //check num of rooms
            string[] rooms = Session["rooms"].ToString().Split('%');
            int num_rooms = rooms.Length-1;
            Booking booking = new Booking(code, email, num_people, price, num_rooms, check_in, check_out);
            if (db.insertBookings(booking))
            {
                foreach(string id in rooms)
                {
                    db.insertRooms(code, id);
                }
            }

            Response.Redirect("/summary");
        }
    }
}