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
            
            if (Request.Cookies["rooms"] != null)
            {
                btnClear.Visible = true;
                btnBookNow.Visible = true;
                lblSelectedRooms.Text = "";

            }
            else
            {
                btnClear.Visible = false;
                btnBookNow.Visible = false;
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
            string rooms = null;//will be divided by %
            if(Response.Cookies.Get("rooms") != null)
            {
                HttpCookie roomsCookie = Request.Cookies["rooms"];
                if(roomsCookie.Value != null)
                {
                    rooms = roomsCookie.Value;
                    rooms = rooms.Replace("rooms=", "").Trim();
                    rooms += roomId + "%";
                }
                else
                {
                    rooms = roomId+ "%";
                }
                roomsCookie.Value = rooms;
                roomsCookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Set(roomsCookie);
                //lblSelectedRooms.Text = rooms;
            }
            else
            {
                HttpCookie roomCookie = new HttpCookie("rooms");
                roomCookie["rooms"] = roomId+"%";
                rooms = roomCookie.Value;
                Response.Cookies.Add(roomCookie);
            }
            
            //lblSelectedRooms.Text = rooms;
            string[] ids = rooms.Split('%');
            decimal amount = 0;
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
            if (Request.Cookies["rooms"] != null)
            {
                HttpCookie cookie = new HttpCookie("rooms");
                cookie.Expires = DateTime.Now.AddDays(-1);

                Response.Cookies.Add(cookie);
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
        protected void nextPage(object sender, EventArgs e)
        {
            //++page;
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