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

public partial class Pages_UserRegistration : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
    protected void RegisterReader(object sender, EventArgs e)
    {
        string name, account, password, idNumber, telephone, email;

        if (TextBoxName.Text == "")
        {
            Response.Write("<script>window.alert('用户名name不能为空!');</script>");
            return;
        }
        else
        {
            name = TextBoxName.Text;
        }
        if(TextBoxAccount.Text == "")
        {
            Response.Write("<script>window.alert('账户名account不能为空!');</script>");
            return;
        }
        else
        {
            account = TextBoxAccount.Text;
            //这里应该有正则匹配去除非法输入防止篡改数据库
        }
        if (TextBoxIDNumber.Text == "")
        {
            Response.Write("<script>window.alert('身份证号不能为空!');</script>");
            return;
        }
        else
        {
            //后期补上正则匹配
            idNumber = TextBoxIDNumber.Text;
            password = idNumber.Substring(idNumber.Length - 6);
        }
        if (TextBoxTelephone.Text == "")
        {
            Response.Write("<script>window.alert('电话号码不能为空!');</script>");
            return;
        }
        else
        {
            telephone = TextBoxTelephone.Text;
        }
        if (TextBoxEmail.Text == "")
        {
            Response.Write("<script>window.alert('邮箱不能为空!');</script>");
            return;
        }
        else
        {
            email = TextBoxEmail.Text;
        }
        //链接数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string insertReaderSql = "INSERT INTO Readers(Account, Password, Name, IdNumber, Phone, Email) " +
            "VALUES(?account, ?password, ?name, ?idNumber, ?telephone, ?email);";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmd = new MySqlCommand(insertReaderSql, OLMSDBConnection);
            cmd.Parameters.AddWithValue("?account", account);
            cmd.Parameters.AddWithValue("?name", name);
            cmd.Parameters.AddWithValue("?password", password);
            cmd.Parameters.AddWithValue("?idNumber", idNumber);
            cmd.Parameters.AddWithValue("?telephone", telephone);
            cmd.Parameters.AddWithValue("?email", email);
            int result = cmd.ExecuteNonQuery();
            if(result == 1)
            {
                Response.Write("<script>window.alert('插入数据成功');</script>");
                //Response.Redirect()
                return;
            }
            else
            {
                Response.Write("<script>window.alert('插入数据失败');</script>");
                //Response.Redirect()
                return;
            }

        }
        catch(MySqlException ex)
        {
            Console.WriteLine(ex.Message);
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