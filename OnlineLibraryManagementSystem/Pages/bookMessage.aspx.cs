using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

public partial class Pages_bookMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string bookId = Request["book_id"];
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            string book_id_sql = "select * from Books where BookId=" + bookId;
            OLMSDBConnection.Open();
            MySqlCommand cmd1 = new MySqlCommand(book_id_sql, OLMSDBConnection);
            ArrayList books_list = new ArrayList();
            MySqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    title.Text =   reader["Title"].ToString();
                    author.Text =  reader["Author"].ToString();
                    pubDate.Text = reader["PubDate"].ToString();
                    price.Text =   reader["Price"].ToString();
                    break;
                }
            }

            reader.Close();



        }
        catch (MySqlException ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            OLMSDBConnection.Close();
        }
    }
}
