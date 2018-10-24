using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;

public partial class Pages_LibrarianPages_SearchBooks : BasePage
{
    public static SortInfo siForGv = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void brSearch_Click(object sender, EventArgs e)
    {
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
            getResult_sql = new MySqlCommand("select Title " +
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

        DataTable searchResult = resultSet.Tables[0];
        siForGv = new SortInfo(resultSet.Tables[0]);

        if (ddlClass.SelectedValue.ToString().Equals("Books"))
        {
            gvBookResult.DataSource = searchResult;
            gvBookResult.DataBind();
        }

        else
        {
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

    protected void gvBookResult_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (siForGv == null)
        {
            return;
        }
        GridView SortGv = (GridView)sender;
        siForGv.SortExpression = e.SortExpression;
        int page = SortGv.PageIndex;
        siForGv.SortDataBind(SortGv, page, false);

    }

    protected void gvBookResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (siForGv == null)
        {
            return;
        }
        GridView SortGv = (GridView)sender;
        int page = e.NewPageIndex;
        siForGv.SortDataBind(SortGv, page, true);
    }


    protected void brDelete_Click(object sender, EventArgs e)
    {
        //删除图书或期刊
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            OLMSDBConnection.Open();
            CheckBox cb = new CheckBox();
            string id = "";
            int result = 0;
            if (ddlClass.SelectedValue.ToString() == "Books")//删除图书
            {
                foreach (GridViewRow row in gvBookResult.Rows)
                {
                    cb = (CheckBox)row.FindControl("CheckBoxDeleteBook");
                    if (cb != null && cb.Checked == true)
                    {
                        id = (row.Cells[1].Controls[0] as HyperLink).Text;
                        string deletebook = "delete from Books where Title='" + id + "';";
                        MySqlCommand cmddeletebook = new MySqlCommand(deletebook, OLMSDBConnection);
                        result += cmddeletebook.ExecuteNonQuery();
                    }
                }
                //重新绑定gridview,使用函数较方便
                string keyword = tbSearch.Text.ToString();

                MySqlCommand getResult_sql = new MySqlCommand("select BookId,Title,ImageURL,Author,Publisher " +
                                                     "from Books " +
                                                     "where " + (ddlField.SelectedValue.ToString().Equals("ISBN") ? "ISBN13 like '%" + keyword + "%' or ISBN10 like '%" + keyword + "%';" : ddlField.Text.ToString() + " like '%" + keyword + "%';"), OLMSDBConnection);
                MySqlDataAdapter resultAdapter = new MySqlDataAdapter(getResult_sql);
                DataSet resultSet = new DataSet();
                
                resultAdapter.Fill(resultSet);

                DataTable searchResult = resultSet.Tables[0];
                siForGv = new SortInfo(resultSet.Tables[0]);
                gvBookResult.Enabled = true;
                gvBookResult.DataSource = searchResult;
                gvBookResult.DataBind();
            }
            if (ddlClass.SelectedValue.ToString() == "Periodical")//删除期刊
            { }
            if (result != 0)
            {
                Response.Write("<script>alert('Deleted Successfully!')</script>");
                
            }
            else
            {
                Response.Write("<script>alert('Please Select Book!')</script>");
                
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