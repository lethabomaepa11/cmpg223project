using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


        }
        public void autoFill()
        {
            string email = Session["session_id"].ToString();
            if (db.selectClients($"WHERE email = '{email}'"))
            {
                DataRow row = db.clientData.Rows[0];
                TxtbCellphone.Text = row["cell_number"].ToString();
                TxtbEmail.Text = row["email"].ToString();
                TxtbName.Text = row["name"].ToString();
                TxtbSurname.Text = row["surname"].ToString();

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
            }
        }
        protected void SelectRoom_Click(object sender, EventArgs e)
        {
            lblSelectedRooms.Text = "";
            btnClear.Visible = true;
            btnBookNow.Visible = true;
            Button btnSelect = (Button)sender;
            string roomId = btnSelect.CommandArgument;
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
            amount = 0;
            
            foreach(string id in ids)
            {
                
                
                if(db.selectRooms($"WHERE room_id = '{id}'"))
                {
                    DataRow row = db.roomData.Rows[0];
                    amount += decimal.Parse(row["price"].ToString());
                }
                
                
            }
            
            lblAmount.Text = "Total Amount: "+ amount.ToString("c");
            Session["amount"] = amount;
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
        }

            protected void addRoomID(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 1;

        }
        protected void toPayment(object sender, EventArgs e)
        {
            if (Session["session_id"] == null)
            {
                //if this user is not a logged_in user
                //receive every input and insert into db
                string name, surname, cell, email;
                name = TxtbName.Text;
                surname = TxtbSurname.Text;
                email = TxtbEmail.Text;
                cell = TxtbCellphone.Text;

                Client client = new Client(email,name,surname,cell);
                if (db.insertClients(client))
                {
                    Session["booking_email"] = email;
                }
                
            }
            else
            {
                Session["booking_email"] = Session["session_id"];
            }
            
            Response.Redirect("/payment");

        }
        protected void nextPage(object sender, EventArgs e)
        {
            //if the button was clicked on the first page
            if(MultiView1.ActiveViewIndex == 0)
            {
                Session["check_in"] = txtCheckIn.Text;
                Session["check_out"] = txtCheckOut.Text;
                int num_people = int.Parse(DropDownList2.SelectedValue) + int.Parse(DropDownList3.SelectedValue);
                Session["num_people"] = num_people;
            }
            MultiView1.ActiveViewIndex++;

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