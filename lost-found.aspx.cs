﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class lost_found : System.Web.UI.Page
    {
        Database db;
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
             db = new Database();
            //db.insertClients();
            //db.close();
        }

        protected void btnCheckItems_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            //db.delete("Jeff", "monkey"); -> will throw error
            
            string[] itemIds = {"aaa","bbb","ccc","ddd","eee"};//sample
            //validate the reservation code in the database
            //then check any lost and found items that relate to this reservation code
            //there are 3 views, view 2 is the one that shows all items if available, view 3 is the one that shows an error
            string reservationCode = txtReservationCode.Text;
           
            if (itemIds.Contains(reservationCode) )
            {
                Label2.Text = reservationCode;
                MultiView1.ActiveViewIndex = 1;
                txtConfirmCode.Text = reservationCode;
                foreach(string itemId in itemIds)
                {
                    listItems.Items.Add(itemId);
                }
            }
            else
            {
                Label3.Text = reservationCode;
                MultiView1.ActiveViewIndex = 2;
            }

            
            string name, surname, email, phone;
            DateTime check_in,check_out;
            int num_rooms, num_people;
            email = "leth@gmail.com";
            Label3.Text = db.generateRandom(5);
            Client client = new Client(email,"leth","maeee","012225553");
            /*Database db = new Database();
            if (db.insertClients(client))
            {
                Booking booking = new Booking(res_code, email, 4, 690, 1, "new DateTime()", "new DateTime().AddDays(4)");
                if(db.insertBookings(booking))
                {
                    //get all the chosen rooms via cookies cos they must be stored in cookies
                    int[] roomIDs;
                    db.insertRooms(res_code, 1);
                    /*for (all rooms chosen)
                    {
                        
                    }
                }
            }*/

        }
    }
}