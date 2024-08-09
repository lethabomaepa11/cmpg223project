using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class Profile : System.Web.UI.Page
    {
        Database db = new Database();
        String email = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(Session["session_id"] != null)
            {

                
                    email = Session["session_id"].ToString();
                    if (db.selectClients($"WHERE email = '{email}'"))
                    {
                        LoadProfileData();
                        if (db.selectBookings($"WHERE user_email = '{email}'"))
                        {
                            gridBookings.DataSource = db.bookingData;
                            gridBookings.DataBind();
                        }
                        if (db.selectLostFound($"WHERE description LIKE '%{email}%'"))
                        {
                            gridClaimedLostFound.DataSource = db.lostFoundData;
                            gridClaimedLostFound.DataBind();
                        }
                        //find items could possibly be for this user
                        if(db.bookingData.Rows.Count > 0)
                        {
                            DataTable userItems = new DataTable();
                            foreach(DataRow booking in db.bookingData.Rows)
                            {
                                String code = booking["reservation_code"].ToString();
                                if (db.checkLostFound(code))
                                {
                                    userItems.Merge(db.lostFoundData);
                                }
                            }
                            //make sure your display it on a gridview
                            
                        }
                    }
                    else
                    {
                        Response.Redirect("/Auth");
                    }
                
            }
            else
            {
                Response.Redirect("/Auth");
            }
            

        }

        private void LoadProfileData()
        {
            DataRow client = db.clientData.Rows[0];
           
            lblName.Text = client["name"].ToString();
            lblSurname.Text = client["surname"].ToString();
            lblEmail.Text = client["email"].ToString();
            lblCellNumber.Text = client["cell_number"].ToString();

            txtName.Text = lblName.Text;
            txtSurname.Text = lblSurname.Text;
            txtEmail.Text = lblEmail.Text;
            txtCellNumber.Text = lblCellNumber.Text;
            ViewPanel.Visible = true;
            EditPanel.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            String name = txtName.Text;
            String surname = txtSurname.Text;
            String newEmail = txtEmail.Text;
            String phone = txtCellNumber.Text;
            if(db.updateClients(email,$"name = '{name}', surname = '{surname}', cell_number = '{phone}'"))
            {
                LoadProfileData();
                ViewPanel.Visible = true;
                EditPanel.Visible = false;
            }
            
        }
        /*
        private static UserProfile userprofile = new UserProfile
        {
            Name = "John",
            Surname = "Doe",
            Email = "johndoe@example.com",
            Phone = "0813002192"
        };*/

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ViewPanel.Visible = true;
            EditPanel.Visible = false;
        }

        protected void btnEditInfo_Click(object sender, EventArgs e)
        {
            ViewPanel.Visible = false;
            EditPanel.Visible = true;
        }
    }

    public class UserProfile
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

    }
}