using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Text;

public partial class Pages_ShelfInfo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string shelfid = "";
        if (Request["ShelfId"] != null)
        {
            shelfid = Request["ShelfId"];
            Session["ID"] = Request["ShelfId"];
        }
        else
        {
            shelfid = Session["ID"].ToString();
        }
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string select = "select * from Shelves where ShelfId='" + shelfid + "';";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselectstack = new MySqlCommand(select, OLMSDBConnection);
            MySqlDataReader reader = cmdselectstack.ExecuteReader();
            if (reader.Read())
            {
                labelShelfId.Text = reader["ShelfId"].ToString();
                labelStackId.Text = reader["StackId"].ToString();
                labelShelf_Summary.Text= reader["Summary"].ToString();
                labelShelf_Timestamp.Text = reader["Timestamp"].ToString();
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

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Help.LibrarianMenuInit(this, sender, e);
    }

    protected void Cancel(object sender, EventArgs e)
    {
        Response.Redirect("Search_Stacks_Shelves.aspx");
    }

    protected void Edit_ShelfInfo(object sender, EventArgs e)
    {
        Response.Redirect("EditShelf.aspx");
    }
}