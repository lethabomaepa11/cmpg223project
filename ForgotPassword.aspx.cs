using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        Database db = new Database();
        String email, phone, age, newPassword;
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            lblError.Text = "";
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            
            email = txtEmail.Text;
            phone = txtPhone.Text;
            age = txtAge.Text;
            

            if(db.selectClients($"WHERE email='{email}' AND cell_number='{phone}' AND age='{age}'"))
            {
                MultiView1.ActiveViewIndex = 1;
                Session["email"] = email;
            }
            else
            {
                //show error
                lblError.Text = "User not found!!";
            }
            
        }
        protected void Change_Click(object sender, EventArgs e)
        {
            newPassword = txtNewPassword.Text;
            newPassword = db.hash(newPassword);
            email = Session["email"].ToString();
            if (db.updateClients(email, $"password = '{newPassword}'"))
            {
                Session["session_id"] = email;
                MultiView1.ActiveViewIndex = 0;
                Response.Redirect("/profile");
            }
        }
       
}
}