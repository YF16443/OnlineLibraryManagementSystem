﻿using System;
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
     
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
    }

    protected void RegisterReader(object sender, EventArgs e)
    {
        string name, readerId, password, idNumber, telephone, email;

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
            readerId = TextBoxAccount.Text;
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
            if(idNumber.Length != 18)
            {
                Response.Write("<script>window.alert('身份证号不合法!');</script>");
                return;
            }
            password = idNumber.Substring(idNumber.Length - 6);
        }
        telephone = TextBoxTelephone.Text;
        email = TextBoxEmail.Text;
        if (! IsDeposit.Checked)
        {
            Response.Write("<script>window.alert('请缴纳押金!');</script>");
            return;
        }
        //链接数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //检测同账号是否注册过
        string selectReaderSql = "select count(*) as num from Readers where ReaderId = ?readerId or IdNumber = ?idNumber;";
        string insertReaderSql = "INSERT INTO Readers(ReaderId, Phone, Password, Name, IdNumber, Email) " +
            "VALUES(?readerId, ?telephone, ?password, ?name, ?idNumber, ?email);";
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
                        Response.Write("<script>window.alert('账号已存在 或 身份证号输入错误!');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();

            MySqlCommand cmd = new MySqlCommand(insertReaderSql, OLMSDBConnection);
            cmd.Parameters.AddWithValue("?readerId", readerId);
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