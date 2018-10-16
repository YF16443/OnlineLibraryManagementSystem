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
        DropDownList1.Items.Clear();
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        OLMSDBConnection.Open();
        string select = "select StackId from Stacks";
        MySqlCommand cmdselectBookid = new MySqlCommand(select, OLMSDBConnection);
        MySqlDataReader reader = cmdselectBookid.ExecuteReader();
        while (reader.Read())
        {
            DropDownList1.Items.Add(reader["StackId"].ToString());
        }
        OLMSDBConnection.Close();
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Help.LibrarianMenuInit(this, sender, e);
    }

    protected void AddShelves(object sender, EventArgs e)
    {
        string stackid = "";
        string shelf_summary = "";
        string nowdate = "";
        string shelfid = "";
        stackid = DropDownList1.SelectedItem.Text;
        shelf_summary = TextBoxShelf_Summary.Text;
        nowdate= DateTime.Now.ToString("yyyy-MM-dd");
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //检查同ID书库是否存在
        string selectStack = "select count(*) as num2 from Stacks where StackId='" + stackid + "';";
        //创建书架
        string insertShelve = "insert into Shelves(StackId,Summary,Timestamp) " + "values('"  + stackid + "','" + shelf_summary + "','" + nowdate + "');";
        string selectShelveid = "select max(ShelfId) from Shelves";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselectstack = new MySqlCommand(selectStack, OLMSDBConnection);
            MySqlDataReader reader1 = cmdselectstack.ExecuteReader();
            while (reader1.Read())
            {
                if (reader1.HasRows)
                {
                    Int64 count = (Int64)reader1["num2"];
                    if (count==0)
                    {
                        Response.Write("<script>window.alert('不存在该书库');</script>");
                        return;
                    }
                    break;
                }
            }
            reader1.Close();
            MySqlCommand cmdinsert = new MySqlCommand(insertShelve, OLMSDBConnection);
            int result = 0;
            result = cmdinsert.ExecuteNonQuery();
            MySqlCommand cmdselect = new MySqlCommand(selectShelveid, OLMSDBConnection);
            MySqlDataReader reader2 = cmdselect.ExecuteReader();
            if (reader2.Read())
            {
                shelfid = reader2["max(ShelfId)"].ToString();
            }
            if (result != 0)
            {
                Response.Write("<script>alert('创建书架成功,书架id为:"+shelfid+"')</script>");
                return;
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
}