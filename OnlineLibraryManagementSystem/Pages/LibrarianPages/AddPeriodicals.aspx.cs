using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Pages_LibrarianPages_AddPeriodicals : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitDDLShelf();
        }
    }

    protected void InitDDLShelf()
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        string getShelves_sql = "select " +
                                "ShelfId,StackId " +
                                "from " +
                                "Shelves;";
        MySqlCommand getShelves_cmd = new MySqlCommand(getShelves_sql, OLMSDBConnection);

        OLMSDBConnection.Open();
        MySqlDataReader reader = getShelves_cmd.ExecuteReader();
        while (reader.Read())
        {
            ddlShelf.Items.Add(new ListItem
            {
                Text = reader["ShelfId"].ToString() + "," + reader["StackId"].ToString(),
                Value = reader["ShelfId"].ToString()
            });
        }
        OLMSDBConnection.Close();
    }

    protected void btSubmit_Click(object sender, EventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        string imageURL = ""; //这里缺封面相关代码
        string title = tbTitle.Text.ToString();
        string country = tbCountry.Text.ToString();
        string type = ddlShelf.SelectedValue.ToString();
        string issn = tbISSN.Text.ToString();
        string price = tbPrice.Text.ToString();
        string shelf = ddlShelf.SelectedValue.ToString();

        string submit_sql = "insert into " +
                            "Periodicals(ISSN,ImageURL,Title,Country,Type,ShelfId) " +
                            "value(@ISSN,@ImageURL,@Title,@Country,@Type,@ShelfId);";
        var submit_cmd = new MySqlCommand(submit_sql, OLMSDBConnection);
        submit_cmd.Parameters.AddWithValue("@ISSN", issn);
        submit_cmd.Parameters.AddWithValue("@ImageURL", imageURL);
        submit_cmd.Parameters.AddWithValue("@Title", title);
        submit_cmd.Parameters.AddWithValue("@Country", country);
        submit_cmd.Parameters.AddWithValue("@Type", type);
        submit_cmd.Parameters.AddWithValue("@ShelfId", shelf);

        OLMSDBConnection.Open();
        if (submit_cmd.ExecuteNonQuery() == 1)
        {
            Response.Write("<script>alert('Add Periodical Successfully!')</script>");
        }
        else
        {
            Response.Write("<script>alert('Add Periodical Failure!')</script>");
        }
        OLMSDBConnection.Clone();
    }
}