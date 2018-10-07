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

public partial class Pages_search : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Search(object sender, EventArgs e)
    {
        string search;
        search = TextSearch.Text;

        //链接数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        System.Diagnostics.Debug.WriteLine("database is ok");
        String booknamesql="";
        if (DropDownList1.SelectedValue=="0")
        {
            booknamesql = "select * from Books where Title like " + "\"%" + search + "%\""
                                           + " or " + "Author like " + "\"%" + search + "%\""
                                           + " or " + "ISBN13 like " + "\"%" + search + "%\""
                                           + " or " + "ISBN10 like " + "\"%" + search + "%\"";
        }
        if (DropDownList1.SelectedValue == "1")
        {
            booknamesql = "select * from Books where Title like " + "\"%" + search + "%\"";
        }
        if (DropDownList1.SelectedValue == "2")
        {
            booknamesql = "select * from Books where Author like " + "\"%" + search + "%\"";
        }
        if (DropDownList1.SelectedValue == "3")
        {
            booknamesql = "select * from Books where ISSBN13 like " + "\"%" + search + "%\""
                                          + " or " + "ISBN10 like " + "\"%" + search + "%\"";
        }


        try
        {
            OLMSDBConnection.Open();

            MySqlCommand cmd1 = new MySqlCommand(booknamesql, OLMSDBConnection);
            ArrayList books_list = new ArrayList();
            MySqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Books book = new Books();
                    book.Title = (string)reader["Title"];
                    book.Author = (string)reader["Author"];
                    books_list.Add(book);
                    book.href = "/Pages/bookMessage.aspx?book_id=" + reader["BookId"].ToString();
                }
            }
            Repeater1.DataSource = books_list;
            Repeater1.DataBind();
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

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
public class Books
{
    public string Title { get; set; }
    public string href { get; set; }
    public string Author { get; set; }
}

