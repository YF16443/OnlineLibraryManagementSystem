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

public partial class Pages_LibrarianPages_EditStack : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //数据库
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

            OLMSDBConnection.Open();
            //搜索建库时间，建库时间不可变
            string selecttimestamp = "select * from Stacks where StackId='"+Session["ID"]+"';";
            MySqlCommand cmdselecttimestamp = new MySqlCommand(selecttimestamp, OLMSDBConnection);
            MySqlDataReader reader = cmdselecttimestamp.ExecuteReader();
            if (reader.Read())
            {
                TextBoxStackId.Text = reader["StackId"].ToString();
                TextBoxPosition.Text = reader["Position"].ToString();
                TextBoxSummary.Text = reader["Summary"].ToString();
                LabelStack_Timestamp.Text = reader["Timestamp"].ToString();
            }
            reader.Close();
            OLMSDBConnection.Close();
        }
    }
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Help.LibrarianMenuInit(this, sender, e);
    }
    protected void Alter_StackInfo(object sender, EventArgs e)
    {
        string newstackid = "";
        string newsummary = "";
        string newposition = "";
        String pattern = "[A-Z]-\\d{3}";
        if (TextBoxStackId.Text == "")
        {
            Response.Write("<script>alert('书库ID不为空')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxStackId.Text, pattern)&&TextBoxStackId.Text.Length==5)
        {
            newstackid = TextBoxStackId.Text;
        }
        else
        {
            Response.Write("<script>alert('书库ID格式不正确')</script>");
            return;
        }
        if (TextBoxPosition.Text == "")
        {
            Response.Write("<script>alert('书库位置不为空')</script>");
            return;
        }
        else
        {
            newposition = TextBoxPosition.Text;
        }
        newsummary = TextBoxSummary.Text;
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string updatestack = "update Stacks set StackId='" + newstackid + "',Position='" + newposition + "',Summary='" + newsummary + "' where StackId='" + Session["ID"] + "';";
        string selectnewstackid = "select count(*) as num from Stacks where StackId='" + newstackid + "';";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselectstackid = new MySqlCommand(selectnewstackid, OLMSDBConnection);
            MySqlDataReader readerselect = cmdselectstackid.ExecuteReader();
            while (readerselect.Read())
            {
                if (readerselect.HasRows)
                {
                    Int64 count = (Int64)readerselect["num"];
                    if (count > 0)
                    {
                        Response.Write("<script>window.alert('该书库ID已存在,请重新修改');</script>");
                        return;
                    }
                    break;
                }
            }
            readerselect.Close();
            MySqlCommand cmdupdatestack = new MySqlCommand(updatestack, OLMSDBConnection);
            int result = 0;
            result = cmdupdatestack.ExecuteNonQuery();
            if (result != 0)
            {
                Session["ID"] = TextBoxStackId.Text;
                Response.Write("<script>alert('修改成功');window.location.href = 'StackInfo.aspx';</script>");
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
        Response.Redirect("StackInfo.aspx");
    }
}