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

public partial class Pages_AddStacks : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddStacks(object sender, EventArgs e)
    {
        String stack_summary = "";
        String stackid = "";
        String nowdate = "";
        if (TextBoxStackId.Text == "")
        {
            Response.Write("<script>alert('书库ID不为空')</script>");
        }
        else
        {
            stackid = TextBoxStackId.Text;
        }
        stack_summary = TextBoxSummary.Text;
        nowdate = DateTime.Now.ToString("yyyy-MM-dd");
        //数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //检查同ID书库是否存在
        string selectStack = "select count(*) as num from Stacks where StackId='" + stackid + "';";
        //创建书库
        string insertStack = "insert into Stacks(StackId,Summary,Timestamp) " + "values('" + stackid + "','" + stack_summary + "','" + nowdate + "');";
        //打开数据库
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselect = new MySqlCommand(selectStack, OLMSDBConnection);
            MySqlDataReader reader = cmdselect.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Int64 count = (Int64)reader["num"];
                    if (count > 0)
                    {
                        Response.Write("<script>window.alert('该书库已存在');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();
            MySqlCommand cmdinsert = new MySqlCommand(insertStack, OLMSDBConnection);
            int result = 0;
            result = cmdinsert.ExecuteNonQuery();
            if (result != 0)
            {
                Response.Write("<script>alert('创建书库成功')</script>");
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
        //返回上一界面;
        return;
    }
}