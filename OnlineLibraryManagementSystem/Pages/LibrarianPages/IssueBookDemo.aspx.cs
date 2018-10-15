﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Pages_IssueBookDemo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btIssue_Click(object sender, EventArgs e)
    {
        string readerID = tbReaderId.Text.ToString();
        string BarcodeID = tbBarcode.Text.ToString();
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            OLMSDBConnection.Open();
            //判断用户是否存在
            string queryReaderSql = "SELECT ReaderId FROM Readers WHERE ReaderId = " + readerID;
            MySqlCommand cmd0 = new MySqlCommand(queryReaderSql, OLMSDBConnection);
            MySqlDataReader reader0 = cmd0.ExecuteReader();
            if (!reader0.HasRows)
                throw new Exception("Wrong Input!");
            reader0.Close();
            //判断书籍是否存在
            string queryBarcodeSql = "SELECT BookBarcode FROM BookBarcodes WHERE BookBarcode = " + BarcodeID;
            MySqlCommand cmd1 = new MySqlCommand(queryBarcodeSql, OLMSDBConnection);
            MySqlDataReader reader1 = cmd1.ExecuteReader();
            if (!reader1.HasRows)
                throw new Exception("Wrong Input!");
            reader1.Close();
            //判断书籍是否借出
            string getRecordIdSql = "SELECT RecordId FROM IssueRecords WHERE BookBarcode = " + BarcodeID +
                " and ReaderId = " + readerID + " and ReturnTime is null ORDER BY IssueTime ASC";
            MySqlCommand cmd = new MySqlCommand(getRecordIdSql, OLMSDBConnection);
            MySqlDataReader reader = cmd.ExecuteReader();
            //如果查询结果不为空，说明该书未归还，不应被借出
            if (reader.HasRows)
                throw new Exception("Wrong Input!");
            reader.Close();
            //执行借书操作
            DateTime time_now = DateTime.Now;
            string now_time = time_now.ToString("yyyy-MM-dd HH:mm:ss");
            string insertIssueSql = "INSERT INTO `IssueRecords` (`ReaderId`, `BookBarcode`, `IssueTime`) VALUES('"
                + readerID + "', '" + BarcodeID + "', '" + now_time + "');";
            MySqlCommand cmd2 = new MySqlCommand(insertIssueSql, OLMSDBConnection);
            cmd2.ExecuteReader();
            Response.Write("<script>alert('OK')</script>");
        }
        catch (Exception ex)
        {
            //exception-handler
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            OLMSDBConnection.Close();
        }
    }
}