using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            lblName.Text = userprofile.Name;
            lblSurname.Text = userprofile.Surname;
            lblEmail.Text = userprofile.Email;
            lblCellNumber.Text = userprofile.Phone;

            txtName.Text = userprofile.Name;
            txtSurname.Text = userprofile.Surname;
            txtEmail.Text = userprofile.Email;
            txtCellNumber.Text = userprofile.Phone;

            ViewPanel.Visible = true;
            EditPanel.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            userprofile.Name = txtName.Text;
            userprofile.Surname = txtSurname.Text;
            userprofile.Email = txtEmail.Text;
            userprofile.Phone = txtCellNumber.Text;

            LoadProfileData();
            ViewPanel.Visible = true;
            EditPanel.Visible = false;
        }

        private static UserProfile userprofile = new UserProfile
        {
            Name = "John",
            Surname = "Doe",
            Email = "johndoe@example.com",
            Phone = "0813002192"
        };

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