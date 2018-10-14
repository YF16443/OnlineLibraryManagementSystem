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

public partial class Pages_AddShelves : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddShelves(object sender, EventArgs e)
    {
        string shelfid = "";
        string stackid = "";
        string shelf_summary = "";
        string nowdate = "";
        if (TextBoxShelfId.Text == "")
        {
            Response.Write("<script>alert('书架ID不为空')</script>");
        }
        else
        {
            shelfid = TextBoxShelfId.Text;
        }
        if (TextBoxStackId.Text == "")
        {
            Response.Write("<script>alert('书库ID不为空')</script>");
        }
        else
        {
            stackid = TextBoxStackId.Text;
        }
        shelf_summary = TextBoxShelf_Summary.Text;
        nowdate= DateTime.Now.ToString("yyyy-MM-dd");
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //检查同ID书架是否存在
        string selectShelve = "select count(*) as num1 from Shelves where ShelfId='" + shelfid + "';";
        //检查同ID书库是否存在
        string selectStack = "select count(*) as num2 from Stacks where StackId='" + stackid + "';";
        //创建书架
        string insertShelve = "insert into Shelves(ShelfId,StackId,Summary,Timestamp) " + "values('" + shelfid + "','" + stackid + "','" + shelf_summary + "','" + nowdate + "');";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselectshelve = new MySqlCommand(selectShelve, OLMSDBConnection);
            MySqlDataReader reader1 = cmdselectshelve.ExecuteReader();
            while (reader1.Read())
            {
                if (reader1.HasRows)
                {
                    Int64 count = (Int64)reader1["num1"];
                    if (count > 0)
                    {
                        Response.Write("<script>alert('该书架已存在');</script>");
                        return;
                    }
                    break;
                }
            }
            reader1.Close();
            MySqlCommand cmdselectstack = new MySqlCommand(selectStack, OLMSDBConnection);
            MySqlDataReader reader2 = cmdselectstack.ExecuteReader();
            while (reader2.Read())
            {
                if (reader2.HasRows)
                {
                    Int64 count = (Int64)reader2["num2"];
                    if (count==0)
                    {
                        Response.Write("<script>window.alert('不存在该书库');</script>");
                        return;
                    }
                    break;
                }
            }
            reader2.Close();
            MySqlCommand cmdinsert = new MySqlCommand(insertShelve, OLMSDBConnection);
            int result = 0;
            result = cmdinsert.ExecuteNonQuery();
            if (result != 0)
            {
                Response.Write("<script>alert('创建书架成功')</script>");
            }
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

    protected void Cancel(object sender, EventArgs e)
    {
        //跳转到上一页面
        return;
    }
}