using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_IssueBooks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        string readerID = TextBox1.Text;
        string bookID = TextBox2.Text;
        string BarcodeID = null;
        try
        {
            string getBarcodeSql = "SELECT BookBarcode FROM BookBarcodes WHERE BookID = " + bookID;
            OLMSDBConnection.Open();
            MySqlCommand cmd = new MySqlCommand(getBarcodeSql, OLMSDBConnection);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                    BarcodeID = reader["BookBarcode"].ToString();
            }  
            reader.Close();

            DateTime time_now = DateTime.Now;
            string now_time = time_now.ToString("yyyy-MM-dd HH:mm:ss");
            //默认归还日期为1月后
            string return_time = time_now.AddMonths(1).ToString("yyyy-MM-dd HH:mm:ss");
            string insertIssueSql = "INSERT INTO `IssueRecords` (`ReaderId`, `BookBarcode`, `IssueTime`, `ReturnTime`) VALUES('"
                + readerID + "', '" + BarcodeID + "', '" + now_time + "', '" + return_time + "');";
            MySqlCommand cmd2 = new MySqlCommand(insertIssueSql, OLMSDBConnection);
            cmd2.ExecuteReader();
            Response.Write("<script>alert('OK')</script>");
        }
        catch (MySqlException ex)
        {
            //exception-handler
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            OLMSDBConnection.Close();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}