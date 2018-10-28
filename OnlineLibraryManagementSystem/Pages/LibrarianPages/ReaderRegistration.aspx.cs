using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Text;

public partial class Pages_ReaderRegistration : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string value = ConfigurationManager.AppSettings.Get("Deposit") + Resources.Resource.IsDeposit;
        IsDeposit.Text = value;
    }

    protected void RegisterReader(object sender, EventArgs e)
    {
        string name, readerId, password, idNumber, telephone, email;

        if (TextBoxName.Text == "")
        {
            Response.Write("<script>window.alert('" + Resources.Resource.UserNameError + "!');</script>");
            return;
        }
        else
        {
            name = TextBoxName.Text;
        }
        if(TextBoxAccount.Text == "")
        {
            Response.Write("<script>window.alert('" + Resources.Resource.AccountError + "!');</script>");
            return;
        }
        else
        {
            readerId = TextBoxAccount.Text;
            //这里应该有正则匹配去除非法输入防止篡改数据库
        }
        if (TextBoxIDNumber.Text == "")
        {
            Response.Write("<script>window.alert('" + Resources.Resource.IdNumberError + "!');</script>");
            return;
        }
        else
        {
            //后期补上正则匹配
            idNumber = TextBoxIDNumber.Text;
            if(idNumber.Length != 18)
            {
                Response.Write("<script>window.alert('" + Resources.Resource.IDNumberLegel + "!');</script>");
                return;
            }
            password = idNumber.Substring(idNumber.Length - 6);
        }
        telephone = TextBoxTelephone.Text;
        email = TextBoxEmail.Text;
        if (! IsDeposit.Checked)
        {
            Response.Write("<script>window.alert('" + Resources.Resource.DepositError + "!');</script>");
            return;
        }
        //链接数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //检测同账号是否注册过
        string selectReaderSql = "select count(*) as num from Readers where ReaderId = ?readerId or IdNumber = ?idNumber;";
        string insertReaderSql1 = "INSERT INTO Readers(ReaderId, Phone, Password, Name, IdNumber, Email) " +
            "VALUES(?readerId, ?telephone, ?password, ?name, ?idNumber, ?email);";
        string insertReaderSql2 = "INSERT INTO Readers(ReaderId, Phone, Password, Name, IdNumber) " +
            "VALUES(?readerId, ?telephone, ?password, ?name, ?idNumber);";
        string insertReaderSql3 = "INSERT INTO Readers(ReaderId, Password, Name, IdNumber, Email) " +
            "VALUES(?readerId, ?password, ?name, ?idNumber, ?email);";
        string insertReaderSql4 = "INSERT INTO Readers(ReaderId, Password, Name, IdNumber) " +
            "VALUES(?readerId, ?password, ?name, ?idNumber);";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmd2 = new MySqlCommand(selectReaderSql, OLMSDBConnection);
            cmd2.Parameters.AddWithValue("?readerId", readerId);
            cmd2.Parameters.AddWithValue("?idNumber", idNumber);
            MySqlDataReader reader = cmd2.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Int64 count = (Int64)reader["num"];
                    if(count > 0)
                    {
                        Response.Write("<script>window.alert('" + Resources.Resource.IdOrAccountError + "!');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();

            MySqlCommand cmd = null;
            if(telephone == "" && email == "")
            {
                cmd = new MySqlCommand(insertReaderSql4, OLMSDBConnection);
            }
            else if(telephone != "")
            {
                cmd = new MySqlCommand(insertReaderSql2, OLMSDBConnection);
                cmd.Parameters.AddWithValue("?telephone", telephone);
            }else if(email != "")
            {
                cmd = new MySqlCommand(insertReaderSql3, OLMSDBConnection);
                cmd.Parameters.AddWithValue("?email", email);
            }
            else
            {
                cmd = new MySqlCommand(insertReaderSql1, OLMSDBConnection);
                cmd.Parameters.AddWithValue("?email", email);
                cmd.Parameters.AddWithValue("?telephone", telephone);
            }
                
            cmd.Parameters.AddWithValue("?readerId", readerId);
            cmd.Parameters.AddWithValue("?name", name);
            cmd.Parameters.AddWithValue("?password", password);
            cmd.Parameters.AddWithValue("?idNumber", idNumber);
            
            
            int result = cmd.ExecuteNonQuery();
            if(result == 1)
            {
                Response.Write("<script>alert('" + Resources.Resource.Successful + "');</script>");
                //Response.Redirect()
                return;
            }
            else
            {
                Response.Write("<script>alert('" + Resources.Resource.Failure + "');</script>");
                //Response.Redirect()
                return;
            }

        }
        catch(MySqlException ex)
        {
            //Console.WriteLine(ex.Message);
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            OLMSDBConnection.Close();
        }
        
    }

    protected void Cancel(object sender, EventArgs e)
    {
        //返回上一个页面  
        //Response.Redirect("http://localhost:52800/Pages/ShowReaderInfo.aspx?id=111");
        return;
    }
}