using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using MySql.Data;

public partial class Pages_TestPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Database connection test
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

            OLMSDBConnection.Open();
            OLMSDBConnection.Close();

            //Book information query test
            Book book = BookInfoQuery.GetByISBN("9787111128069");
            lbBookInfo.Text = book.isbn10 + " " + book.image + " " + book.author[0];
        }
    }
}