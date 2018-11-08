using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AdminPages_ChangePassword : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //检查登陆
        if (string.IsNullOrEmpty((string)Session["aid"]))
        {
            Response.Write("<script type='text/javascript'>alert('" + Resources.Resource.LogInNotice + "');location.href='/Pages/AdminLogin.aspx';</script>");
        }
    }
}