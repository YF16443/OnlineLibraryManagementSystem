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
            MySqlCommand cmdselectBookid = new MySqlCommand(select, OLMSDBConnection);
            MySqlDataReader reader = cmdselectBookid.ExecuteReader();
            while (reader.Read())
            {
                DropDownList1.Items.Add(reader["ShelfId"].ToString() + "," + reader["StackId"].ToString());
            }
            OLMSDBConnection.Close();
        }
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Help.LibrarianMenuInit(this, sender, e);
    }

    protected void Addbooks(object sender, EventArgs e)
    {
        //扫描ISBN获得图书信息并添加
        string isbn = "";
        string quantity = "";//新加书本数量
        if (TextBoxISBN.Text == "")
        {
            Response.Write("<script>alert('ISBN不为空')</script>");
            return;

        }
        else if (TextBoxISBN.Text.Length != 13)
        {
            Response.Write("<script>alert('ISBN格式不正确')</script>");
            return;
        }
        else isbn = TextBoxISBN.Text;
        if (TextBoxQuantity.Text == "")
        {
            Response.Write("<script>alert('书本数量不为空')</script>");
            return;
        }
        else if (int.Parse(TextBoxQuantity.Text) <= 0)
        {
            Response.Write("<script>alert('书本数量必须大于0')</script>");
            return;
        }
        else quantity = TextBoxQuantity.Text;
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
                int newamount = oldamount + int.Parse(TextBoxQuantity.Text);
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
                    Response.Write("<script>alert('该书本已存在，书本数量增加" + TextBoxQuantity.Text + "本，更新为" + newamount.ToString() + "本')</script>");
                    return;
                }
            }
            //通过api建立book对象
            Book book = BookInfoQuery.GetByISBN(isbn);
            string path = HttpRuntime.AppDomainAppPath.ToString() + "Images\\Cover\\";
            string ImageURL = SaveImageFromWeb(book.image, path, book.title);
            string author = string.Join(",", book.author.ToArray());
            string translator = string.Join(",", book.translator.ToArray());
            string price = book.price.Substring(0, book.price.Length - 1);
            string ImageURLSave = "~/Images/Cover/" + book.title + ".jpg";
            //日期默认为1号
            string pubdate = book.pubdate + "-1";
            string timestamp = DateTime.Now.ToString("yyyy-MM-dd");
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
            string insertBook = "insert into Books(ISBN13,ISBN10,ImageURL,Title,SubTitle,OriginTitle,Author,Translator,Publisher,PubDate,Category,Binding,Pages,Price,Summary,AuthorIntro,Catalog,Amount,Timestamp) " + "values('" + book.isbn13 + "','" + book.isbn10 + "','" + ImageURLSave + "','" + book.title + "','" + book.subtitle + "','" + book.origin_title + "','" + author + "','" + translator + "','" + book.publisher + "','" + pubdate + "','" + categoryid + "','" + book.binding + "','" + book.pages + "','" + price + "','" + book.summary + "','" + book.author_intro + "','" + book.catalog + "','" + quantity + "','" + timestamp + "')";
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
                Response.Write("<script>alert('添加书本成功,该书本数量目前为" + amount + "')</script>");
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