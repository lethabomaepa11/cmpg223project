using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class Auth : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void ToLogin(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        protected void ToRegister(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        protected void Register(object sender, EventArgs e)
        {
            string name, cellphone, surname, age, email, password;
            name = TxtbName.Text;
            cellphone = TxtbCellphone.Text;
            surname = TxtbSurname.Text;
            age = TxtbAge.Text;
            email = TxtbEmail.Text;
            password = TxtbPassword.Text;
            string confirmp = TxtbConfirm.Text;
            if(confirmp == password)
            {
               password = db.hash(password);
               Client client = new Client(email,name,surname,cellphone,age,password);
                if (db.insertClients(client))
                {
                    Session["session_id"] = email;
                    Response.Redirect("/profile");
                }
                else
                {
                    LblConfirm.Text = "Couldn't add";
                }
            }
            else
            {
                LblConfirm.Text = "Passwords don't match!.";
            }
        }

        protected void Login(object sender, EventArgs e)
        {
            string email,password;
            email = TxtbEmail0.Text;
            password = TxtbPassword0.Text;
            loginAlert.Enabled = true;
            loginAlert.Text = "Loading...";
            if (email != "admin@potchstream.com")
            {
                //normal user
                if (db.selectClients($"WHERE email = '{email}'"))
                {
                    String hashedPassword = null;
                    foreach (DataRow row in db.clientData.Rows)
                    {
                        hashedPassword = row["password"].ToString();
                    }
                    if (db.verify(password, hashedPassword))
                    {
                        Session["session_id"] = email;
                        if (Session["back_path"] != null)
                        {
                            Session["from_login"] = true;
                            Response.Redirect(Session["back_path"].ToString());
                        }
                        else
                        {
                            Response.Redirect("/");
                        }
                        
                    }
                    else
                    {
                        loginAlert.Text = "Wrong Password!!";
                    }
                }
                else
                {
                    loginAlert.Text = "No account exists for " + email;
                }
            }
            else
            {
                //admin
                if(password == "root")
                {
                    Session["session_id"] = "ad1010";
                    Response.Redirect("/admin");
                }
                else
                {
                    loginAlert.Text = "Wrong Password!!";
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void ToForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ForgotPassword");
        }
    }
}