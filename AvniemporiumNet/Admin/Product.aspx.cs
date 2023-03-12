using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AvniemporiumNet.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialRow();
            }
        }
        protected void btnNewRowForProduct_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "fn_AddProductShowPopUp();", true);
        }
        protected void GrvProduct_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
                if (lb != null)
                {
                    if (dt.Rows.Count > 1)
                    {
                        if (e.Row.RowIndex == dt.Rows.Count - 1)
                        {
                            lb.Visible = false;
                        }
                    }
                    else
                    {
                        lb.Visible = false;
                    }
                }
            }
        }
        protected void lblBtnRemoveRowForProduct_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        dt.Rows.Remove(dt.Rows[rowID]);
                        ResetRowID(dt);
                    }
                }
                ViewState["CurrentTable"] = dt;
                GrvProduct.DataSource = dt;
                GrvProduct.DataBind();
            }
            SetPreviousData();
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "fn_AddProductShowPopUp();", true);
        }

        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("ForCategory", typeof(string)));//for TextBox value   
            dt.Columns.Add(new DataColumn("ProductCategory", typeof(string)));//for TextBox value   
            dt.Columns.Add(new DataColumn("ProductType", typeof(string)));//for DropDownList selected item   
            dt.Columns.Add(new DataColumn("ProductColor", typeof(string)));//for DropDownList selected item  
            dt.Columns.Add(new DataColumn("Price", typeof(string)));//for DropDownList selected item  
            dt.Columns.Add(new DataColumn("DiscountedPrice", typeof(string)));//for DropDownList selected item  
            dt.Columns.Add(new DataColumn("Size", typeof(string)));//for DropDownList selected item  
            dt.Columns.Add(new DataColumn("Description", typeof(string)));//for DropDownList selected item  
            dt.Columns.Add(new DataColumn("ProductImage", typeof(string)));//for DropDownList selected item  

            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["ForCategory"] = string.Empty;
            dr["ProductCategory"] = string.Empty;
            dr["ProductType"] = string.Empty;
            dr["ProductColor"] = string.Empty;
            dr["Price"] = string.Empty;
            dr["DiscountedPrice"] = string.Empty;
            dr["Size"] = string.Empty;
            dr["Description"] = string.Empty;
            dr["ProductImage"] = string.Empty;
            dt.Rows.Add(dr);

            ViewState["CurrentTable"] = dt;

            GrvProduct.DataSource = dt;
            GrvProduct.DataBind();
        }
        private void AddNewRowToGrid()
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;

                    dtCurrentTable.Rows.Add(drCurrentRow);

                    ViewState["CurrentTable"] = dtCurrentTable;

                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {
                        DropDownList ddlForCategory = (DropDownList)GrvProduct.Rows[i].Cells[1].FindControl("ddlForCategory");
                        DropDownList ddlProductCategory = (DropDownList)GrvProduct.Rows[i].Cells[2].FindControl("ddlProductCategory");
                        DropDownList ddlProductType = (DropDownList)GrvProduct.Rows[i].Cells[3].FindControl("ddlProductType");
                        DropDownList ddlProductColor = (DropDownList)GrvProduct.Rows[i].Cells[4].FindControl("ddlProductColor");
                        FileUpload fileupload = (FileUpload)GrvProduct.Rows[i].Cells[5].FindControl("fileupload");
                        TextBox txtPrice = (TextBox)GrvProduct.Rows[i].Cells[6].FindControl("txtPrice");
                        TextBox txtDiscountedPrice = (TextBox)GrvProduct.Rows[i].Cells[7].FindControl("txtDiscountedPrice");
                        DropDownList ddlProductSize = (DropDownList)GrvProduct.Rows[i].Cells[8].FindControl("ddlProductSize");
                        TextBox txtDescription = (TextBox)GrvProduct.Rows[i].Cells[9].FindControl("txtDescription");

                        dtCurrentTable.Rows[i]["ForCategory"] = ddlForCategory.SelectedValue;
                        dtCurrentTable.Rows[i]["ProductCategory"] = ddlProductCategory.SelectedValue;
                        dtCurrentTable.Rows[i]["ProductType"] = ddlProductType.SelectedValue;
                        dtCurrentTable.Rows[i]["ProductColor"] = ddlProductColor.SelectedValue;

                        if (Session["Path"] != null)
                        {
                            Dictionary<string, HttpPostedFile> dictionary = null;
                            dictionary = Session["Path"] as Dictionary<string, HttpPostedFile>;
                            if (dictionary.Count > 0)
                            {
                                dictionary = dictionary.Where(p => p.Key.Contains("ContentPlaceHolder1_GrvProduct_fileupload_" + i + "")).ToDictionary(p => p.Key, p => p.Value);
                                if (dictionary != null && dictionary.Count > 0)
                                {
                                    string FilePath = "~/Worksheet/";
                                    string fileName = String.Empty;
                                    foreach (string key in dictionary.Keys)
                                    {
                                        string filep = string.Empty;
                                        HttpPostedFile postedfile = dictionary[key];
                                        if (key.Split('$')[1] == "ContentPlaceHolder1_GrvProduct_fileupload_" + i + "")
                                        {
                                            fileName = Guid.NewGuid() + Path.GetExtension(postedfile.FileName);
                                            if (Directory.Exists(Server.MapPath(FilePath)) == false)
                                                Directory.CreateDirectory(Server.MapPath(FilePath));
                                            postedfile.SaveAs(Server.MapPath(FilePath) + fileName);
                                            dtCurrentTable.Rows[i]["ProductImage"] = FilePath + fileName;
                                        }
                                    }
                                }
                            }
                        }
                        //if (fileupload.HasFile)
                        //{
                        //    string FilePath = "~/Worksheet/";
                        //    string fileName = String.Empty;
                        //    fileName = Guid.NewGuid() + Path.GetExtension(fileupload.FileName);
                        //    if (Directory.Exists(Server.MapPath(FilePath)) == false)
                        //        Directory.CreateDirectory(Server.MapPath(FilePath));
                        //    fileupload.SaveAs(Server.MapPath(FilePath) + fileName);
                        //    dtCurrentTable.Rows[i]["ProductImage"] = FilePath + fileName;
                        //}
                        dtCurrentTable.Rows[i]["Price"] = txtPrice.Text;
                        dtCurrentTable.Rows[i]["DiscountedPrice"] = txtDiscountedPrice.Text;
                        dtCurrentTable.Rows[i]["Size"] = ddlProductSize.SelectedValue;
                        dtCurrentTable.Rows[i]["Description"] = txtDescription.Text;
                    }
                    //Session["Path"] = null;
                    GrvProduct.DataSource = dtCurrentTable;
                    GrvProduct.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");

            }
            SetPreviousData();
        }
        private void SetPreviousData()
        {
            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 0; i < dtCurrentTable.Rows.Count; i++)
                    {
                        DropDownList ddlForCategory = (DropDownList)GrvProduct.Rows[i].Cells[1].FindControl("ddlForCategory");
                        DropDownList ddlProductCategory = (DropDownList)GrvProduct.Rows[i].Cells[2].FindControl("ddlProductCategory");
                        DropDownList ddlProductType = (DropDownList)GrvProduct.Rows[i].Cells[3].FindControl("ddlProductType");
                        DropDownList ddlProductColor = (DropDownList)GrvProduct.Rows[i].Cells[4].FindControl("ddlProductColor");
                        FileUpload fileupload = (FileUpload)GrvProduct.Rows[i].Cells[5].FindControl("fileupload");
                        TextBox txtPrice = (TextBox)GrvProduct.Rows[i].Cells[6].FindControl("txtPrice");
                        TextBox txtDiscountedPrice = (TextBox)GrvProduct.Rows[i].Cells[7].FindControl("txtDiscountedPrice");
                        DropDownList ddlProductSize = (DropDownList)GrvProduct.Rows[i].Cells[8].FindControl("ddlProductSize");
                        TextBox txtDescription = (TextBox)GrvProduct.Rows[i].Cells[9].FindControl("txtDescription");
                        HyperLink hrefImage = (HyperLink)GrvProduct.Rows[i].Cells[9].FindControl("hrefImage");

                        if (i < dtCurrentTable.Rows.Count - 1)
                        {
                            ddlForCategory.ClearSelection();
                            ddlProductCategory.ClearSelection();
                            ddlProductType.ClearSelection();
                            ddlProductColor.ClearSelection();
                            ddlProductSize.ClearSelection();

                            ddlForCategory.Items.FindByValue(dtCurrentTable.Rows[i]["ForCategory"].ToString()).Selected = true;
                            ddlProductCategory.Items.FindByValue(dtCurrentTable.Rows[i]["ProductCategory"].ToString()).Selected = true;
                            ddlProductType.Items.FindByValue(dtCurrentTable.Rows[i]["ProductType"].ToString()).Selected = true;
                            ddlProductColor.Items.FindByValue(dtCurrentTable.Rows[i]["ProductColor"].ToString()).Selected = true;
                            if (!String.IsNullOrEmpty(dtCurrentTable.Rows[i]["ProductImage"].ToString()))
                            {
                                hrefImage.NavigateUrl = dtCurrentTable.Rows[i]["ProductImage"].ToString();
                                hrefImage.Visible = true;
                                hrefImage.Text = "View";
                            }
                            txtPrice.Text = dtCurrentTable.Rows[i]["Price"].ToString();
                            txtDiscountedPrice.Text = dtCurrentTable.Rows[i]["DiscountedPrice"].ToString();
                            ddlProductSize.SelectedValue = dtCurrentTable.Rows[i]["Size"].ToString();
                            txtDescription.Text = dtCurrentTable.Rows[i]["Description"].ToString();
                        }
                        rowIndex++;
                    }
                }
            }
        }
        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}