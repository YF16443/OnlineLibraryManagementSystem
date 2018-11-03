using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;            //引入命名空间
using System.Data.SqlClient;  //引入命名空间
using MySql.Data.MySqlClient;

public partial class Pages_AdminPages_SearchLibrarian : BasePage
{


    //SqlConnection sqlcon;
    //SqlCommand sqlcom;
    //string strCon = "Server=cdb-2x9xtpja.cd.tencentcdb.com;Database=Librarians;Uid=olms;Pwd=123456";
    string strCon = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
    MySqlConnection sqlcon;
    MySqlCommand sqlcom;
    protected void Page_Load(object sender, EventArgs e)
    {
        //MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bind();
    }
    //删除
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sqlstr = "delete from Librarians where LibrarianId='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcon = new MySqlConnection(strCon);
        sqlcom = new MySqlCommand(sqlstr, sqlcon);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
        bind();
    }
    //更新
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        sqlcon = new MySqlConnection(strCon);
        string sqlstr = "update Librarians set Account='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "',Password='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "',Name='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "' where LibrarianId='"
            + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcom = new MySqlCommand(sqlstr, sqlcon);
        sqlcon.Open();
        sqlcom.ExecuteNonQuery();
        sqlcon.Close();
        GridView1.EditIndex = -1;
        bind();
    }
    //取消
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bind();
    }
    //绑定
    public void bind()
    {
        string sqlstr = "select * from Librarians";
        sqlcon = new MySqlConnection(strCon);
        MySqlDataAdapter myda = new MySqlDataAdapter(sqlstr, sqlcon);
        DataSet myds = new DataSet();
        sqlcon.Open();
        myda.Fill(myds, "Librarians");
        GridView1.DataSource = myds;
        GridView1.DataKeyNames = new string[] { "LibrarianId" };//主键
        GridView1.DataBind();
        sqlcon.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string LibrarianId = TextBox1.Text.ToString();
        string Account = TextBox2.Text.ToString();
        string Password = TextBox3.Text.ToString();
        string Name = TextBox4.Text.ToString();
        sqlcon = new MySqlConnection(strCon);
        string sql = "insert into Librarians(LibrarianId,Account,Password,Name) values('" + LibrarianId + "','" + Account + "','" + Password + "','" + Name + "')";
        string sqlstr = "select LibrarianId,Account,Password,Name from Librarians";
        sqlcon.Open();
        MySqlCommand sqlcom = new MySqlCommand(sql, sqlcon);
        sqlcom.ExecuteNonQuery();
        MySqlDataAdapter sqlda = new MySqlDataAdapter(sqlstr, sqlcon);
        DataSet ds = new DataSet();
        sqlda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        sqlcon.Close();
    }



}