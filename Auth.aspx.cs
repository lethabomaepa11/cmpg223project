using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class Auth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ToLogin(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        protected void ToRegister(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}