using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ReturnBookDemo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Help.LibrarianMenuInit(this, sender, e);
    }

    protected void btReturn_Click(object sender, EventArgs e)
    {
        string BarcodeID = tbBarcode.Text;
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        { 
            OLMSDBConnection.Open();
            DateTime time_now = DateTime.Now;
            string now_time = time_now.ToString("yyyy-MM-dd HH:mm:ss");
            //查询没有归还日期的书籍列表，升序排序
            string getRecordIdSql = "SELECT RecordId FROM IssueRecords WHERE BookBarcode = " + BarcodeID +
                " and ReturnTime is null ORDER BY IssueTime ASC";
            MySqlCommand cmd2 = new MySqlCommand(getRecordIdSql, OLMSDBConnection);
            MySqlDataReader reader = cmd2.ExecuteReader();
            //如果没有符合条件的图书说明输入书号错误
            if (!reader.HasRows)
                throw new Exception("Wrong Input!");
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    string RecordId = reader["RecordId"].ToString();
                    //更新最早没有归还日期的书籍的归还日期
                    string returnSql = "UPDATE IssueRecords SET ReturnTime = '" + now_time + "' WHERE(`RecordId` = '" + RecordId + "')";
                    MySqlCommand cmd3 = new MySqlCommand(returnSql, OLMSDBConnection);
                    reader.Close();
                    cmd3.ExecuteReader();
                    break;
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
}