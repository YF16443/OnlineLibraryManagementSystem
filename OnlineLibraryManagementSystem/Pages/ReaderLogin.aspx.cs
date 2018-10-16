﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Login : BasePage
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

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        var loginView = Master.FindControl("LoginView") as LoginView;
        if (loginView != null)
        {
            loginView.Visible = false;
        }
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "select * from Readers where ReaderId = @u and Password = @p";
        MySqlParameter param;
        param = new MySqlParameter("@u", Login1.UserName);
        cmd.Parameters.Add(param);
        param = new MySqlParameter("@p", Login1.Password);
        cmd.Parameters.Add(param);
        object res = cmd.ExecuteScalar();
        conn.Close();
        if (res != null)
        {
            //使用Session方式保存账户信息
            Session["id"] = Login1.UserName;
            e.Authenticated = true;
        }
        else
            e.Authenticated = false;
    }
}