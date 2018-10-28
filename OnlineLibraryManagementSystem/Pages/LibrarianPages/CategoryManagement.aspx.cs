using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LibrarianPages_CategoryManagement : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        MySqlCommand get_sql = new MySqlCommand("select CategoryId,Name from BookCategories");
        var resultAdapter = new MySqlDataAdapter();
        resultAdapter.SelectCommand = get_sql;
        resultAdapter.SelectCommand.Connection = OLMSDBConnection;
        var resultSet = new DataSet();

        OLMSDBConnection.Open();
        resultAdapter.Fill(resultSet);
        OLMSDBConnection.Close();

        DataTable searchResult = resultSet.Tables[0];

        Category.DataSource = searchResult;
        Category.DataBind();
        Category.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void Category_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Category.EditIndex = e.NewEditIndex;

    }

    protected void Category_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void Category_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}