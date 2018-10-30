using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ReaderPages_ViewNotice : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        MySqlCommand getDeposit_sql = new MySqlCommand("select * from Notices");
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


        MySqlCommand getFine_sql = new MySqlCommand("select ReaderId,ReturnTime,Fine from IssueRecords where Fine is not null and Status != 3");
        var result2Adapter = new MySqlDataAdapter();
        result2Adapter.SelectCommand = getFine_sql;
        result2Adapter.SelectCommand.Connection = OLMSDBConnection;
        var result2Set = new DataSet();

        OLMSDBConnection.Open();
        result2Adapter.Fill(result2Set);
        OLMSDBConnection.Close();
        DataTable search2Result = result2Set.Tables[0];

        ViewState["normal"] = dtResult;
        GridView1.DataSource = dtResult;
        GridView1.DataBind();
        // GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
    protected void search_Click(object sender, EventArgs e)
    {
        String Da = Request["date"].ToString();
        String[] range = Regex.Split(Da, " – ", RegexOptions.IgnoreCase);
        String start = range[0];
        String end = range[1];
        DateTimeFormatInfo dtFormat = new DateTimeFormatInfo();
        dtFormat.ShortDatePattern = "MM/dd/yyyy";
        DateTime startDate = Convert.ToDateTime(start, dtFormat);
        DateTime endDate = Convert.ToDateTime(end, dtFormat);
        System.Diagnostics.Debug.WriteLine(startDate);
        System.Diagnostics.Debug.WriteLine(endDate);
        DataTable dtResult = ViewState["normal"] as DataTable;
        DataTable rangeResult = dtResult.Clone();

        foreach (DataRow dr in dtResult.Rows)
        {
            DateTime selectTime = (DateTime)dr["Timestamp"];
            System.Diagnostics.Debug.WriteLine(selectTime);

            if (DateTime.Compare(startDate, selectTime) < 0 && DateTime.Compare(endDate, selectTime) > 0)
            {

                rangeResult.ImportRow(dr);
                System.Diagnostics.Debug.WriteLine("push");
            }
        }
        if (rangeResult.Rows.Count == 0)
        {
            DataRow blankRow = rangeResult.NewRow();
            rangeResult.Rows.Add(blankRow);
        }
        GridView1.DataSource = rangeResult;
        GridView1.DataBind();
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

    }




    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void TextSearch_TextChanged(object sender, EventArgs e)
    {

    }



    

    protected void Unnamed2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void reset_Click(object sender, EventArgs e)
    {
        DataTable dtResult = ViewState["normal"] as DataTable;
        GridView1.DataSource = dtResult;
        GridView1.DataBind();
        //GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
}