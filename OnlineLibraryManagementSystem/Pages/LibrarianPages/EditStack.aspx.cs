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

    protected void Alter_StackInfo(object sender, EventArgs e)
    {
        string newstackid = "";
        string newsummary = "";
        string newposition = "";
        String pattern = "^[A-Z]-\\d{3}$";
        if (TextBoxStackId.Text == ""||TextBoxStackId.Text.Trim().Length==0)
        {
            Response.Write("<script>alert('StackId Is Null!')</script>");
            return;
        }
        if (TextBoxStackId.Text.Trim().Length==5&&System.Text.RegularExpressions.Regex.IsMatch(TextBoxStackId.Text.Trim(), pattern))
        {
            newstackid = TextBoxStackId.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error StackId!\\nStackId Example:A-101')</script>");
            return;
        }
        if (TextBoxPosition.Text == ""||TextBoxPosition.Text.Trim().Length==0)
        {
            Response.Write("<script>alert('Stack Position Is Null')</script>");
            return;
        }
        else
        {
            newposition = TextBoxPosition.Text.Replace(" ","");
        }
        if (TextBoxSummary.Text == "" || TextBoxSummary.Text.Trim().Length == 0)
        {
            Response.Write("<script>alert('Stack_Summary Is Null')</script>");
            return;
        }
        else
        {
            newsummary = TextBoxSummary.Text.Trim();
        }
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string updatestack = "update Stacks set StackId='" + newstackid + "',Position='" + newposition + "',Summary='" + newsummary + "' where StackId='" + Session["ID"] + "';";
        string selectnewstackid = "select count(*) as num from Stacks where StackId='" + newstackid + "';";
        try
        {
            OLMSDBConnection.Open();
            if (newstackid != Session["ID"].ToString())
            {
                MySqlCommand cmdselectstackid = new MySqlCommand(selectnewstackid, OLMSDBConnection);
                MySqlDataReader readerselect = cmdselectstackid.ExecuteReader();
                while (readerselect.Read())
                {
                    if (readerselect.HasRows)
                    {
                        Int64 count = (Int64)readerselect["num"];
                        if (count > 0)
                        {
                            Response.Write("<script>window.alert('StackId Is Exist!');</script>");
                            return;
                        }
                        break;
                    }
                }
                readerselect.Close();
            }
            MySqlCommand cmdupdatestack = new MySqlCommand(updatestack, OLMSDBConnection);
            int result = 0;
            result = cmdupdatestack.ExecuteNonQuery();
            if (result != 0)
            {
                Session["ID"] = newstackid;
                Response.Write("<script>alert('Edited Successfully!');window.location.href = 'StackInfo.aspx';</script>");
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