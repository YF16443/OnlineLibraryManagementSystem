using MySql.Data.MySqlClient;
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
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "select * from Readers where Account = @u and Password = @p";
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