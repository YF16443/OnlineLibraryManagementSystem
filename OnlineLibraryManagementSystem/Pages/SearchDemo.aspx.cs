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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    //private void BindBook()
    //{
    //    DataView view = lastResult.DefaultView;
    //    String sort = (string)ViewState["SortOrder"] + " " + (string)ViewState["OrderDire"];
    //    view.Sort = sort;
    //    gvBookResult.DataSource = view;
    //    gvBookResult.DataBind();
    //}
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

        if (ddlClass.SelectedValue.ToString().Equals("Books"))
        {
            gvBookResult.DataSource = searchResult;
            gvBookResult.DataBind();
            //BindBook();
        }
           
        else
        {
            gvPeriodicalResult.DataSource = searchResult;
            gvPeriodicalResult.DataBind();
        }
        //ViewState["SortOrder"] = "BookId";
        //ViewState["OrderDire"] = "ASC";


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
        string sPage = e.SortExpression;
        if (ViewState["SortOrder"].ToString() == sPage)
        {
            if (ViewState["OrderDire"].ToString() == "Desc")
                ViewState["OrderDire"] = "ASC";
            else
                ViewState["OrderDire"] = "Desc";
        }
        else
        {
            ViewState["SortOrder"] = e.SortExpression;
        }
        //BindBook();
    }

}