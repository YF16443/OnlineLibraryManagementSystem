using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public partial class Pages_SearchDemo : BasePage
{
    public static SortInfo siForGv = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        var lbLogin = (Master.FindControl("LoginView") as LoginView).FindControl("lbLogin") as LinkButton;
        if (lbLogin != null)
        {
            lbLogin.PostBackUrl = "~/Pages/ReaderLogin.aspx";
        }
        myshow();
    }

    protected void brSearch_Click(object sender, EventArgs e)
    {
        this.notice.Style.Add("display", "none");
        // 输入过滤，未完成
        if (tbSearch.Text.ToString().Length == 0)
        {
            return;
        }

        // 查询
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        MySqlCommand getResult_sql;
        string keyword = tbSearch.Text.ToString();
        if (ddlClass.SelectedValue.ToString().Equals("Books"))
        {
            gvBookResult.Enabled = true;
            getResult_sql = new MySqlCommand("select BookId,Title,ImageURL,Author,Publisher " +
                                                     "from Books " +
                                                     "where " + (ddlField.SelectedValue.ToString().Equals("ISBN") ? "ISBN13 like '%" + keyword + "%' or ISBN10 like '%" + keyword + "%';" : ddlField.Text.ToString() + " like '%" + keyword + "%';"), OLMSDBConnection);
            //下面的语句有问题
            /*var rules_para = new MySqlParameter
            {
                ParameterName = "@rules",
                IsNullable = false,
                Value = ddlField.SelectedValue.ToString().Equals("ISBN") ? "ISBN13 like '%" + keyword + "%' or ISBN10 like '%" + keyword + "%';" : ddlField.Text.ToString() + " like '%" + keyword + "%';"
            };
            getResult_sql.Parameters.Add(rules_para);*/
        }
        else
        {
            gvPeriodicalResult.Enabled = true;
            getResult_sql = new MySqlCommand("select * " +
                                             "from Periodicals " +
                                             "where " + (ddlField.SelectedValue.ToString() + " like '%" + keyword + "%';"), OLMSDBConnection);
            // 同上
            /*var rules_para = new MySqlParameter
            {
                ParameterName = "rules",
                IsNullable = false,
                Value = ddlField.SelectedValue.ToString() + " like '%" + keyword + "%';"
            };
            getResult_sql.Parameters.Add(rules_para);*/
        }

        var resultAdapter = new MySqlDataAdapter(getResult_sql);
        var resultSet = new DataSet();

        OLMSDBConnection.Open();
        resultAdapter.Fill(resultSet);
        OLMSDBConnection.Close();


        if (ddlClass.SelectedValue.ToString().Equals("Books"))
        {
            DataTable searchResult = resultSet.Tables[0];
            gvBookResult.DataSource = searchResult;
            gvBookResult.DataBind();
            gvBookResult.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        else
        {
            DataTable searchResult = resultSet.Tables[0];
            searchResult.Columns.Add("NewType");
            foreach (DataRow row in searchResult.Rows)
            {
                if (Session["PreferredCulture"].ToString() == "zh-CN")
                {
                    if (row["Type"].ToString() == "0")
                    {
                        row["NewType"] = "杂志";
                    }
                    if (row["Type"].ToString() == "1")
                    {
                        row["NewType"] = "报纸";
                    }
                }
                else
                {
                    if (row["Type"].ToString() == "0")
                    {
                        row["NewType"] = "Magazine";
                    }
                    if (row["Type"].ToString() == "1")
                    {
                        row["NewType"] = "Newspaper";
                    }
                }
            }
            gvPeriodicalResult.DataSource = searchResult;
            gvPeriodicalResult.DataBind();
        }


    }

    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (((DropDownList)sender).SelectedValue.ToString().Equals("Books"))
        {
            ddlField.Items.FindByValue("Author").Enabled = true;
            ddlField.Items.FindByValue("ISBN").Enabled = true;
            ddlField.Items.FindByValue("ISSN").Enabled = false;
            gvPeriodicalResult.Enabled = false;
            gvPeriodicalResult.DataSource = null;
            gvPeriodicalResult.DataBind();
        }
        else
        {
            ddlField.Items.FindByValue("Author").Enabled = false;
            ddlField.Items.FindByValue("ISBN").Enabled = false;
            ddlField.Items.FindByValue("ISSN").Enabled = true;
            gvBookResult.Enabled = false;
            gvBookResult.DataSource = null;
            gvBookResult.DataBind();
        }
    }

    protected void tbSearch_TextChanged(object sender, EventArgs e)
    {
        if (tbSearch.Text == "") this.notice.Style.Add("display", "block");
        else this.notice.Style.Add("display", "none");
    }
    public void myshow()
    {
     
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        var OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

        MySqlCommand getDeposit_sql = new MySqlCommand("select * from Notices ORDER BY NoticeId DESC LIMIT 3");
        var result1Adapter = new MySqlDataAdapter();
        result1Adapter.SelectCommand = getDeposit_sql;
        result1Adapter.SelectCommand.Connection = OLMSDBConnection;
        var result1Set = new DataSet();

        OLMSDBConnection.Open();
        result1Adapter.Fill(result1Set);
        OLMSDBConnection.Close();
        DataTable search1Result = result1Set.Tables[0];

        DataTable dtResult = new DataTable();
        dtResult = search1Result.Copy();
        String [] notices= { "No announcement", "No announcement", "No announcement", "", "" };
        int i = 0;
        foreach (DataRow dr in dtResult.Rows)
        {
            notices[i++] = dr["Details"].ToString();
        }
        notice1.Text = notices[0].ToString();
        notice2.Text = notices[1].ToString();
        notice3.Text = notices[2].ToString();

    }

    protected void tbSearch_TextChanged1(object sender, EventArgs e)
    {

    }
}