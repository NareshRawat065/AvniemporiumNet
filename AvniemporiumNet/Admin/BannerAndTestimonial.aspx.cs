using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvniemporiumNet.Admin
{
    public partial class BannerAndTestimonial : BaseClass
    {
        Datautlity da = new Datautlity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBanner();
                BindTestimonial();
            }
        }

        #region Banner
        private void BindBanner()
        {
            try
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","BindBanner")
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(dr["Attachment"])))
                        {
                            dr["Attachment"] = Convert.ToString(dr["Attachment"]).Replace("~/", "../");
                        }
                    }
                    RepBannerDetails.DataSource = dt;
                    RepBannerDetails.DataBind();
                }
                else
                {
                    RepBannerDetails.DataSource = dt;
                    RepBannerDetails.DataBind();
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void RepBannerDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = Convert.ToString(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","BindBannerDetailsById"),
                                    new SqlParameter("@Id", id )
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtBannerTitle.Text = dt.Rows[0]["Title"].ToString();
                    txtBanerDescription.InnerText = dt.Rows[0]["Description"].ToString();
                    hdnBannerId.Value = id;
                    hdnfilePathBanner.Value = dt.Rows[0]["Attachment"].ToString();
                    hrefImageBanner.NavigateUrl = dt.Rows[0]["Attachment"].ToString().Replace("~/", "../");
                    //hrefImageBanner.Text = "View";
                    //hrefImageBanner.Visible = true;
                    btnSubmit.Text = "Update";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "fn_AddBanner();", true);
                }
            }
            else if (e.CommandName == "Delete")
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","DeleteBanner"),
                                    new SqlParameter("@Id", id )
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "1")
                    {
                        BindBanner();
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SuccessMessage(`Delete successfully`);", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Delete not successfully`);", true);
                    }
                }
            }
        }
        protected void btn_Submit(object sender, EventArgs e)
        {
            try
            {
                string Attachment = string.Empty;
                if (Session["Path"] != null)
                {
                    Dictionary<string, HttpPostedFile> dictionary = null;
                    dictionary = Session["Path"] as Dictionary<string, HttpPostedFile>;
                    if (dictionary.Count > 0)
                    {
                        dictionary = dictionary.Where(p => p.Key.Contains("ContentPlaceHolder1_fileuploadBanner")).ToDictionary(p => p.Key, p => p.Value);
                        if (dictionary != null && dictionary.Count > 0)
                        {
                            string FilePath = "~/Worksheet/";
                            string fileName = String.Empty;
                            foreach (string key in dictionary.Keys)
                            {
                                string filep = string.Empty;
                                HttpPostedFile postedfile = dictionary[key];
                                if (key.Split('$')[1] == "ContentPlaceHolder1_fileuploadBanner")
                                {
                                    fileName = Guid.NewGuid() + Path.GetExtension(postedfile.FileName);
                                    if (Directory.Exists(Server.MapPath(FilePath)) == false)
                                        Directory.CreateDirectory(Server.MapPath(FilePath));
                                    postedfile.SaveAs(Server.MapPath(FilePath) + fileName);
                                    Attachment = FilePath + fileName;
                                }
                            }
                        }
                    }
                }
                else
                {
                    Attachment = hdnfilePathBanner.Value;
                }

                string Action = "InsertBanner"; int id = 0;
                if (btnSubmit.Text == "Update")
                {
                    Action = "UpdateBanner";
                    id = Convert.ToInt32(hdnBannerId.Value);
                }

                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action",Action),
                                    new SqlParameter("@UserId",Convert.ToInt32(Session["UserId"])),
                                    new SqlParameter("@Id", id),
                                    new SqlParameter("@Title", txtBannerTitle.Text),
                                    new SqlParameter("@Description", txtBanerDescription.InnerText),
                                    new SqlParameter("@Attachment", Attachment),
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (Action == "InsertBanner")
                    {
                        if (dt.Rows[0]["Status"].ToString() == "1")
                        {
                            Clear();
                            BindBanner();
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SuccessMessage(`Submit successfully`);fn_AddBannerHide();", true);
                        }
                        else
                        {
                            //RunJavaScriptFunction("fn_AddBanner();");
                            //RunJavaScriptFunction("ErrorMessage(`Submit not successfully`);");                          
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Submit not successfully`); fn_AddBanner(); ", true);
                        }
                    }
                    else
                    {
                        if (dt.Rows[0]["Status"].ToString() == "1")
                        {
                            Clear();
                            BindBanner();
                            //RunJavaScriptFunction("fn_AddBannerHide();");
                            //RunJavaScriptFunction("SuccessMessage(`Update successfully`); ");                            
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SuccessMessage(`Update successfully`);fn_AddBannerHide(); ", true);
                            // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "", true);
                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Update not successfully`); fn_AddBanner();", true);
                            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`" + ex.Message.ToString() + "`);", true);
            }
        }
        protected void btn_Cancel(object sender, EventArgs e)
        {
            try
            {
                Clear();
            }
            catch (Exception ex)
            {

            }
        }
        private void Clear()
        {
            txtBannerTitle.Text = String.Empty;
            txtBanerDescription.InnerText = String.Empty;
            fileuploadBanner.Dispose();
            hdnfilePathBanner.Value = "";
            hrefImageBanner.NavigateUrl = "";
            btnSubmit.Text = "Insert";
            hdnBannerId.Value = "0";

            txtTestimonialTitle.Text = String.Empty;
            txtTesimonialDescription.InnerText = String.Empty;
            fileuploadTestimonial.Dispose();
            hdnfilePathTestimonial.Value = "";
            hrefImageTestimonial.NavigateUrl = "";
            btnSubmitTesimonial.Text = "Insert";
            hdnTesimonialId.Value = "0";
            txtRating.Text = string.Empty;
            txtUserName.Text = string.Empty;
        }
        #endregion

        #region
        private void BindTestimonial()
        {
            try
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","BindTestimonial")
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {

                    foreach (DataRow dr in dt.Rows)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(dr["Attachment"])))
                        {
                            dr["Attachment"] = Convert.ToString(dr["Attachment"]).Replace("~/", "../");
                        }
                    }
                    RepTestimonialDetails.DataSource = dt;
                    RepTestimonialDetails.DataBind();
                }
                else
                {
                    RepTestimonialDetails.DataSource = dt;
                    RepTestimonialDetails.DataBind();
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void RepTestimonialDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string id = Convert.ToString(e.CommandArgument);

            if (e.CommandName == "Edit")
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","BindTestimonialDetailsById"),
                                    new SqlParameter("@Id", id )
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtTestimonialTitle.Text = dt.Rows[0]["Title"].ToString();
                    txtTesimonialDescription.InnerText = dt.Rows[0]["Description"].ToString();
                    hdnTesimonialId.Value = id;
                    hdnfilePathTestimonial.Value = dt.Rows[0]["Attachment"].ToString();
                    hrefImageTestimonial.NavigateUrl = dt.Rows[0]["Attachment"].ToString().Replace("~/", "../");
                    //hrefImageTestimonial.Text = "View";
                    //hrefImageTestimonial.Visible = true;
                    btnSubmitTesimonial.Text = "Update";
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "fn_AddTestimonial();", true);
                }
            }
            else if (e.CommandName == "Delete")
            {
                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action","DeleteTestimonial"),
                                    new SqlParameter("@Id", id )
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Status"].ToString() == "1")
                    {
                        BindTestimonial();
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SuccessMessage(`Delete successfully`);", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Delete not successfully`);", true);
                    }
                }
            }
        }
        protected void btnTesimonial_Submit(object sender, EventArgs e)
        {
            try
            {
                string Attachment = string.Empty;
                if (Session["Path"] != null)
                {
                    Dictionary<string, HttpPostedFile> dictionary = null;
                    dictionary = Session["Path"] as Dictionary<string, HttpPostedFile>;
                    if (dictionary.Count > 0)
                    {
                        dictionary = dictionary.Where(p => p.Key.Contains("ContentPlaceHolder1_fileuploadTestimonial")).ToDictionary(p => p.Key, p => p.Value);
                        if (dictionary != null && dictionary.Count > 0)
                        {
                            string FilePath = "~/Worksheet/";
                            string fileName = String.Empty;
                            foreach (string key in dictionary.Keys)
                            {
                                string filep = string.Empty;
                                HttpPostedFile postedfile = dictionary[key];
                                if (key.Split('$')[1] == "ContentPlaceHolder1_fileuploadTestimonial")
                                {
                                    fileName = Guid.NewGuid() + Path.GetExtension(postedfile.FileName);
                                    if (Directory.Exists(Server.MapPath(FilePath)) == false)
                                        Directory.CreateDirectory(Server.MapPath(FilePath));
                                    postedfile.SaveAs(Server.MapPath(FilePath) + fileName);
                                    Attachment = FilePath + fileName;
                                }
                            }
                        }
                    }
                }
                else
                {
                    Attachment = hdnfilePathTestimonial.Value;
                }

                string Action = "InsertTestimonial"; int id = 0;
                if (btnSubmitTesimonial.Text == "Update")
                {
                    Action = "UpdateTestimonial";
                    id = Convert.ToInt32(hdnTesimonialId.Value);
                }

                SqlParameter[] _parameter ={
                                    new SqlParameter("@Action",Action),
                                    new SqlParameter("@UserId",Convert.ToInt32(Session["UserId"])),
                                    new SqlParameter("@Id", id),
                                    new SqlParameter("@Title", txtTestimonialTitle.Text),
                                    new SqlParameter("@UserName",txtUserName.Text),
                                    new SqlParameter("@Description", txtTesimonialDescription.InnerText),
                                    new SqlParameter("@Attachment", Attachment),
                                    new SqlParameter("@Rating", txtRating.Text),
                                   };
                DataTable dt = da.ExecuteDataTable("Avn_ManageBannerTestimonial", _parameter);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (Action == "InsertTestimonial")
                    {
                        if (dt.Rows[0]["Status"].ToString() == "1")
                        {
                            Clear();
                            BindTestimonial();
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SuccessMessage(`Submit successfully`); fn_AddTestimonialHide();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Submit not successfully`); fn_AddTestimonial();", true);
                        }
                    }
                    else
                    {
                        if (dt.Rows[0]["Status"].ToString() == "1")
                        {
                            Clear();
                            BindTestimonial();
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "SuccessMessage(`Update successfully`); fn_AddTestimonialHide();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`Update not successfully`); fn_AddTestimonial();", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "ErrorMessage(`" + ex.Message.ToString() + "`);", true);
            }
        }
        #endregion
    }
}