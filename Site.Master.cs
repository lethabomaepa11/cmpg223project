using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["session_id"] != null)
            {
                if (Session["session_id"] == "ad1010")
                {
                    Response.Redirect("/admin");
                }
                else
                {
                    btnToLogin.Enabled = false;
                }
            }
            else
            {
                btnToProfile.Enabled = false;
            }
        }
    }
}