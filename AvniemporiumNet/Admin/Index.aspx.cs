using CommonFn;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvniemporiumNet.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        Datautlity da = new Datautlity();
        CommonFunction cm = new CommonFunction();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","Login"),
                                    new SqlParameter("@Username",txtUserId.Text),
                                    new SqlParameter("@Password",txtPassword.Text),
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageAdminLogin", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    //string pwd = cm.Decrypt(dt.Rows[0]["Password"].ToString());
                    //if (pwd == txtPassword.Text)
                    //{
                        Session["UserId"] = dt.Rows[0]["id"].ToString();
                        Response.Redirect("Dashboard.aspx", true);
                        Response.Redirect("", true);

                    //}
                   
                }
                else
                {
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Incorrect Password`);", true);
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}