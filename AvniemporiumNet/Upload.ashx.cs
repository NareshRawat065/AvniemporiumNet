using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MoneyMade
{
    /// <summary>
    /// Summary description for Upload
    /// </summary>
    public class Upload : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;
            try
            {
                string[] id = context.Request["id"].Split(',');
                HttpFileCollection uploads = context.Request.Files;
                if (context.Session["Path"] == null)
                {
                    DefineDictionary(context);
                }
                Dictionary<string, HttpPostedFile> list = (Dictionary<string, HttpPostedFile>)HttpContext.Current.Session["Path"];
                for (int i = 0; i < uploads.Count; i++)
                {
                    try
                    {
                        string count = string.Empty;
                        if (id[i] != count)
                        {
                            if (list.ContainsKey("file$" + id[i] + "$" + i.ToString()))
                            {
                                for (int j = list.Count - 1; j >= 0; j--)
                                {
                                    if (list.ContainsKey("file$" + id[i] + "$" + i.ToString()))
                                    {
                                        list.Remove("file$" + id[i] + "$" + i.ToString());

                                    }
                                }
                                count = id[i];
                            }
                        }
                        HttpPostedFile hpfs = (HttpPostedFile)uploads[i];
                        list.Add("file$" + id[i] + "$" + i.ToString(), hpfs);
                    }
                    catch (Exception) { }
                }
                context.Session["Path"] = list;
            }
            catch (Exception ex)
            {
                context.Response.Write("Error: " + ex.Message);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void DefineDictionary(HttpContext context)
        {
            Dictionary<string, HttpPostedFile> list = new Dictionary<string, HttpPostedFile>();
            context.Session["Path"] = list;
        }
    }
}