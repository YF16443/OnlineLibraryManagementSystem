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

public partial class Pages_Addbooks_ISBN : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Addbooks(object sender, EventArgs e)
    {
        //扫描ISBN获得图书信息并添加
        string isbn = "";
        string quantity = "";
        if (TextBoxISBN.Text == "")
        {
            Response.Write("<script>alert('ISBN不为空')</script>");
        }
        else isbn = TextBoxISBN.Text;
        if (TextBoxQuantity.Text == "")
        {
            Response.Write("<script>alert('书本数量不为空')</script>");
        }
        else if (int.Parse(TextBoxQuantity.Text) <= 0)
        {
            Response.Write("<script>alert('书本数量必须大于0')</script>");
        }
        else quantity = TextBoxQuantity.Text;
        //数据库连接
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //先检查数据库中是否存在该ISBN图书
        string selectIsbn = "select count(*) as num from Books where ISBN13 = '" + isbn + "'; ";
        try
        {
            OLMSDBConnection.Open();
            MySqlCommand cmdselectIsbn = new MySqlCommand(selectIsbn, OLMSDBConnection);
            MySqlDataReader reader = cmdselectIsbn.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Int64 count = (Int64)reader["num"];
                    if (count > 0)
                    {
                        Response.Write("<script>alert('该书本已经存在');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();
            //通过api建立book对象
            Book book = BookInfoQuery.GetByISBN(isbn);
            string path = HttpRuntime.AppDomainAppPath.ToString() + "Images\\Cover\\";
            string ImageURL = SaveImageFromWeb(book.image, path, book.title);
            string[] turnurl = ImageURL.Split('\\');
            string URL = string.Join("\\\\", turnurl);
            string author = string.Join(",", book.author.ToArray());
            string translator = string.Join(",", book.translator.ToArray());
            string price = book.price.Substring(0, book.price.Length - 1);
            //日期默认为1号
            string pubdate = book.pubdate + "-1";
            string insertBook = "insert into Books(ISBN13,ISBN10,Title,SubTitle,Author,Pubdate,OriginTitle,ImageURL,Binding,Translator,Catalog,Pages,Publisher,AuthorIntro,Summary,Price) " + "values('" + book.isbn13 + "','" + book.isbn10 + "','" + book.title + "','" + book.subtitle + "','" + author + "','" + pubdate + "','" + book.origin_title + "','" + URL + "','" + book.binding + "','" + translator + "','" + book.catalog + "','" + book.pages + "','" + book.publisher + "','" + book.author_intro + "','" + book.summary + "','" + price + "')";
            MySqlCommand cmdinsertBook = new MySqlCommand(insertBook, OLMSDBConnection);
            int result1 = 0;
            result1 = cmdinsertBook.ExecuteNonQuery();
            //向barcode表中插入数据
            string Bookid = "";
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
            string nowdate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string insertBookBarcode = "insert into BookBarcodes(BookId,ShelfId,Timestamp) " + "values('" + Bookid + "','1','" + nowdate + "');";
            MySqlCommand cmdinsertBookBarcode = new MySqlCommand(insertBookBarcode, OLMSDBConnection);
            for (int i = 0; i < Quantity; i++)
            {
                result2 = cmdinsertBookBarcode.ExecuteNonQuery();
            }
            if ((result1 != 0) && (result2 != 0))
            {
                Response.Write("<script>alert('添加书本成功')</script>");
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
            throw new Exception("未指定保存文件的路径");
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
        if (TextBoxISBN.Text == "")
        {
            Response.Write("<script>alert('ISBN不为空')</script>");
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
            Response.Write("Book Not Found");
        }
    }

    protected void Cancel(object sender, EventArgs e)
    {
        //返回上一页面
    }
}