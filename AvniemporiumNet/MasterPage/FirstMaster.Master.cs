using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvniemporiumNet.MasterPage
{
    public partial class FirstMaster : System.Web.UI.MasterPage
    {
        Datautlity da = new Datautlity();

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("../Index.aspx", true);
            }
            if (!IsPostBack)
            {
                BindHeaderDetails();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        private void BindHeaderDetails()
        {
            SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","BindDetilsById"),
                                    new SqlParameter("@UserId",Session["UserId"] )
                                   };
            DataTable dt = da.ExecuteDataTable("Avn_ManageAdminLogin", _parameter);
            if (dt != null && dt.Rows.Count > 0)
            {
                lblUsername.Text = dt.Rows[0]["FullName"].ToString();
                lblddlName.Text = dt.Rows[0]["FullName"].ToString();
            }
        }

        protected void lnkbtnSignOut_click(object sender, EventArgs e)
        {
            Session["UserId"] = null;
            Session.Clear();
            Response.Redirect("../Index.aspx", true);
        }
    }
}