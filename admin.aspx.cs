using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            DateTime date = DateTime.Today;
            Calendar1.SelectedDate = date;
            //int[] clients = { 5, 9 };
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
    }
}