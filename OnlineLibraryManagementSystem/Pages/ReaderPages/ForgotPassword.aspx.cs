﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ReaderPages_ForgotPassword : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && string.IsNullOrEmpty((string)Session["id"]))
        {
            //未登录时提示登录
            Response.Write("<script type='text/javascript'>alert('" + Resources.Resource.LogInNotice + "');location.href='../ReaderLogin.aspx';</script>");
        }
    }

    protected void Verify_Click(object sender, EventArgs e)
    {
        string idNumberText = TextBoxId.Text;
        string idNumber = null;
        string email = null;
        string password = null;
        if (idNumberText.Length != 18)
        {
            Response.Write("<script>alert('" + Resources.Resource.InvalidId + "')</script>");
            return;
        }
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "select IdNumber,Email,Password from Readers WHERE(ReaderId = @u);";
        MySqlParameter param;
        param = new MySqlParameter("@u", Session["id"]);
        cmd.Parameters.Add(param);
        MySqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            if (reader.HasRows)
            {
                idNumber = reader["IdNumber"].ToString();
                email = reader["Email"].ToString();
                password = reader["Password"].ToString();
                break;
            }
        }
        reader.Close();
        conn.Close();

        if (idNumber.Equals(idNumberText))
        {
            SendEmail.Send(email, "OnlineLibraryManagement找回密码",
                            "尊敬的用户，您的密码为：" + password);
            Response.Write("<script>alert('" + Resources.Resource.VerificationSuccess + Resources.Resource.PasswordSent + "')</script>");
        }
        else
        {
            Response.Write("<script>alert('" + Resources.Resource.VerificationFail + "')</script>");
        }
    }
}