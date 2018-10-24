﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LibrarianPages_IncomeReport : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        MySqlCommand getDeposit_sql = new MySqlCommand("select ReaderId,Timestamp from Readers");
        var result1Adapter = new MySqlDataAdapter();
        result1Adapter.SelectCommand = getDeposit_sql;
        result1Adapter.SelectCommand.Connection = OLMSDBConnection;
        var result1Set = new DataSet();

        OLMSDBConnection.Open();
        result1Adapter.Fill(result1Set);
        OLMSDBConnection.Close();
        DataTable search1Result = result1Set.Tables[0];

        DataTable dtResult = new DataTable();
        dtResult = search1Result.Copy();
        dtResult.Columns["Timestamp"].ColumnName = "Time";
        dtResult.Columns.Add("Amount");
        dtResult.Columns.Add("Type");

        foreach (DataRow dr in dtResult.Rows)
        {
            string Deposit = ConfigurationManager.AppSettings["Deposit"].ToString();
            if (Session["PreferredCulture"].ToString() == "zh-CN")
            {
                dr["Amount"] = Deposit + "元";
                dr["Type"] = "押金";
            }
            else
            {
                dr["Amount"] = Deposit + "Yuan";
                dr["Type"] = "Deposit";
            }
        }
        Income.DataSource = dtResult;
        Income.DataBind();
        Income.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
}