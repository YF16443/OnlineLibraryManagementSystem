using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_IssueReturnBooks : System.Web.UI.Page
{
    static string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
    MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected string getBarcode(string bookID)
    {
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
        return BarcodeID;
    }
    protected bool isTrueReader(string readerID)
    {
        try
        {
            string queryReaderSql = "SELECT ReaderId FROM Readers WHERE ReaderId = " + readerID;
            OLMSDBConnection.Open();
            MySqlCommand cmd = new MySqlCommand(queryReaderSql, OLMSDBConnection);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    reader.Close();
                    return true;
                }
            }
            reader.Close();
            return false;
        }
        catch (MySqlException ex)
        {
            //exception-handler
            Response.Write("<script>alert('" + ex.Message + "')</script>");
            return false;
        }
        finally
        {
            OLMSDBConnection.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string readerID = TextBox1.Text;
        string bookID = TextBox2.Text;
        string BarcodeID = getBarcode(bookID);
        //检查书号和用户号是否存在
        
        try
        {
            if (BarcodeID == null || !isTrueReader(readerID))
            {
                throw (new Exception("Wron Input!"));
            }
            OLMSDBConnection.Open();
            string getRecordIdSql = "SELECT RecordId FROM IssueRecords WHERE BookBarcode = " + BarcodeID +
                " and ReaderId = " + readerID + " and ReturnTime is null ORDER BY IssueTime ASC";
            MySqlCommand cmd = new MySqlCommand(getRecordIdSql, OLMSDBConnection);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                //如果查询结果不为空，说明该书未归还，不应被借出
                if (reader.HasRows)
                {
                    throw (new Exception("Wron Input!"));
                }
            }
            reader.Close();

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
    protected void Button2_Click(object sender, EventArgs e)
    {
        string readerID = TextBox1.Text;
        string bookID = TextBox2.Text;
        string BarcodeID = getBarcode(bookID);
        //Response.Write("<script>alert('BarcodeID: " + BarcodeID + "')</script>");
        //检查书号和用户号是否存在
        
        try
        {
            if (BarcodeID == null || !isTrueReader(readerID))
            {
                throw (new Exception("Wron Input!"));
            }
            OLMSDBConnection.Open();
            DateTime time_now = DateTime.Now;
            string now_time = time_now.ToString("yyyy-MM-dd HH:mm:ss");
            //查询没有归还日期的书籍列表，升序排序
            string getRecordIdSql = "SELECT RecordId FROM IssueRecords WHERE BookBarcode = " + BarcodeID +
                " and ReaderId = " + readerID + " and ReturnTime is null ORDER BY IssueTime ASC";
            MySqlCommand cmd2 = new MySqlCommand(getRecordIdSql, OLMSDBConnection);
            MySqlDataReader reader = cmd2.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    string RecordId = reader["RecordId"].ToString();
                    //Response.Write("<script>alert('RecordId: " + RecordId + "')</script>");
                    //更新最早没有归还日期的书籍的归还日期
                    string returnSql = "UPDATE IssueRecords SET ReturnTime = '" + now_time + "' WHERE(`RecordId` = '" + RecordId + "')";
                    MySqlCommand cmd3 = new MySqlCommand(returnSql, OLMSDBConnection);
                    reader.Close();
                    cmd3.ExecuteReader();
                    break;
                }
                else
                {
                    //如果没有符合条件的图书说明输入书号错误
                    Response.Write("<script>alert('Wrong Input!')</script>");
                }
            }
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

    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}