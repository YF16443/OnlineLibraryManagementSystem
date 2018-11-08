using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AdminLogin : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty((string)Session["id"]))
        {
            Response.Redirect("~/Pages/SearchDemo.aspx");
        }
        else if (!string.IsNullOrEmpty((string)Session["lid"]))
        {
            Response.Redirect("~/Pages/LibrarianPages/IssueBookDemo.aspx");
        }
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string AdminAccount = ConfigurationManager.AppSettings["AdminAccount"].ToString();
        string AdminPassword = ConfigurationManager.AppSettings["AdminPassword"].ToString();
        if (string.Equals(Login1.UserName, AdminAccount) && string.Equals(Login1.Password, AdminPassword))
        {
            //使用Session方式保存账户信息,lid为管理员id
            Session["aid"] = Login1.UserName;
            e.Authenticated = true;
        }
        else
            e.Authenticated = false;
    }
}