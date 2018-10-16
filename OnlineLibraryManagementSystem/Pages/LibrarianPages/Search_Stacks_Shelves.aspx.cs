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

public partial class Pages_Search_Stacks_Shelves : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Help.LibrarianMenuInit(this, sender, e);
    }

    protected void Cancel(object sender, EventArgs e)
    {
        //跳转到上一页面
        return;
    }

    protected void Search(object sender, EventArgs e)
    {
        string type = "";
        string id = "";
        string type2 = "";
        type = DropDownList1.SelectedItem.Text;
        if (type == "Stacks")
        {
            type2 = "StackId";
        }
        if (type == "Shelves")
        {
            type2 = "ShelfId";
        }
        if (TextBoxID.Text == "")
        {
            Response.Write("<script>alert('查询ID不为空')</script>");
            return;
        }
        else id = TextBoxID.Text;
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string select = "select count(*) as num from " + type + " where "+type2+"='" + id + "';";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselect = new MySqlCommand(select, OLMSDBConnection);
            MySqlDataReader reader = cmdselect.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Int64 count = (Int64)reader["num"];
                    if (count == 0)
                    {
                        Response.Write("<script>window.alert('不存在该项');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();
            if(type == "Stacks")
            {
                Session["ID"] = TextBoxID.Text;
                Session["TYPE"] = DropDownList1.SelectedItem.Text;
                Response.Redirect("StackInfo.aspx");
            }
            if (type == "Shelves")
            {
                Session["ID"] = TextBoxID.Text;
                Session["TYPE"] = DropDownList1.SelectedItem.Text;
                Response.Redirect("ShelfInfo.aspx");
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