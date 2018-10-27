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

public partial class Pages_StackInfo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string stackid = "";
        if (Request["StackId"] != null)
        {
            stackid = Request["StackId"];
            Session["ID"] = Request["StackId"];
        }
        else
        {
            stackid = Session["ID"].ToString();
        }
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string select = "select * from Stacks where StackId='" + stackid + "';";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselectstack = new MySqlCommand(select, OLMSDBConnection);
            MySqlDataReader reader = cmdselectstack.ExecuteReader();
            if (reader.Read())
            {
                LabelStackId.Text = reader["StackId"].ToString();
                LabelPosition.Text = reader["Position"].ToString();
                LabelSummary.Text = reader["Summary"].ToString();
                LabelStack_Timestamp.Text = reader["Timestamp"].ToString();
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

    protected void Cancel(object sender, EventArgs e)
    {
        Response.Redirect("Search_Stacks_Shelves.aspx");
    }

    protected void Edit_StackInfo(object sender, EventArgs e)
    {
        Response.Redirect("EditStack.aspx");
    }
}