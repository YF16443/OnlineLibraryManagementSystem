using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LibrarianPages_DamageFine : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void fineReparation_Click(object sender, EventArgs e)
    {
        string BarcodeID = tbBarcode.Text;
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            OLMSDBConnection.Open();
            string getRecordIdSql = "SELECT * FROM IssueRecords WHERE BookBarcode = " + BarcodeID;
            MySqlCommand cmd2 = new MySqlCommand(getRecordIdSql, OLMSDBConnection);
            MySqlDataReader reader2 = cmd2.ExecuteReader();
            int bookId = 0;
            double originalFine = 0;
            double price = 0;
            double newFine = 0;
            double rate = 0;
            //如果没有符合条件的图书说明输入书号错误
            if (!reader2.HasRows)
                throw new Exception("Wrong Input!");
            while(reader2.Read())
            {
                if(reader2.HasRows)
                {
                    originalFine = Convert.ToDouble(reader2["Fine"].ToString());
                    break;
                }
            }
            reader2.Close();
            string getIDSql = "select * from BookBarcodes where BookBarcode = " + BarcodeID;
            MySqlCommand cmd = new MySqlCommand(getIDSql, OLMSDBConnection);
            MySqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                if (reader.HasRows)
                {
                    bookId = int.Parse(reader["BookId"].ToString());
                    break;
                }
            }
            reader.Close();
            string getPriceSql = "SELECT * FROM Books WHERE BookId = " + bookId;
            MySqlCommand cmd3 = new MySqlCommand(getPriceSql, OLMSDBConnection);
            MySqlDataReader reader3 = cmd3.ExecuteReader();
            while(reader3.Read())
            {
                if(reader3.HasRows)
                {
                    price = Convert.ToDouble(reader3["Price"].ToString());
                    break;
                }
            }
            reader3.Close();
            System.Diagnostics.Debug.WriteLine(price);

            if (TypeField.SelectedValue.ToString().Equals("Damage"))
            {
                rate = Convert.ToDouble(ConfigurationManager.AppSettings["DamageFineRate"].ToString());
                newFine = originalFine + rate * price;
            }
            else
            {
                rate = Convert.ToDouble(ConfigurationManager.AppSettings["LostFineRate"].ToString());
                newFine = originalFine + rate * price;
            }
            System.Diagnostics.Debug.WriteLine(newFine);
            string updateFineSql = "update IssueRecords set Status=2,Fine=?fine where BookBarcode=?bookbarcode";
            MySqlCommand cmd4 = new MySqlCommand(updateFineSql, OLMSDBConnection);
            cmd4.Parameters.AddWithValue("?fine", newFine);
            cmd4.Parameters.AddWithValue("?bookbarcode", BarcodeID);
            cmd4.ExecuteNonQuery();
            Response.Write("<script>alert('" + Resources.Resource.DamageAlert + newFine + Resources.Resource.Yuan + "')</script>");
        }
        catch(MySqlException ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);
        }
        finally
        {
            OLMSDBConnection.Close();
        }
    }
}