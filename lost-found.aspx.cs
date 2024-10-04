using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cmpg223project
{
    public partial class lost_found : System.Web.UI.Page
    {
        Database db = new Database();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
             //db = new Database();
            //db.insertClients();
            //db.close();
        }

        protected void btnCheckItems_Click(object sender, EventArgs e)
        {
            string reservationCode = txtReservationCode.Text;
            if (db.checkLostFound(reservationCode))
            {
                Label2.Text = reservationCode;
                MultiView1.ActiveViewIndex = 1;
                txtConfirmCode.Text = reservationCode;
                gridLostFound.DataSource = db.lostFoundData;
                gridLostFound.DataBind();
                lblNumItems.Text = ""+db.lostFoundData.Rows.Count;
            }
            else
            {
                Label3.Text = reservationCode;
                MultiView1.ActiveViewIndex = 2;
            }

        }

        protected void ClaimItems(object sender, EventArgs e)
        {
            //get the verify all items
            string email, phone, code;
            code = txtConfirmCode.Text;
            phone = "" + txtNumber.Text;
            email = txtEmail.Text;
            if(db.selectBookings($"WHERE reservation_code = '{code}' AND user_email = '{email}'"))
            {
                db.checkLostFound(code);
                foreach (DataRow row in db.lostFoundData.Rows)
                {
                    if(row["item_id"] != DBNull.Value)
                    {
                        String id = row["item_id"].ToString();
                        db.updateLostFound(id, $"description = 'claimed by {email}'");
                        //lblTest.Text = id;
                    }
                }
                resCode1.Text = code;
                MultiView1.ActiveViewIndex = 3;
            }
            else
            {
                //wrong details entered for the claim
                lblError.Text = "Wrong details entered, try again.";
                MultiView1.ActiveViewIndex = 1;
            }
        }
    }
}