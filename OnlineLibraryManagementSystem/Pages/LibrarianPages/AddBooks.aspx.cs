using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Net;
using System.IO;

public partial class Pages_Addbooks_ISBN : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);

            OLMSDBConnection.Open();
            string select = "select ShelfId,StackId from Shelves";
            MySqlCommand cmdselectshelfid = new MySqlCommand(select, OLMSDBConnection);
            MySqlDataReader reader = cmdselectshelfid.ExecuteReader();
            while (reader.Read())
            {
                DropDownList1.Items.Add(reader["ShelfId"].ToString() + "," + reader["StackId"].ToString());
            }
            OLMSDBConnection.Close();
        }
    }

    protected void Addbooks(object sender, EventArgs e)
    {
        //扫描ISBN获得图书信息并添加
        string isbn = "";
        string isbnparttern = "^[0-9A-Z]{13}$";
        string quantityparttern = "^[1-9]\\d*$";
        string quantity = "";//新加书本数量
        if (TextBoxISBN.Text == ""||TextBoxISBN.Text.Trim().Length==0)
        {
            Response.Write("<script>alert('ISBN Is Null!')</script>");
            return;

        }
        else if (TextBoxISBN.Text.Trim().Length == 13 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxISBN.Text.Trim(), isbnparttern))
        {
            isbn = TextBoxISBN.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error ISBN! ')</script>");
            return;
        }
        if (TextBoxQuantity.Text == "" || TextBoxQuantity.Text.Trim().Length == 0)
        {
            Response.Write("<script>alert('Books\\' Quantity Is Null !')</script>");
            return;
        }
        else if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxQuantity.Text.Trim(), "^[0]\\d+$"))
        {
            quantity = TextBoxQuantity.Text.Trim().Substring(1,TextBoxQuantity.Text.Trim().Length-1);
        }
        else if (!System.Text.RegularExpressions.Regex.IsMatch(TextBoxQuantity.Text.Trim(), quantityparttern))
        {
            Response.Write("<script>alert('Books\\' Quantity Must Be the Positive Integer!')</script>");
            return;
        }
        else quantity = TextBoxQuantity.Text.Trim();
        //数据库连接
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //先检查数据库中是否存在该ISBN图书
        string selectIsbn = "select count(*) as num from Books where ISBN13 = '" + isbn + "'; ";
        int updateflag = 0;
        string[] shelf= DropDownList1.SelectedItem.Text.Split(',');//书架号
        string shelfid = shelf[0];
        string Bookid = "";//bookid
        string bookbarcode = "";//barcode码
        try
        { 
            OLMSDBConnection.Open();
            MySqlCommand cmdselectIsbn = new MySqlCommand(selectIsbn, OLMSDBConnection);
            MySqlDataReader readerisbn = cmdselectIsbn.ExecuteReader();
            while (readerisbn.Read())
            {
                if (readerisbn.HasRows)
                {
                    Int64 count = (Int64)readerisbn["num"];
                    if (count > 0)
                    {
                        updateflag = 1;
                    }
                    break;
                }
            }
            readerisbn.Close();
            int oldamount = 0;
            //如果书库中存在这本书，只更新书本数量
            if (updateflag == 1)
            {
                string selectoldamount = "select Amount,BookId from Books where ISBN13='" + isbn + "';";
                MySqlCommand cmdselectoldamount = new MySqlCommand(selectoldamount, OLMSDBConnection);
                MySqlDataReader readeroldamount = cmdselectoldamount.ExecuteReader();
                if (readeroldamount.Read())
                {
                    oldamount = int.Parse(readeroldamount["Amount"].ToString());
                    Bookid = readeroldamount["BookId"].ToString();
                }
                readeroldamount.Close();
                int newamount = oldamount + int.Parse(quantity);
                string updatebook = "update Books set Amount='" + newamount.ToString() + "' where ISBN13='" + isbn + "';";
                MySqlCommand cmdupate = new MySqlCommand(updatebook, OLMSDBConnection);
                int update = 0;
                update = cmdupate.ExecuteNonQuery();
                int updateresult = 0;
                for (int i = oldamount; i < newamount; i++)
                {
                    bookbarcode = Bookid.PadLeft(10, '0') + i.ToString().PadLeft(3, '0');
                    string insertBookBarcode = "insert into BookBarcodes(BookBarcode,BookId,ShelfId) " + "values('" + bookbarcode + "','" + Bookid + "','" + shelfid + "');";
                    MySqlCommand cmdinsertBookBarcode = new MySqlCommand(insertBookBarcode, OLMSDBConnection);
                    updateresult = cmdinsertBookBarcode.ExecuteNonQuery();
                }
                if (updateresult != 0 && update != 0)
                {
                    Response.Write("<script>alert('This Book Is Exist，Add " + quantity + " Books!\\nThe Amount Is Updated to " + newamount.ToString() + "!')</script>");
                    return;
                }
            }
            Book book;
            //通过api建立book对象
            if (BookInfoQuery.GetByISBN(isbn) != null)
            {
                book = BookInfoQuery.GetByISBN(isbn);
            }
            else
            {
                Response.Write("<script>alert('Not Found The Book!')</script>");
                return;
            }
            string pubdateparttern = "^[0-9]{4}-(0?[0-9]|1[0-2])-(0?[1-9]|[12]?[0-9]|3[01])$";
            string pubdate = "";
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxPubdate.Text.Trim(), pubdateparttern))
            {
                pubdate = TextBoxPubdate.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Error Pubdate!\\nPubdate Example:YYYY-XX-MM')</script>");
                return;
            }
            string float_priceparttern = "^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$";//正浮点数
            string integer_priceparttern = "^[1-9]\\d*$";//正整数
            string price = "";
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxPrice.Text.Trim(), float_priceparttern)||System.Text.RegularExpressions.Regex.IsMatch(TextBoxPrice.Text.Trim(),integer_priceparttern))
            {
                price = TextBoxPrice.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Error Price Format!')</script>");
                return;
            }
            string pagesparttern = "^[1-9]\\d*$";
            string pages = "";
            if (System.Text.RegularExpressions.Regex.IsMatch(TextBoxPages.Text.Trim(), pagesparttern))
            {
                pages = TextBoxPages.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Error Pages Format!')</script>");
                return;
            }
            string isbn13 = "";
            if (TextBoxISBN13.Text.Trim().Length == 13 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxISBN13.Text.Trim(), isbnparttern))
            {
                isbn13 = TextBoxISBN13.Text;
            }
            else
            {
                Response.Write("<script>alert('Error ISBN13!')</script>");
                return;
            }
            string isbn10 = "";
            string isbn10parttern = "^[0-9A-Z]{10}$";
            if (TextBoxISBN10.Text.Length == 10 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxISBN10.Text, isbn10parttern))
            {
                isbn10 = TextBoxISBN10.Text;
            }
            else
            {
                Response.Write("<script>alert('Error ISBN10!')</script>");
                return;
            }
            string title = "";
            if (TextBoxTitle.Text.Trim()!="")
            {
                title = TextBoxTitle.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Title Is Null!')</script>");
                return;
            }
            string author = "";
            if (TextBoxAuthor.Text.Trim()!= "")
            {
                author = TextBoxAuthor.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Author Is Null!')</script>");
                return;
            }
            string publisher = "";
            if (TextBoxPublisher.Text.Trim() != "")
            {
                publisher = TextBoxPublisher.Text.Trim();
            }
            else
            {
                Response.Write("<script>alert('Publisher Is Null!')</script>");
                return;
            }
            string ImageURLSave = Image1.ImageUrl;
            string translator = string.Join(",", book.translator.ToArray());
            //日期默认为1号
            List<string> tagsid = new List<string>();
            //向category表中插入该本书的关键字
            int flag = 0;
            foreach (tags tags in book.tags)
            {
                string selecttags = "select count(*) as num2 from BookCategories where Name='" + tags.title + "';";
                MySqlCommand cmdselecttags = new MySqlCommand(selecttags, OLMSDBConnection);
                MySqlDataReader readertags = cmdselecttags.ExecuteReader();
                while (readertags.Read())
                {
                    if (readertags.HasRows)
                    {
                        Int64 count = (Int64)readertags["num2"];
                        if (count == 0)
                        {
                            flag = 1;
                        }
                        break;
                    }
                }
                readertags.Close();
                if (flag == 1)
                {
                    string inserttags = "insert into BookCategories(Name) values('" + tags.title + "');";
                    MySqlCommand cmdinserttags = new MySqlCommand(inserttags, OLMSDBConnection);
                    int resulttags = 0;
                    resulttags = cmdinserttags.ExecuteNonQuery();
                    flag = 0;
                }
                string selecttagsid = "select CategoryId from BookCategories where Name='" + tags.title + "';";
                MySqlCommand cmdselecttagsid = new MySqlCommand(selecttagsid, OLMSDBConnection);
                MySqlDataReader readertagsid = cmdselecttagsid.ExecuteReader();
                if (readertagsid.Read())
                {
                    tagsid.Add(readertagsid["CategoryId"].ToString());
                }
                readertagsid.Close();
            }
            //将关键字转为关键字id存入，以逗号隔开即为categories，读取时需转换
            string categoryid = string.Join(",", tagsid.ToArray());
            //插入书
            string insertBook = "insert into Books(ISBN13,ISBN10,ImageURL,Title,SubTitle,OriginTitle,Author,Translator,Publisher,PubDate,Category,Binding,Pages,Price,Summary,AuthorIntro,Catalog,Amount) " + "values('" + isbn13 + "','" + isbn10 + "','" + ImageURLSave + "','" + title + "','" + book.subtitle + "','"+addslashes(book.origin_title)+"','" + author + "','" + translator + "','" + publisher + "','" + pubdate + "','" + categoryid + "','" + book.binding + "','" + pages + "','" + price + "','" + book.summary + "','" + book.author_intro + "','" + book.catalog + "','" + quantity + "')";
            MySqlCommand cmdinsertBook = new MySqlCommand(insertBook, OLMSDBConnection);
            int result1 = 0;
            result1 = cmdinsertBook.ExecuteNonQuery();
            //向barcode表中插入数据，先找到bookid
            string selectBookid = "select BookId from Books where ISBN13='" + isbn + "';";
            MySqlCommand cmdselectBookid = new MySqlCommand(selectBookid, OLMSDBConnection);
            MySqlDataReader reader2 = cmdselectBookid.ExecuteReader();
            if (reader2.Read())
            {
                Bookid = reader2["BookId"].ToString();
            }
            reader2.Close();
            int Quantity = int.Parse(quantity);
            int result2 = 0;
            for (int i = 0; i < Quantity; i++)
            {
                bookbarcode = Bookid.PadLeft(10, '0') + i.ToString().PadLeft(3, '0');
                string insertBookBarcode = "insert into BookBarcodes(BookBarcode,BookId,ShelfId) " + "values('" + bookbarcode + "','" + Bookid + "','" + shelfid + "');";
                MySqlCommand cmdinsertBookBarcode = new MySqlCommand(insertBookBarcode, OLMSDBConnection);
                result2 = cmdinsertBookBarcode.ExecuteNonQuery();
            }
            string selectamount = "select Amount from Books where ISBN13='" + isbn + "';";
            MySqlCommand cmdselectamount = new MySqlCommand(selectamount, OLMSDBConnection);
            MySqlDataReader readeramount = cmdselectamount.ExecuteReader();
            string amount = "";
            if (readeramount.Read())
            {
                amount = readeramount["Amount"].ToString();
            }
            readeramount.Close();
            if ((result1 != 0) && (result2 != 0))
            {
                Response.Write("<script>alert('Add Book Successfully!\\nThe Amount Is" + amount + "!')</script>");
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

    public static string SaveImageFromWeb(string Url, string path, string fileName)
    {
        //下载图片
        if (path.Equals(""))
        {
            throw new Exception("Not Found The Path!");
        }
        string imgName = Url.ToString().Substring(Url.ToString().LastIndexOf("/") + 1);
        string imgType = ".jpg";
        string imgPath = "";
        //获取文件数组
        byte[] b;
        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(Url);
        WebResponse myResp = myReq.GetResponse();

        Stream stream = myResp.GetResponseStream();
        using (BinaryReader br = new BinaryReader(stream))
        {
            b = br.ReadBytes(500000);
            br.Close();
        }
        myResp.Close();
        //写入文件夹
        FileStream fs = new FileStream(path + fileName + imgType, FileMode.Create);
        BinaryWriter w = new BinaryWriter(fs);
        try
        {
            w.Write(b);
        }
        finally
        {
            fs.Close();
            w.Close();
        }
        //返回图片路径
        imgPath = path + fileName + imgType;
        return imgPath;
    }
    protected void Print_Barcode(object sender, EventArgs e)
    {
        //打印条形码，待组长更改
        string isbn = "";
        if (TextBoxISBN.Text.Trim() == "")
        {
            Response.Write("<script>alert('ISBN Is Null!')</script>");
        }
        else isbn = TextBoxISBN.Text;
        Book book = BookInfoQuery.GetByISBN(isbn);

        //Barcode generation test
        if (book != null)
        {
            var barcodeImage = MyBarcodeGenerator.Generate(book.isbn10) as System.Drawing.Image;
            MyBarcodeGenerator.ShowBarcode(book.isbn13, this.Response);
        }
        else
        {
            Response.Write("Book Not Found!");
        }
    }
    protected string addslashes(string str)
    {
        //处理单引号
        //待修改
        string newstr=str.Replace("\'","\\\'");
        return newstr;
    }
    protected void Cancel(object sender, EventArgs e)
    {
        //返回上一页面
    }


    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        string isbnparttern = "^[0-9A-Z]{13}$";
        string isbn = "";
        if (TextBoxISBN.Text.Trim().Length == 13 && System.Text.RegularExpressions.Regex.IsMatch(TextBoxISBN.Text.Trim(), isbnparttern))
        {
            isbn = TextBoxISBN.Text.Trim();
        }
        else
        {
            Response.Write("<script>alert('Error ISBN!')</script>");
            return;
        }
        Book book;
        //通过api建立book对象
        if (BookInfoQuery.GetByISBN(isbn) != null)
        {
            book = BookInfoQuery.GetByISBN(isbn);
        }
        else
        {
            Response.Write("<script>alert('Not Found The Book!')</script>");
            return;
        }
        string path = HttpRuntime.AppDomainAppPath.ToString() + "Images\\Cover\\";
        string ImageURL = SaveImageFromWeb(book.image, path, book.title);
        string ImageURLSave = "~/Images/Cover/" + book.title + ".jpg";
        Image1.ImageUrl = ImageURLSave;
        TextBoxTitle.Text = book.title;
        TextBoxAuthor.Text= string.Join(",", book.author.ToArray());
        TextBoxPubdate.Text= book.pubdate + "-01";
        TextBoxPrice.Text= book.price.Substring(0, book.price.Length - 1);
        TextBoxISBN13.Text = book.isbn13;
        TextBoxISBN10.Text = book.isbn10;
        TextBoxPages.Text = book.pages;
        TextBoxPublisher.Text = book.publisher;
    }

    protected void ButtonUpload_Click(object sender, EventArgs e)
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
                    Response.Write("<script>alert('Upload Successfully!')</script>");
                }
                else
                {

                    this.FileUpload1.SaveAs(Server.MapPath("~/Images/Cover/") +
                    fileName);
                    Image1.ImageUrl = "~/Images/Cover/" + fileName;
                    Response.Write("<script>alert('Upload Successfully!')</script>");

                }

            }
            else
            {
                Response.Write("<script>alert('Error Format!')</script>");
                return;
            }
        }
    }
}