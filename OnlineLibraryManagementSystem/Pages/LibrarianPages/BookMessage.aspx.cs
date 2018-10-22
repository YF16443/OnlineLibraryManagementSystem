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
        if (!Page.IsPostBack)
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
                        //Label7.Text = " 子标题：";
                        //Label8.Text = "来源：";
                        //Label9.Text = " 装订方式：";
                        //Label10.Text = " 翻译人：";
                        //Label11.Text = " 分类：";
                        TextBoxtitle.Text = reader["Title"].ToString();
                        TextBoxauthor.Text = reader["Author"].ToString();
                        TextBoxpubdate.Text = Convert.ToDateTime(reader["PubDate"]).ToString("yyyy-MM-dd");
                        TextBoxprice.Text = reader["Price"].ToString();
                        TextBoxisbn13.Text = reader["ISBN13"].ToString();
                        TextBoxisbn10.Text = reader["ISBN10"].ToString();
                        //subtitle.Text = reader["SubTitle"].ToString();
                        //origintitle.Text = reader["OriginTitle"].ToString();
                        //binding.Text = reader["Binding"].ToString();
                        //translator.Text = reader["Translator"].ToString();
                        //catalog.Text = reader["Catalog"].ToString();
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
        string pubdateparttern = "([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))";
        string priceparttern = "^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";
        string pagesparttern = "^[1-9]\\d*$";
        string isbnparttern = "^[0-9A-Z]+$";
        if (TextBoxtitle.Text != "")
        {
            newtitle = TextBoxtitle.Text;
        }
        else
        {
            Response.Write("<script>alert('标题不为空')</script>");
            return;
        }
        if (TextBoxauthor.Text != "")
        {
            newauthor = TextBoxauthor.Text;
        }
        else
        {
            Response.Write("<script>alert('作者不为空')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxpubdate.Text, pubdateparttern) )
        {
            newpubdate = TextBoxpubdate.Text;
        }
        else
        {
            Response.Write("<script>alert('出版日期格式为YYYY-XX-MM')</script>");
            return;
        }
        if (TextBoxisbn13.Text.Length ==13 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxisbn13.Text, isbnparttern))
        {
            newisbn13 = TextBoxisbn13.Text;
        }
        else
        {
            Response.Write("<script>alert('ISBN13格式不正确')</script>");
            return;
        }
        if (TextBoxisbn10.Text.Length == 10 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxisbn10.Text, isbnparttern))
        {
            newisbn10 = TextBoxisbn10.Text;
        }
        else
        {
            Response.Write("<script>alert('ISBN10格式不正确')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxprice.Text, priceparttern))
        {
            newprice = TextBoxprice.Text;
        }
        else
        {
            Response.Write("<script>alert('价格格式不正确')</script>");
            return;
        }
        if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxpages.Text, pagesparttern))
        {
            newpages = TextBoxpages.Text;
        }
        else
        {
            Response.Write("<script>alert('页数格式不正确')</script>");
            return;
        }
        if (TextBoxpublisher.Text != "")
        {
            newpublisher = TextBoxpublisher.Text;
        }
        else
        {
            Response.Write("<script>alert('出版社不为空')</script>");
            return;
        }
        string[] shelf = DropDownList1.SelectedItem.Text.Split(',');
        newshelfid = shelf[0];
       
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            OLMSDBConnection.Open();
            string updatebook = "update Books set Title='" + newtitle + "',Author='" + newauthor + "',PubDate='" + newpubdate + "',Price='" + newprice + "',ISBN13='" + newisbn13 + "',ISBN10='" + newisbn10 + "',Pages='" + newpages + "',Publisher='" + newpublisher + "',ImageURL='" + Image1.ImageUrl + "' where BookId='" + bookId + "';";
            MySqlCommand cmdupdatebook = new MySqlCommand(updatebook, OLMSDBConnection);
            int result = 0;
            result = cmdupdatebook.ExecuteNonQuery();
            string updateshelfid = "update BookBarcodes set ShelfId='" + newshelfid + "' where BookId='" + bookId + "';";
            MySqlCommand cmdupdateshelfid = new MySqlCommand(updateshelfid, OLMSDBConnection);
            int result1 = 0;
            result1 = cmdupdateshelfid.ExecuteNonQuery();
            if (result != 0 && result1!=0)
            {
                Response.Write("<script>alert('修改成功')</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('修改失败')</script>");
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
        //文件上传路径
        string filePath = this.FileUpload1.PostedFile.FileName;
        //获取文件名称
        string fileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
        //获取文件大小
        //string fileSize = Convert.ToString(FileUpload1.PostedFile.ContentLength);
        //获取文件扩展名
        //string fileExtend = filePath.Substring(filePath.LastIndexOf(".")+1);
        //获取文件类型
        //string fileType = FileUpload1.PostedFile.ContentType;

        if (this.FileUpload1.HasFile)
        {
            //转换成小写形式
            string fileExtension = System.IO.Path.GetExtension(this.FileUpload1.FileName).ToLower();
            string[] restricyExtension = { ".gif", ".jpg", ".bmp", ".png" };
            //判断文件是否符合要求
            for (int i = 0; i < restricyExtension.Length; i++)
            {
                if (fileExtension == restricyExtension[i])
                {
                    filesValid = true;

                }

            }
            //如果文件符合要求，调用SaveAS()方法上传，并显示相关信息
            if (filesValid == true)
            {
                //判断是否有该路径  
                string wantPath = Server.MapPath("~/Images/Cover/");
                if (!Directory.Exists(wantPath))
                {   //如果不存在就创建
                    Directory.CreateDirectory(wantPath);
                    this.FileUpload1.SaveAs(Server.MapPath("~/Images/Cover/") + fileName);
                    Image1.ImageUrl = "~/Images/Cover/" + fileName;
                    Response.Write("<script>alert('上传成功')</script>");
                }
                else
                {

                    this.FileUpload1.SaveAs(Server.MapPath("~/Images/Cover/") +
                    fileName);
                    Image1.ImageUrl = "~/Images/Cover/" + fileName;
                    Response.Write("<script>alert('上传成功')</script>");

                }

            }
            else
            {
                Response.Write("<script>alert('格式不正确')</script>");
                return;
            }
        }
    }
}