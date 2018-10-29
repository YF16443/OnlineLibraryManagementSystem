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
        if(!IsPostBack)
        {
            GridviewBind();
        }
    }
    public void GridviewBind()
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
        Category.DataKeyNames = new string[] { "CategoryId" };
        Category.DataBind();
        Category.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void Category_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Category.EditIndex = e.NewEditIndex;
        GridviewBind();
    }

    protected void Category_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void Category_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int categoryId = int.Parse(Category.DataKeys[e.RowIndex].Values[0].ToString());
        string name = ((TextBox)Category.Rows[e.RowIndex].FindControl("txtName")).Text;
       
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "update BookCategories set Name=@n where CategoryId=@i";
        MySqlParameter param;
        param = new MySqlParameter("@n", name);
        cmd.Parameters.Add(param);
        param = new MySqlParameter("@i", categoryId);
        cmd.Parameters.Add(param);
        int result = cmd.ExecuteNonQuery();
        if (result == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.EditSuccess + "');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.EditFail + "');", true);
        }
        Category.EditIndex = -1;
        GridviewBind();
    }

    protected void Category_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Category.EditIndex = -1;
        GridviewBind();
    }

    protected void Category_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Category.PageIndex = e.NewPageIndex;
        GridviewBind();
    }

    protected void Add_Click(object sender, EventArgs e)
    {
        if (!rfvId.IsValid || !rfvName.IsValid)
        {
            GridviewBind();
            return;
        }
        int id = int.Parse(newId.Text);
        string name = newName.Text;
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "select * from BookCategories where CategoryId=@i";
        MySqlParameter param;
        param = new MySqlParameter("@i", id);
        cmd.Parameters.Add(param);
        object res = cmd.ExecuteScalar();
        if (res != null)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.CategoryIdExist + "');", true);
            GridviewBind();
            return;
        }
        cmd.CommandText = "insert into BookCategories(CategoryId,Name) values(@id,@n);";
        param = new MySqlParameter("@id", id);
        cmd.Parameters.Add(param);
        param = new MySqlParameter("@n", name);
        cmd.Parameters.Add(param);
        int result = cmd.ExecuteNonQuery();
        if (result == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.Successful + "');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.Failure + "');", true);
        }
        Category.EditIndex = -1;
        GridviewBind();
    }
}