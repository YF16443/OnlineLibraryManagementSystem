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

public partial class Pages_LibrarianPages_EditShelf : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //DropDownList1.Items.Clear();
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
            try
            {
                OLMSDBConnection.Open();
                string selectstackid = "select StackId from Stacks";
                MySqlCommand cmdselectstackid = new MySqlCommand(selectstackid, OLMSDBConnection);
                MySqlDataReader readerstack = cmdselectstackid.ExecuteReader();
                DropDownList1.DataSource = readerstack;
                DropDownList1.DataTextField = "StackId";
                DropDownList1.DataBind();
                readerstack.Close();
                string selectshelf = "select * from Shelves where ShelfId='" + Session["ID"] + "';";
                MySqlCommand cmdselectshelf = new MySqlCommand(selectshelf, OLMSDBConnection);
                MySqlDataReader readershlef = cmdselectshelf.ExecuteReader();
                if (readershlef.Read())
                {
                    LabelShelfid.Text = readershlef["ShelfId"].ToString();//书架ID不可修改
                    TextBoxSummary.Text = readershlef["Summary"].ToString();
                    LabelShelf_Timestamp.Text = readershlef["Timestamp"].ToString();//建架时间不可以改变
                }
                readershlef.Close();
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

    protected void Alter_ShelfInfo(object sender, EventArgs e)
    {
        //检查登陆
        if (string.IsNullOrEmpty((string)Session["lid"]))
        {
            Response.Write("<script type='text/javascript'>alert('" + Resources.Resource.LogInNotice + "');location.href='/Pages/LibrarianLogin.aspx';</script>");
        }
        string newsummary = "";
        string newstackid = DropDownList1.SelectedItem.Text;
        //string pattern = "^\\d{1,10}$";
        if (TextBoxSummary.Text == "" ||TextBoxSummary.Text.Trim().Length==0)
        {
            Response.Write("<script>alert('Shelf_Summary Is Null!')</script>");
            return;
        }
        else
        {
            newsummary = TextBoxSummary.Text.Trim();
        }
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //string selectshelfid = "select count(*) as num from Shelves where ShelfId='" + newshelfid + "';";
        string updateshelf = "update Shelves set StackId='" + newstackid + "',Summary='" + newsummary + "' where ShelfId='" + Session["ID"] + "';";
        try
        {
            OLMSDBConnection.Open();
           /* if (newshelfid != Session["ID"].ToString())
            {
                MySqlCommand cmdselectshelfid = new MySqlCommand(selectshelfid, OLMSDBConnection);
                MySqlDataReader readerselect = cmdselectshelfid.ExecuteReader();
                while (readerselect.Read())
                {
                    if (readerselect.HasRows)
                    {
                        Int64 count = (Int64)readerselect["num"];
                        if (count > 0)
                        {
                            Response.Write("<script>window.alert('ShelfId Is Exist!');</script>");
                            return;
                        }
                        break;
                    }
                }
                readerselect.Close();
            }*/
            MySqlCommand cmdupdateshelf = new MySqlCommand(updateshelf, OLMSDBConnection);
            int resultupdate = 0;
            resultupdate = cmdupdateshelf.ExecuteNonQuery();
            if (resultupdate != 0)
            {
                Response.Write("<script>alert('Edited Successfully!');window.location.href = 'ShelfInfo.aspx';</script>");
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
        Response.Redirect("ShelfInfo.aspx");
    }
}