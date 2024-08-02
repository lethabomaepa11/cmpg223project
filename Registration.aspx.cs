using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Authentication
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            HttpCookie register = new HttpCookie("reg");
            register["Name"] = TxtbName.Text;
            register["Surname"] = TxtbSurname.Text;
            register["Email"] = TxtbEmail.Text;
            register["Cell"] = TxtbCell.Text;
            register["Password"] = TxtbPassword.Text;
            register["Confirm"] = TxtbConfirmP.Text;

            //code for password

            register.Expires = DateTime.Now.AddDays(90);

            Response.Cookies.Add(register);


            Response.Redirect("Login.aspx");

        }
    }
}