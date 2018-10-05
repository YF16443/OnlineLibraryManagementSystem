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
        string bookname, booknum, bookaur, bookdate, exp;
        booknum = TextBookNum.Text;
        bookaur = TextBookAur.Text;
        bookdate = TextBookDate.Text;
        string[] a = { "BookId","Author","PubDate"};
        string[] b = { booknum, bookaur, bookdate };
        

        if (TextBookName.Text == "")
        {
            Response.Write("<script>window.alert('图书名不能为空!');</script>");
            System.Diagnostics.Debug.WriteLine("a");
            return;
        }
        else
        {
            bookname = TextBookName.Text;
            exp = "select Title from Books where Title = " +"\""+ bookname + "\"";            
            System.Diagnostics.Debug.WriteLine(bookname);
        }

        for(int i = 0; i == 3; i++)
        {
            if (a[i] != null)
            {
                exp = exp + " and " + a[i] + " = \"" + b[i] + "\"";
            }
            else continue;
        }
        //if (TextBookNum.Text == "")
        //{
        //    System.Diagnostics.Debug.WriteLine("booknum is ok");
        //    return;
        //}
        //else
        //{
        //    booknum = TextBookNum.Text;
        //    //exp = exp + "and BookId = " + booknum;
        //    exp = exp + " and BookId = ?booknum" ;
        //}
        ////这里没有运行！！！！！！

        //System.Diagnostics.Debug.WriteLine("这里运行了");

        //if (TextBookAur.Text == "")
        //{
        //    System.Diagnostics.Debug.WriteLine("bookaur is ok");
        //    return;
        //}
        //else
        //{
        //    bookaur = TextBookAur.Text;
        //    //exp = exp + " and Author = " + bookaur;
        //    exp = exp + " and Author = ?bookaur";
        //}

        //if (TextBookDate.Text == "")
        //{
        //    System.Diagnostics.Debug.WriteLine("bookdate is ok");
        //    return;
            
        //}
        //else
        //{
        //    bookdate = TextBookDate.Text;
        //    //exp = exp + " and PubDate = " + bookdate;
        //    exp = exp + " and PubDate = ?bookdate";
        //}
        //System.Diagnostics.Debug.WriteLine("if else");
        //链接数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        System.Diagnostics.Debug.WriteLine("database is ok");
        string booknamesql = exp + ";";


        System.Diagnostics.Debug.WriteLine(booknamesql);

        try
        {
            OLMSDBConnection.Open();

            //MySqlCommand cmd1 = new MySqlCommand(booknamesql, OLMSDBConnection);
            //cmd1.Parameters.AddWithValue("?bookname", bookname);
            //cmd1.Parameters.AddWithValue("?booknum", booknum);
            //cmd1.Parameters.AddWithValue("?bookaur", bookaur);
            //cmd1.Parameters.AddWithValue("?bookdate", bookdate);
            MySqlCommand cmd1 = new MySqlCommand(booknamesql, OLMSDBConnection);
            ArrayList books_list = new ArrayList();
            MySqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Books book = new Books();
                    book.Title = (string)reader["Title"];
                    books_list.Add(book);
                }
            }
            Repeater1.DataSource = books_list;
            Repeater1.DataBind();
            reader.Close();
            //int result = cmd1.ExecuteNonQuery();
            //if (result == 1)
            //{
            //    Response.Write("<script>window.alert('执行成功');</script>");
            //    //Response.Redirect()
            //    return;
            //}
            //else
            //{
            //    Response.Write("<script>window.alert('执行失败');</script>");
            //    //Response.Redirect()
            //    return;
            //}


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
}
public class Books
{
    public string Title { get; set; }
}

