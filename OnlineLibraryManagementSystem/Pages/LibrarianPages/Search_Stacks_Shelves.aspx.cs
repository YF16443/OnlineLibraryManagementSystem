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
using System.Data;

public partial class Pages_Search_Stacks_Shelves : BasePage
{
    public static SortInfo siForGv = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            gvShelvesResult.Enabled = false;
            gvShelvesResult.DataSource = null;
            gvShelvesResult.DataBind();
            gvStacksResult.Enabled = false;
            gvStacksResult.DataSource = null;
            gvStacksResult.DataBind();
        }
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
    }


    protected void Search(object sender, EventArgs e)
    {
            string tabletype = "";
            string id = "";
            string idtype = "";
            tabletype = DropDownList1.SelectedValue.ToString();
            if (tabletype == "Stacks")
            {
                idtype = "StackId";
                gvShelvesResult.Enabled = false;
                gvShelvesResult.DataSource = null;
                gvShelvesResult.DataBind();

            }
            if (tabletype == "Shelves")
            {
                idtype = "ShelfId";
                gvStacksResult.Enabled = false;
                gvStacksResult.DataSource = null;
                gvStacksResult.DataBind();
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
            string selectexit = "select count(*) as num from " + tabletype + " where " + idtype + " like '%" + id + "%';";
            try
            {
                OLMSDBConnection.Open();
                MySqlCommand cmdselectexit = new MySqlCommand(selectexit, OLMSDBConnection);
                MySqlDataReader reader = cmdselectexit.ExecuteReader();
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
                string selectinfo = "select * from " + tabletype + " where " + idtype + " like '%" + id + "%';";
                BindDataTogvResult(selectinfo);
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
    protected void gvStacksResult_Sorting(object sender, GridViewSortEventArgs e)
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
    protected void BindDataTogvResult(string str)
    {
        //绑定gvstacks或gvshelves
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            MySqlCommand cmdselectstackinfo = new MySqlCommand(str, OLMSDBConnection);
            MySqlDataAdapter info = new MySqlDataAdapter(cmdselectstackinfo);
            DataSet infoset = new DataSet();
            info.Fill(infoset);
            DataTable searchResult = infoset.Tables[0];
            siForGv = new SortInfo(infoset.Tables[0]);
            if (DropDownList1.SelectedValue.ToString() == "Stacks")
            {
                gvStacksResult.Enabled = true;
                gvStacksResult.DataSource = searchResult;
                gvStacksResult.DataBind();
            }
            else
            {
                gvShelvesResult.Enabled = true;
                gvShelvesResult.DataSource = searchResult;
                gvShelvesResult.DataBind();
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
    protected void gvStacksResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (siForGv == null)
        {
            return;
        }
        GridView SortGv = (GridView)sender;
        int page = e.NewPageIndex;
        siForGv.SortDataBind(SortGv, page, true);
    }
    protected void gvShelvesResult_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void gvShelvesResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (siForGv == null)
        {
            return;
        }
        GridView SortGv = (GridView)sender;
        int page = e.NewPageIndex;
        siForGv.SortDataBind(SortGv, page, true);
    }
    protected void Delete(object sender, EventArgs e)
    {
        //删除stack或shelf
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            OLMSDBConnection.Open();
            CheckBox cb = new CheckBox();
            string id = "";
            int result = 0;
            if (DropDownList1.SelectedValue.ToString() == "Stacks")
            {
                foreach (GridViewRow row in gvStacksResult.Rows)
                {
                    cb = (CheckBox)row.FindControl("CheckBoxDeleteStack");
                    if (cb!=null&&cb.Checked == true)
                    {
                        id = (row.Cells[0].Controls[0] as HyperLink).Text;
                        string deletestack = "delete from Stacks where StackId='" + id + "';";
                        MySqlCommand cmddeletestack = new MySqlCommand(deletestack, OLMSDBConnection);
                        result += cmddeletestack.ExecuteNonQuery();
                    }
                }
                string selectstack = "select * from Stacks where StackId like '%" + TextBoxID.Text + "%';";
                BindDataTogvResult(selectstack);
            }
            if (DropDownList1.SelectedValue.ToString() == "Shelves")
            {
                foreach (GridViewRow row in gvShelvesResult.Rows)
                {
                    cb = (CheckBox)row.FindControl("CheckBoxDeleteShelf");
                    if (cb!=null&&cb.Checked==true)
                    {
                        id = (row.Cells[0].Controls[0] as HyperLink).Text;
                        string deleteshelf = "delete from Shelves where ShelfId='" + id + "';";
                        MySqlCommand cmddeleteshelf = new MySqlCommand(deleteshelf, OLMSDBConnection);
                        result += cmddeleteshelf.ExecuteNonQuery();
                    }
                }
                string selectshelf = "select * from Shelves where ShelfId like '%" + TextBoxID.Text + "%';";
                BindDataTogvResult(selectshelf);
            }
            if (result != 0)
            {
                Response.Write("<script>alert('删除成功')</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('请选择删除的项')</script>");
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