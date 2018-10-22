﻿using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ShowReaderInfo : BasePage
{
    private static DateTime GetDateTime(string timeStamp)
    {
        DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
        long time = long.Parse(timeStamp + "0000000");
        TimeSpan toNow = new TimeSpan(time);
        return dtStart.Add(toNow);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! IsPostBack)
        {
            //注意这里改成了通过Session获取
            string id = (string)Session["id"];
            //string id = "123";
            if(id == null)
            {
                //exception-handler
                return;
            }
            //Database connection test
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
            string selectReaderSql = "select * from Readers where ReaderId = ?id;";
            string selectBookSql = "select IssueTime, ReturnTime,Title, Fine " +
                "from  IssueRecords, BookBarcodes, Books " +
                "where  BookBarcodes.BookBarcode =   IssueRecords.BookBarcode and  BookBarcodes.BookId = Books.BookId " +
                "and IssueRecords.ReaderId = ?reader_id;";
            try
            {
                OLMSDBConnection.Open();
                MySqlCommand cmd = new MySqlCommand(selectReaderSql, OLMSDBConnection);
                //这样查询允许的基础是 name和phone字段不能为空
                cmd.Parameters.AddWithValue("?id", id);
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        TextBoxEmail.Text = (string)reader["Email"];
                        TextBoxName.Text = (string)reader["Name"];
                        TextBoxTelephone.Text = (string)reader["Phone"];
                        string idNumber = (string)reader["IdNumber"];
                        idNumber = "XXXXXXXXXXXXXX" + idNumber.Substring(idNumber.Length - 4);
                        TextBoxIDNumber.Text = idNumber;
                        break;
                    }
                }
                reader.Close();
                MySqlCommand cmd2 = new MySqlCommand(selectBookSql, OLMSDBConnection);
                cmd2.Parameters.AddWithValue("?reader_id", id);
                ArrayList issueRecords = new ArrayList();
                MySqlDataReader reader2 = cmd2.ExecuteReader();
                while (reader2.Read())
                {
                    if (reader2.HasRows)
                    {
                        Record r = new Record();
                        r.title = (string)reader2["Title"];
                        DateTime issueTime = (DateTime)reader2["IssueTime"];
                        DateTime returnTime;
                        TimeSpan d;
               
                        if (reader2["ReturnTime"] is System.DBNull)
                        {
                            r.returnTime = "";
                            //获取当前时间
                            DateTime Now = DateTime.Now;
                            d = Now.Subtract(issueTime);
                        }
                        else
                        {
                            try
                            {
                                returnTime = (DateTime)reader2["ReturnTime"];
                                r.returnTime = returnTime.ToString();
                            }
                            catch(Exception ex)
                            {
                                returnTime = DateTime.Now;
                                r.returnTime = "";
                            }
                            d = returnTime.Subtract(issueTime);
                        }
                        int delta = d.Days - 30;
                        if (delta < 0)
                        {
                            r.overdueTime = "0";
                        }
                        else
                        {
                            r.overdueTime = delta.ToString();
                        }      
                        r.issueTime = issueTime.ToString();
                        if (reader2["Fine"] is System.DBNull)
                        {
                            r.fine = "";
                        }
                        else
                        {
                            r.fine = reader2["Fine"].ToString();
                        }
                        issueRecords.Add(r);
                    }
                }
                GridView1.DataSource = issueRecords;
                GridView1.DataBind();
            }
            catch(MySqlException ex)
            {
                //exception-handler
                Console.WriteLine(ex.Message);
            }
            finally
            {
                OLMSDBConnection.Close();
            }
        }
    }
    protected void Cancel(object sender, EventArgs e)
    {
        //返回上一个页面  Response.Redirect()
        return;
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void Repeater1_ItemCommand2(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
public class Record
{
    public string title { get; set; }
    public string issueTime { get; set; }
    public string returnTime { get; set; }
    public string overdueTime { get; set; }
    public string fine {get; set;}
}