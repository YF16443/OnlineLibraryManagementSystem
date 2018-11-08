using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.IO;

public partial class Pages_LibrarianPages_BookMessage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string bookId = Request["book_id"];
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
            try
            {
                string book_id_sql = "select * from Books where BookId=" + bookId;
                OLMSDBConnection.Open();
                MySqlCommand cmd1 = new MySqlCommand(book_id_sql, OLMSDBConnection);
                ArrayList books_list = new ArrayList();
                MySqlDataReader reader = cmd1.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        Image1.ImageUrl = reader["ImageURL"].ToString();
                        TextBoxtitle.Text = reader["Title"].ToString();
                        TextBoxauthor.Text = reader["Author"].ToString();
                        TextBoxpubdate.Text = Convert.ToDateTime(reader["PubDate"]).ToString("yyyy-MM-dd");
                        TextBoxprice.Text = reader["Price"].ToString();
                        TextBoxisbn13.Text = reader["ISBN13"].ToString();
                        TextBoxisbn10.Text = reader["ISBN10"].ToString();
                        TextBoxpages.Text = reader["Pages"].ToString();
                        TextBoxpublisher.Text = reader["Publisher"].ToString();
                        break;
                    }
                }

                reader.Close();




                ////////////////////////////////////////////////图书位置信息/////////////////////////////////////////
                string shelfid = "";
                string stackid = "";

                string book_shelfid = "select Shelfid from BookBarcodes where BookId='" + bookId + "';";

                MySqlCommand cmd2 = new MySqlCommand(book_shelfid, OLMSDBConnection);
                MySqlDataReader reader1 = cmd2.ExecuteReader();

                while (reader1.Read())
                {
                    if (reader1.HasRows)
                    {
                        shelfid = reader1["Shelfid"].ToString();
                        break;
                    }
                }
                reader1.Close();
                string book_stackid = "select StackId from Shelves where ShelfId='" + shelfid + "';";
                MySqlCommand cmd3 = new MySqlCommand(book_stackid, OLMSDBConnection);
                MySqlDataReader reader2 = cmd3.ExecuteReader();
                if (reader2.Read())
                {
                    stackid = reader2["StackId"].ToString();
                }
                reader2.Close();
                DropDownList1.Items.Add(shelfid + "," + stackid);
                string additems = "select ShelfId,StackId from Shelves where ShelfId<>'" + shelfid + "';";
                MySqlCommand cmdadditems = new MySqlCommand(additems, OLMSDBConnection);
                MySqlDataReader reader3 = cmdadditems.ExecuteReader();
                while (reader3.Read())
                {
                    DropDownList1.Items.Add(reader3["ShelfId"].ToString() + "," + reader3["StackId"].ToString());
                }
                reader3.Close();

                ////////////////////////////////////////////////Barcode表/////////////////////////////////////////
                BindDataTogvResult();

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



    protected void Alter_Click(object sender, EventArgs e)
    {
        string bookId = Request["book_id"];
        string newtitle = "";
        string newauthor = "";
        string newpubdate = "";
        string newprice = "";
        string newisbn13 = "";
        string newisbn10 = "";
        string newpages = "";
        string newpublisher = "";
        string newshelfid = "";
        string pubdateparttern = "^[0-9]{4}-(0?[0-9]|1[0-2])-(0?[1-9]|[12]?[0-9]|3[01])$";
        string float_priceparttern = "^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
        string integer_priceparttern = "^[1-9]\\d*$";
        string pagesparttern = "^[1-9]\\d*$";
        string isbn13parttern = "^[0-9A-Z]{13}$";
        string isbn10parttern = "^[0-9A-Z]{10}$";
        if (TextBoxtitle.Text.Trim() != "")
        {
            newtitle = TextBoxtitle.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Title Is Null!')</script>");
            return;
        }
        if (TextBoxauthor.Text.Trim() != "")
        {
            newauthor = TextBoxauthor.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Author Is Null!')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxpubdate.Text.Trim(), pubdateparttern))
        {
            newpubdate = TextBoxpubdate.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error Pubdate!\\nPubdate Example:YYYY-XX-MM')</script>");
            return;
        }
        if (TextBoxisbn13.Text.Trim().Length == 13 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxisbn13.Text.Trim(), isbn13parttern))
        {
            newisbn13 = TextBoxisbn13.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error ISBN13 Format!')</script>");
            return;
        }
        if (TextBoxisbn10.Text.Trim().Length == 10 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxisbn10.Text.Trim(), isbn10parttern))
        {
            newisbn10 = TextBoxisbn10.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error ISBN10 Format!')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxprice.Text.Trim(), float_priceparttern) || System.Text.RegularExpressions.Regex.IsMatch(TextBoxprice.Text.Trim(), integer_priceparttern))
        {
            newprice = TextBoxprice.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error Price Format!')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxpages.Text.Trim(), pagesparttern))
        {
            newpages = TextBoxpages.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error Pages Format!')</script>");
            return;
        }
        if (TextBoxpublisher.Text.Trim() != "")
        {
            newpublisher = TextBoxpublisher.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Publisher Is Null!')</script>");
            return;
        }
        string[] shelf = DropDownList1.SelectedItem.Text.Split(',');
        newshelfid = shelf[0];

        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        { 
            OLMSDBConnection.Open();
            //查管理员id
            string librarianid = "";
            string librarianaccount = "";
            if (string.IsNullOrEmpty((string)Session["lid"]))
            {
                Response.Write("<script>alert('Account Is Null!')</script>");
                return;
            }
            else
            {
                librarianaccount = Session["lid"].ToString();
            }
            string selectlibrarianid = "select LibrarianId from Librarians where Account='" + librarianaccount + "';";
            MySqlCommand cmdselectlibrarianid = new MySqlCommand(selectlibrarianid, OLMSDBConnection);
            MySqlDataReader readerlibrarianid = cmdselectlibrarianid.ExecuteReader();
            if (readerlibrarianid.Read())
            {
                librarianid = readerlibrarianid["LibrarianId"].ToString();
            }
            readerlibrarianid.Close();
            //查书本数量
            string amount = "";
            string selectbookamount = "select Amount from Books where BookId='" + bookId + "';";
            MySqlCommand cmdselectbookamount = new MySqlCommand(selectbookamount, OLMSDBConnection);
            MySqlDataReader readerbookamount = cmdselectbookamount.ExecuteReader();
            if (readerbookamount.Read())
            {
                amount = readerbookamount["Amount"].ToString();
            }
            readerbookamount.Close();
            //记录操作
            string insertbookmanagement = "insert into BookManagementRecords(Operation,Bookid,LibrarianId,Amount) values('Alter','" + bookId + "','" + librarianid + "','" + amount + "');";
            int result2 = 0;
            MySqlCommand cmdinsertbookmanagement = new MySqlCommand(insertbookmanagement, OLMSDBConnection);
            result2 = cmdinsertbookmanagement.ExecuteNonQuery();
            //更新书本
            string updatebook = "update Books set Title='" + newtitle + "',Author='" + newauthor + "',PubDate='" + newpubdate + "',Price='" + newprice + "',ISBN13='" + newisbn13 + "',ISBN10='" + newisbn10 + "',Pages='" + newpages + "',Publisher='" + newpublisher + "',ImageURL='" + Image1.ImageUrl + "' where BookId='" + bookId + "';";
            MySqlCommand cmdupdatebook = new MySqlCommand(updatebook, OLMSDBConnection);
            int result = 0;
            result = cmdupdatebook.ExecuteNonQuery();
            string updateshelfid = "update BookBarcodes set ShelfId='" + newshelfid + "' where BookId='" + bookId + "';";
            MySqlCommand cmdupdateshelfid = new MySqlCommand(updateshelfid, OLMSDBConnection);
            int result1 = 0;
            result1 = cmdupdateshelfid.ExecuteNonQuery();
            if (result != 0 && result1 != 0&& result2!=0)
            {
                BindDataTogvResult();
                Response.Write("<script>alert('Edited Successfully!')</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('Edited Faild!')</script>");
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

    protected void Upload_Click(object sender, EventArgs e)
    {
        bool filesValid = false;
        HttpPostedFile req = Request.Files["fileupload"];
        if (req == null || req.ContentLength < 0)
        {

            Response.Write("<script>alert('Not Found!')</script>");
        }
        else
        {

            string fileExtension = System.IO.Path.GetExtension(req.FileName.ToString()).ToLower();
            string[] restricyExtension = { ".gif", ".jpg", ".bmp", ".png" };
            string src = req.FileName;
            for (int i = 0; i < restricyExtension.Length; i++)
            {
                if (fileExtension == restricyExtension[i])
                {
                    filesValid = true;

                }

            }
            if (filesValid == true)
            {
                //判断是否有该路径  
                string wantPath = Server.MapPath("~/Images/Cover/");
                if (!Directory.Exists(wantPath))
                {   //如果不存在就创建
                    Directory.CreateDirectory(wantPath);
                    req.SaveAs(wantPath + src);
                    Image1.ImageUrl = "~/Images/Cover/" + src;
                }
                else
                {
                    req.SaveAs(wantPath + src);
                    Image1.ImageUrl = "~/Images/Cover/" + src;

                }

            }
            else
            {
                Response.Write("<script>alert('Error Format!')</script>");
                return;
            }

        }
    }


    protected void ButtonPrint_Barcode_Click(object sender, EventArgs e)
    {
        string barcode = "";
        //barcode = ((Button)sender).CommandArgument.ToString();
        GridViewRow row = (GridViewRow)(((Button)sender).NamingContainer); 
        Label barcodelabel = (Label)row.FindControl("BookBarcode");
        barcode = barcodelabel.Text;
        //Barcode generation test
        if (barcode != "")
        {
            MyBarcodeGenerator.Generate(barcode);
            DataTable dt = new DataTable();
            dt.Columns.Add("name");
            DataRow dr = dt.NewRow();
            dr["name"] = barcode+".jpg";
            dt.Rows.Add(dr);
            DataListbookbarcode.Enabled = true;
            DataListbookbarcode.DataSource = dt;
            DataListbookbarcode.DataBind();
            BindDataTogvResult();
           // Button buttonprint = (Button)row.FindControl("Button2");
            //ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>doPrint();</script>");
            //Response.Write("<script>alert('" + barcode + "')</script>");
            //var barcodeImage = MyBarcodeGenerator.Generate(barcode) as System.Drawing.Image;
            //MyBarcodeGenerator.ShowBarcode(barcode, this.Response);
        }
        else
        {
            Response.Write("<script>alert('Error!')<script/>");
        }
    }
    /*protected int bind()
    {
        //MyBarcodeGenerator.Generate(barcode);
        DataTable dt = new DataTable();
        dt.Columns.Add("name");
        DataRow dr = dt.NewRow();
        dr["name"] = "711128060.jpg";
        dt.Rows.Add(dr);
        DataListbookbarcode.Enabled = true;
        DataListbookbarcode.DataSource = dt;
        DataListbookbarcode.DataBind();
        return 0;
    }*/
    protected int deletebind()
    {
        DataListbookbarcode.Enabled = false;
        DataListbookbarcode.DataSource = null;
        DataListbookbarcode.DataBind();
        return 0;
    }
    protected void BindDataTogvResult()
    {
        //绑定gvbarcode
        string bookid = Request["book_id"];
        string selectbarcode = "select * from BookBarcodes where BookId='" + bookid + "';";
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            MySqlCommand cmdselectbarcodeinfo = new MySqlCommand(selectbarcode, OLMSDBConnection);
            MySqlDataAdapter info = new MySqlDataAdapter(cmdselectbarcodeinfo);
            DataSet infoset = new DataSet();
            info.Fill(infoset);
            DataTable searchResult = infoset.Tables[0];
            searchResult.Columns.Add("newStatus");
            foreach (DataRow row in searchResult.Rows)
            {
                string status = row["Status"].ToString();
                if (Session["PreferredCulture"].ToString() == "zh-CN")
                {
                    if (status == "0")
                        row["newStatus"] = "在馆无预约";
                    if (status == "1")
                        row["newStatus"] = "已借出";
                    if (status == "2")
                        row["newStatus"] = "已预约";
                }
                else
                {
                    if (status == "0")
                        row["newStatus"] = "No Reservation";
                    if (status == "1")
                        row["newStatus"] = "On Loan";
                    if (status == "2")
                        row["newStatus"] = "Aleardy Reserved";
                }
            }
            gvBookBarcodeResult.Enabled = true;
            gvBookBarcodeResult.DataKeyNames = new string[] { "BookBarcode" };
            gvBookBarcodeResult.DataSource = searchResult;
            gvBookBarcodeResult.DataBind();
            gvBookBarcodeResult.HeaderRow.TableSection = TableRowSection.TableHeader;
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

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        //检查登陆
        if (string.IsNullOrEmpty((string)Session["lid"]))
        {
            Response.Write("<script type='text/javascript'>alert('" + Resources.Resource.LogInNotice + "');location.href='/Pages/LibrarianLogin.aspx';</script>");
        }
        //删除Barcode
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            OLMSDBConnection.Open();
            CheckBox cb = new CheckBox();
            string bookbarcode = "";
            string bookid = Request["book_id"];
            string account = "";
            if (string.IsNullOrEmpty((string)Session["lid"]))
            {
                Response.Write("<script>alert('Account Is Null!')</script>");
                return;
            }
            else
            {
                account = Session["lid"].ToString();
            }
            string librarianid = "";
            string oldamount = "";
            string newamount = "";
            int amount = 0;
            int resultbarcode = 0;
            int resultupdatebook = 0;
            int resultbookmanagement = 0;
            //删除barcode
            foreach (GridViewRow row in gvBookBarcodeResult.Rows)
            {
                cb = (CheckBox)row.FindControl("CheckBoxDeleteBarcode");
                if (cb != null && cb.Checked == true)
                {
                    bookbarcode = row.Cells[0].Text;
                    string deletebookbarcode = "delete from BookBarcodes where  BookBarcode='" + bookbarcode + "';";
                    MySqlCommand cmddeletbookbarcode = new MySqlCommand(deletebookbarcode, OLMSDBConnection);
                    resultbarcode += cmddeletbookbarcode.ExecuteNonQuery();
                    amount += 1;
                }
            }

            //查询书本原有数量
            string selectbookamout = "select Amount from Books where BookId='" + bookid + "';";
            MySqlCommand cmdselectbookamout = new MySqlCommand(selectbookamout, OLMSDBConnection);
            MySqlDataReader readeroldamount = cmdselectbookamout.ExecuteReader();
            if (readeroldamount.Read())
            {
                oldamount = readeroldamount["Amount"].ToString();
            }
            readeroldamount.Close();
        //查询管理员id
            string selectlibrarianid = "select LibrarianId from Librarians where Account='" + account + "';";
            MySqlCommand cmdselectlibrarianid = new MySqlCommand(selectlibrarianid, OLMSDBConnection);
            MySqlDataReader readerlid = cmdselectlibrarianid.ExecuteReader();
            if (readerlid.Read())
            {
                librarianid = readerlid["LibrarianId"].ToString();
            }
            readerlid.Close();
            if(resultbarcode!=0)
            { 
                //插入操作记录
                string insertbookmanagement = "insert BookManagementRecords(Operation,BookId,LibrarianId,Amount) Values('Delete','" + bookid + "','" + librarianid + "','" + amount + "');";
                MySqlCommand cmdinsertbookmanagement = new MySqlCommand(insertbookmanagement, OLMSDBConnection);
                resultbookmanagement = cmdinsertbookmanagement.ExecuteNonQuery();
                //更新书本数量
                newamount = (int.Parse(oldamount) - amount).ToString();
                string updatebook = "update Books set Amount='" + newamount + "' where BookId='" + bookid + "';";
                MySqlCommand cmdupdatebook = new MySqlCommand(updatebook, OLMSDBConnection);
                resultupdatebook = cmdupdatebook.ExecuteNonQuery();
           }
            //重新绑定gridview
            string selectbarcode = "select * from BookBarcodes where BookId='" + bookid + "';";
            BindDataTogvResult();
            if (resultbarcode != 0&&resultupdatebook!=0&&resultbookmanagement!=0)
            {
                Response.Write("<script>alert('Deleted Successfully!')</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('Can\\'t Delete!')</script>");
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
    protected void gvBookBarcodeResult_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string bookbarcode = gvBookBarcodeResult.DataKeys[e.RowIndex].Values[0].ToString();
        string bookid = Request["book_id"];
        string account = "";
        if (string.IsNullOrEmpty((string)Session["lid"]))
        {
            Response.Write("<script>alert('Account Is Null!')</script>");
            return;
        }
        else
        {
            account = Session["lid"].ToString();
        }
        string librarianid = "";

        OLMSDBConnection.Open();

        //查询管理员id
        string selectlibrarianid = "select LibrarianId from Librarians where Account='" + account + "';";
        MySqlCommand cmdselectlibrarianid = new MySqlCommand(selectlibrarianid, OLMSDBConnection);
        MySqlDataReader readerlid = cmdselectlibrarianid.ExecuteReader();
        if (readerlid.Read())
        {
            librarianid = readerlid["LibrarianId"].ToString();
        }
        readerlid.Close();
        //插入操作记录
        string insertbookmanagement = "insert BookManagementRecords(Operation,BookId,LibrarianId,Amount) Values('Delete','" + bookid + "','" + librarianid + "','1');";
        MySqlCommand cmdinsertbookmanagement = new MySqlCommand(insertbookmanagement, OLMSDBConnection);
        int resultbookmanagement = cmdinsertbookmanagement.ExecuteNonQuery();
        //删除副本
        string sqlstr = "delete from BookBarcodes where BookBarcode=" + bookbarcode + ";";
        System.Diagnostics.Debug.WriteLine("database is ok");
        MySqlCommand cmd = new MySqlCommand(sqlstr, OLMSDBConnection);
        int result = cmd.ExecuteNonQuery();
        //更新书本数量
        string selectamount = "select Amount from Books where BookId='" + bookid + "';";
        string oldamount = "";
        MySqlCommand cmdselectbookamount = new MySqlCommand(selectamount, OLMSDBConnection);
        MySqlDataReader readeroldamount = cmdselectbookamount.ExecuteReader();
        if (readeroldamount.Read())
        {
            oldamount = readeroldamount["Amount"].ToString();
        }
        readeroldamount.Close();
        int newamount = int.Parse(oldamount) - 1;
        string updatebookamount = "update Books set amount='" + newamount.ToString() + "' where BookId='" + bookid + "';";
        MySqlCommand cmdupdatebookamount = new MySqlCommand(updatebookamount, OLMSDBConnection);
        int result1 = cmdupdatebookamount.ExecuteNonQuery();
        readeroldamount.Close();
        OLMSDBConnection.Close();
        if (result!=0&&result1!=0)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('Deleted Successful!');", true);
            BindDataTogvResult();
            return;
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('Faid!');", true);
            //Response.Redirect()
            return;
        }

    }
    protected void gvBookBarcodeResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookBarcodeResult.PageIndex = e.NewPageIndex;
        BindDataTogvResult();
    }
    protected void gvBookBarcodeResult_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvBookBarcodeResult.EditIndex = -1;
        BindDataTogvResult();
    }
    protected void gvBookBarcodeResult_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        //记录操作
        string bookid = Request["book_id"];
        string account = "";
        if (string.IsNullOrEmpty((string)Session["lid"]))
        {
            Response.Write("<script>alert('Account Is Null!')</script>");
            return;
        }
        else
        {
            account = Session["lid"].ToString();
        }
        string librarianid = "";
        conn.Open();
        //查询管理员id
        string selectlibrarianid = "select LibrarianId from Librarians where Account='" + account + "';";
        MySqlCommand cmdselectlibrarianid = new MySqlCommand(selectlibrarianid, conn);
        MySqlDataReader readerlid = cmdselectlibrarianid.ExecuteReader();
        if (readerlid.Read())
        {
            librarianid = readerlid["LibrarianId"].ToString();
        }
        readerlid.Close();
        //插入操作记录
        string insertbookmanagement = "insert BookManagementRecords(Operation,BookId,LibrarianId,Amount) Values('Alter','" + bookid + "','" + librarianid + "','1');";
        MySqlCommand cmdinsertbookmanagement = new MySqlCommand(insertbookmanagement, conn);
        int resultbookmanagement = cmdinsertbookmanagement.ExecuteNonQuery();
        conn.Close();
        //更新
        string bookbarcode = gvBookBarcodeResult.DataKeys[e.RowIndex].Values[0].ToString();
        string shelfid = ((DropDownList)gvBookBarcodeResult.Rows[e.RowIndex].FindControl("ddlShelfId")).SelectedItem.Text.ToString();
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "update BookBarcodes set ShelfId=@s where BookBarcode=@i";
        MySqlParameter param;
        param = new MySqlParameter("@s", shelfid);
        cmd.Parameters.Add(param);
        param = new MySqlParameter("@i", bookbarcode);
        cmd.Parameters.Add(param);
        int result = cmd.ExecuteNonQuery();
        if (result == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.EditSuccess + "');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.EditFail + "');", true);
        }
        gvBookBarcodeResult.EditIndex = -1;
        BindDataTogvResult();
    }
    protected void gvBookBarcodeResult_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvBookBarcodeResult.EditIndex = e.NewEditIndex;
        BindDataTogvResult();
        //添加项目
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        OLMSDBConnection.Open();
        string selectshelfid = "select ShelfId from Shelves";
        MySqlCommand cmdselectshelfid = new MySqlCommand(selectshelfid, OLMSDBConnection);
        MySqlDataReader readershelfid = cmdselectshelfid.ExecuteReader();
        DropDownList ddlshelfid = (DropDownList)(gvBookBarcodeResult.Rows[e.NewEditIndex].FindControl("ddlShelfId"));
        if (ddlshelfid != null)
        {
            ddlshelfid.Items.Clear();
        }
        while (readershelfid.Read())
        {
            ddlshelfid.Items.Add(readershelfid["ShelfId"].ToString());
        }
        readershelfid.Close();
        OLMSDBConnection.Close();
    }


}