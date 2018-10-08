using System;
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
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        string readerId = tbReaderId.Text.ToString();
        string barcode = tbBarcode.Text.ToString();
    }
}