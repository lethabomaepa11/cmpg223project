using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace cmpg223project
{
    public partial class Booking1 : System.Web.UI.Page
    {
        int page = 0;
        Database db = new Database();
        decimal amount;
        protected void Page_Load(object sender, EventArgs e)
        {
            //add rooms, (description,price, image_url, room_type)
            String[] images = { "https://images.pexels.com/photos/1329711/pexels-photo-1329711.jpeg?auto=compress&cs=tinysrgb&w=600", "https://images.pexels.com/photos/1743231/pexels-photo-1743231.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/2725675/pexels-photo-2725675.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/3144580/pexels-photo-3144580.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/3659681/pexels-photo-3659681.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/5998137/pexels-photo-5998137.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/6186810/pexels-photo-6186810.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/2489114/pexels-photo-2489114.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/4915547/pexels-photo-4915547.jpeg?auto=compress&cs=tinysrgb&w=400", "https://images.pexels.com/photos/3659683/pexels-photo-3659683.jpeg?auto=compress&cs=tinysrgb&w=400" };
            /*
             for(int i = 0; i < images.Length; i++)
             {
                 Random rand = new Random();
                 double price = rand.NextDouble() * (10000 - 300) + 300;
                 Room room = new Room("Available", price, images[i],"Lux");
                 if (db.insertIntoRooms(room))
                 {
                     Console.WriteLine(room.image_url + " added!!");
                     ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", $"alert('Successfully Added {price}');", true);

                 }
             }*/
            
            MultiView1.ActiveViewIndex = 0;
            if (!IsPostBack)
            {
               
                if (db.selectRooms())
                {
                    rooms.DataSource = db.roomData;
                    rooms.DataBind();
                }
               
            }
            
            if (Session["rooms"] != null)
            {
                btnClear.Visible = true;
                btnBookNow.Visible = true;
                lblSelectedRooms.Text = "";
                amount = (decimal)double.Parse(Session["amount"].ToString());
                lblAmount.Text = amount.ToString("c");
            }
            else
            {
                btnClear.Visible = false;
                btnBookNow.Visible = false;
                lblAmount.Text = 0.ToString("c");
                lblSelectedRooms.Text = "No rooms selected!";
            }
            if (Session["from_login"] != null)
            {
                nextPager(sender, e);
                MultiViewContact.ActiveViewIndex = 1;
                //get data from the db
                autoFill();
            
            }
            if (Session["editBookingInfo"] != null)
            {
                //Session["editBookingInfo"] = null;
                MultiView1.ActiveViewIndex = 0;
                txtCheckIn.Text = Session["check_in"].ToString();
                txtCheckOut.Text = Session["check_out"].ToString();
                //DropDownList3.Text = Session["num_people"].ToString();
                TxtbName.Text = Session["name"].ToString();
                TxtbEmail.Text = Session["email"].ToString();
                TxtbSurname.Text = Session["surname"].ToString();
                TxtbCellphone.Text = Session["cell"].ToString();
                MultiViewContact.ActiveViewIndex = 1;
            }


        }
        public void autoFill()
        {
            Session["back_path"] = null;
            string email = Session["session_id"].ToString();
            if (db.selectClients($"WHERE email = '{email}'"))
            {
                DataRow row = db.clientData.Rows[0];
                TxtbCellphone.Text = row["cell_number"].ToString();
                TxtbCellphone.Enabled = false;
                TxtbEmail.Text = row["email"].ToString();
                TxtbEmail.Enabled = false;
                TxtbName.Text = row["name"].ToString();
                TxtbName.Enabled = false;
                TxtbSurname.Text = row["surname"].ToString();
                TxtbSurname.Enabled = false;
                clientAlert.Text = "Your information has been autofilled since you are logged in as " + row["name"].ToString() + " " + row["surname"].ToString();
            }
            
        }
        protected void trackViewChanged(object sender, EventArgs e)
        {
            if(MultiViewContact.ActiveViewIndex == 0)
            {
                if (Session["editBookingInfo"] != null)
                {
                    Session["editBookingInfo"] = null;
                    MultiViewContact.ActiveViewIndex = 1;
                }
            }
        }
            protected void accountQuestion(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            if (rbLoginStatus.SelectedIndex == 0)
            {
                Session["back_path"] = "/booking";
                Session["multiview_index"] = "3";
                Response.Redirect("/auth");
            }
            else
            {
                MultiViewContact.ActiveViewIndex = 1;
                if (Session["session_id"] != null)
                {
                    autoFill();
                }
            }
        }
        protected void SelectRoom_Click(object sender, EventArgs e)
        {
            lblSelectedRooms.Text = "";
            lblShowCalculations.Text = string.Empty;
            btnClear.Visible = true;
            btnBookNow.Visible = true;
            Button btnSelect = (Button)sender;
            string roomId = btnSelect.CommandArgument;
            string checkIn = Session["check_in"].ToString();
            string checkOut = Session["check_out"].ToString();
            int days = DateTime.Parse(checkOut).Subtract(DateTime.Parse(checkIn)).Days;
            //string rooms = null;//will be divided by %
            if(Session["rooms"] != null)
            {
                Session["rooms"] += roomId + "%";
                //lblSelectedRooms.Text = Session["rooms"].ToString();
            }
            else
            {
                Session["rooms"] = roomId + "%";
                //lblSelectedRooms.Text = Session["rooms"].ToString();
            }

            //lblSelectedRooms.Text = rooms;
            string rooms = Session["rooms"].ToString();
            string[] ids = rooms.Split('%');
            //lblSelectedRooms.Text = ""+ids.Length;
            amount = 0;
            int capacity = 0;
            
            foreach(string id in ids)
            {
                
                
                if(db.selectRooms($"WHERE room_id = '{id}'"))
                {
                    DataRow row = db.roomData.Rows[0];
                    amount += decimal.Parse(row["price"].ToString())*days-1;//if you check in today(07 Oct) and check out (10 Oct) its not 3 nights but 2 nights, 07 and 08 
                    capacity += int.Parse(row["limit"].ToString());
                    //lblShowCalculations.Text += decimal.Parse(row["price"].ToString()) + " + ";
                }
                
                
            }
            //check if the number of people are more than the capacity of the rooms
            int num_people = int.Parse(Session["num_people"].ToString());
            if(num_people > capacity)
            {
                lblShowCalculations.Text = $"You might have to choose another room because {num_people-capacity} people will not be accomodated";
                btnBookNow.Enabled = false;
                btnBookNow.Visible = false;
                btnBookNow.Text = "You cannot proceed!";
            }
            else
            {
                btnBookNow.Visible = true;
                btnBookNow.Enabled = true;
                btnBookNow.Text = "Book now";
                lblShowCalculations.Text += "For " + days.ToString() + " nights the total is:";
            }
            //show calculations 
            lblAmount.Text =  amount.ToString("c");
            Session["amount"] = amount;
            //to prevent the bug where the amount gets discounted everytime after a reload in payment.aspx
            Session["initAmount"] = amount;
            MultiView1.ActiveViewIndex = 1;
        }
        protected void clearSelection(object sender, EventArgs e)
        {
            if (Session["rooms"] != null)
            {
                Session["rooms"] = null;
                Session["amount"] = null;
                lblAmount.Text = string.Empty;  
                btnBookNow.Visible = false;
                btnClear.Visible = false;
            }
            lblSelectedRooms.Text = "No rooms selected!";
            MultiView1.ActiveViewIndex = 1;
            lblShowCalculations.Text = "";
        }

            protected void addRoomID(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 1;

        }
        protected void toPayment(object sender, EventArgs e)
        {
            string name, surname, cell, email;
            name = TxtbName.Text;
            surname = TxtbSurname.Text;
            email = TxtbEmail.Text;
            cell = TxtbCellphone.Text;
            if (Session["session_id"] == null)
            {
                //if this user is not a logged_in user
                //receive every input and insert into db
                Session["name"] = name;
                Session["surname"] = surname;
                Session["email"] = email;
                Session["cell"] = cell;
                    
                Client client = new Client(email,name,surname,cell);
                if (db.insertClients(client))
                {
                    Session["booking_email"] = email;
                }
                Session["booking_email"] = email;
            }
            else
            {
                Session["booking_email"] = Session["session_id"];
                Session["name"] = name;
                Session["surname"] = surname;
                Session["email"] = email;
                Session["cell"] = cell;
            }
            
            Response.Redirect("/payment");

        }
        protected void nextPage(object sender, EventArgs e)
        {
            //if the button was clicked on the first page
            if(MultiView1.ActiveViewIndex == 0)
            {
                DateTime checkIn = DateTime.Parse(txtCheckIn.Text);
                DateTime checkOut = DateTime.Parse(txtCheckOut.Text);
                //check if the the check in date is in the past or future
                if ( checkIn.CompareTo(DateTime.Now.AddDays(-1)) > -1)
                {
                    checkInError.Text = "";
                    //check if the the check out date is before the check in date or more than 10days after the check in date
                    if (checkOut.CompareTo(checkIn.AddDays(1)) < 0 || checkOut.CompareTo(checkIn.AddDays(31)) > 0)
                    {
                        checkOutError.Text = "Check out date must be between 1 to 31 days after check in date";
                    }
                    else
                    {
                        checkOutError.Text = "";
                        Session["check_in"] = txtCheckIn.Text;
                        Session["check_out"] = txtCheckOut.Text;
                        int num_people = int.Parse(DropDownList2.SelectedValue) + int.Parse(DropDownList3.SelectedValue);
                        Session["num_people"] = num_people;
                        MultiView1.ActiveViewIndex++;
                    }
                }
                else
                {
                    checkInError.Text = "Check in date cannot be in the past!!";
                }
            }
            

        }
        protected void prevPage(object sender, EventArgs e)
        {
            //++page;
            MultiView1.ActiveViewIndex--;

        }
        protected void nextPager(object sender, EventArgs e)
        {
            //++page;
            MultiView1.ActiveViewIndex = 2;
            if (Session["session_id"]  != null)
            {
                MultiViewContact.ActiveViewIndex = 1;
                autoFill();
            }
            else
            {
                MultiViewContact.ActiveViewIndex = 0;
            }

        }

    }
}