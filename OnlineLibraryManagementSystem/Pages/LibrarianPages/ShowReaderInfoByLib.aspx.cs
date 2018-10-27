using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ShowReaderInfo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! IsPostBack)
        {

            string account = Request["ReaderId"];
            if (account == null)
            {
                //exception-handler
                return;
            }
            //Database connection test
            string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
            MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
            string selectReaderSql = "select * from Readers where ReaderId = ?account;";
            
            try
            {
                OLMSDBConnection.Open();
                MySqlCommand cmd = new MySqlCommand(selectReaderSql, OLMSDBConnection);
                cmd.Parameters.AddWithValue("?account", account);
                MySqlDataReader reader = cmd.ExecuteReader();
                string id="" ;
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        TextBoxEmail.Text = reader["Email"].ToString();
                        TextBoxAccount.Text = reader["ReaderId"].ToString();
                        TextBoxName.Text = reader["Name"].ToString();
                        TextBoxPhone.Text = reader["Phone"].ToString();
                        // string idNumber = reader["idNumber"].ToString();
                        //idNumber = "XXXXXXXXXXXXXX" + idNumber.Substring(idNumber.Length - 4);
                        //TextBoxIDNumber.Text = idNumber;
                        TextBoxIDNumber.Text = reader["idNumber"].ToString();
                        TextBoxPassword.Text = reader["Password"].ToString();
                        id = reader["ReaderId"].ToString();
                        break;
                    }
                }
                reader.Close();
                string selectBookSql = "select IssueTime, ReturnTime,Title,IssueRecords.Status,IssueRecords.Fine,IssueRecords.OverdueLength " +
                                       "from  IssueRecords, BookBarcodes, Books " +
                                       "where  BookBarcodes.BookBarcode =   IssueRecords.BookBarcode and  BookBarcodes.BookId = Books.BookId " +
                                       "and IssueRecords.ReaderId = ?reader_id;";
            MySqlCommand cmd2 = new MySqlCommand(selectBookSql, OLMSDBConnection);
                cmd2.Parameters.AddWithValue("?reader_id", id);
                ArrayList issueRecords = new ArrayList();
                MySqlDataReader reader2 = cmd2.ExecuteReader();
                while (reader2.Read())
                {
                    if (reader2.HasRows)
                    {
                        Record r = new Record();
                        r.title = reader2["Title"].ToString();
                        DateTime issueTime = (DateTime)reader2["IssueTime"];
                        DateTime returnTime=DateTime.Now;
                        if (reader2["ReturnTime"] == null)
                        {
                            r.returnTime = "";  
                        }
                        else
                        {
                            try
                            {
                                returnTime = (DateTime)reader2["ReturnTime"];
                                r.returnTime = returnTime.ToString("yyyy-MM-dd");
                            }
                            catch (Exception ex)
                            {
                                returnTime = DateTime.Now;
                                r.returnTime = "";
                            }

                    }
                    if (reader2["Fine"] == null) { r.fine = ""; }
                    else { r.fine = reader2["Fine"].ToString(); }
                    if (reader2["OverdueLength"] == null) { r.overdueTime = ""; }
                    else {r.overdueTime = reader2["OverdueLength"].ToString();}

                    r.status = reader2["Status"].ToString();
                    r.issueTime = issueTime.ToString("yyyy-MM-dd");
                    issueRecords.Add(r);
                    }
                }
                Repeater1.DataSource = issueRecords;
                Repeater1.DataBind();
            }
            catch(MySqlException ex)
            {
                //exception-handler
                Console.WriteLine(ex.Message);
            }
            finally
            {
                OLMSDBConnection.Close();
            }
        }
    }

    protected void Submit(object sender, EventArgs e)
    {
        string name, readerId, password, idNumber, phone, email;
        readerId = TextBoxAccount.Text;
        if (TextBoxName.Text == "")
        {
            Response.Write("<script>window.alert('User name can not be empty!');</script>");
            return;
        }
        else
        {
            name = TextBoxName.Text;
        }
        if (TextBoxPhone.Text == "")
        {
            Response.Write("<script>window.alert('Phone can not be empty!');</script>");
            return;
        }
        else
        {
            phone = TextBoxPhone.Text;
           //Response.Write(phone);
            //这里应该有正则匹配去除非法输入防止篡改数据库
        }
        if (TextBoxIDNumber.Text == "")
        {
            Response.Write("<script>window.alert('IDNumber can not be empty!');</script>");
            return;
        }
        else
        {
            //后期补上正则匹配
            idNumber = TextBoxIDNumber.Text;
            if (idNumber.Length != 18)
            {
                Response.Write("<script>window.alert('The ID number is not in the right format!');</script>");
                return;
            }
        }
        if (TextBoxPassword.Text == "")
        {
            Response.Write("<script>window.alert('Password can not be empty!');</script>");
            return;
        }
        else
        {
            password = TextBoxPassword.Text;
         
        }

        email = TextBoxEmail.Text;
        
        //链接数据库
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        //检测同账号是否注册过
        string selectReaderSql = "select count(*) as num from Readers where ReaderId !=?readerId and (Phone = ?phone or IdNumber =?idNumber);";
       // string selectReaderSql = "select count(*) as num from Readers where ReaderId !="+readerId+"and (Phone = "+phone +"or IdNumber = "+idNumber+");";
        string insertReaderSql = "UPDATE  Readers SET Phone=?phone,Name=?name,IdNumber=?idNumber,Email=?email,Password=?password where ReaderId=?readerId ";
       // string insertReaderSql = "UPDATE  Readers SET Phone=" + phone + ",Name=" + name + ",IdNumber=" + idNumber + ",Email=" + email + ",Password=" + password + " where ReaderId=" + readerId;
        
        try
        {
           OLMSDBConnection.Open();
            MySqlCommand cmd2 = new MySqlCommand(selectReaderSql, OLMSDBConnection);
            cmd2.Parameters.AddWithValue("?readerId",readerId );
            cmd2.Parameters.AddWithValue("?phone", phone);
            cmd2.Parameters.AddWithValue("?idNumber", idNumber);
            MySqlDataReader reader = cmd2.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Int64 count = (Int64)reader["num"];
                    if (count > 0)
                    {
                        Response.Write("<script>window.alert('Account already exists or IDNumber is wrong!');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();

            MySqlCommand cmd = new MySqlCommand(insertReaderSql, OLMSDBConnection);
            cmd.Parameters.AddWithValue("?readerId", readerId);
            cmd.Parameters.AddWithValue("?phone", phone);
            cmd.Parameters.AddWithValue("?name", name);
            cmd.Parameters.AddWithValue("?password", password);
            cmd.Parameters.AddWithValue("?idNumber", idNumber);
            cmd.Parameters.AddWithValue("?email", email);
           // Response.Write(insertReaderSql);
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                Response.Write("<script>window.alert('Modification is successful!');</script>");
                return;
            }
            else
            {
                Response.Write("<script>window.alert('Failed');</script>");
                //Response.Redirect()
                return;
            }

        }
        catch (MySqlException ex)
        {
            //Console.WriteLine(ex.Message);
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            OLMSDBConnection.Close();
        }

    }

    protected void Delete(object sender, EventArgs e)
    {
        string readerId = TextBoxAccount.Text;
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        string selectReaderSql = "select count(*) as num from IssueRecords where ReaderId =?readerId and Status=3;";
        string selectReaderSql1 = "select Status  from Readers where ReaderId =?readerId ";
        string deleteReaderSql = "DELETE  FROM Readers  where ReaderId=?readerId ";
        try
        {
            OLMSDBConnection.Open(); 
            MySqlCommand cmd2 = new MySqlCommand(selectReaderSql, OLMSDBConnection);
            cmd2.Parameters.AddWithValue("?readerId", readerId);
            MySqlDataReader reader = cmd2.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    Int64 count = (Int64)reader["num"];
                    if (count > 0)
                    {
                        Response.Write("<script>window.alert('Please return the book first!');</script>");
                        return;
                    }
                    break;
                }
            }
            reader.Close();
            MySqlCommand cmd3 = new MySqlCommand(selectReaderSql1, OLMSDBConnection);
            cmd3.Parameters.AddWithValue("?readerId", readerId);
            MySqlDataReader reader1 = cmd3.ExecuteReader();
            while (reader1.Read())
            {
                if (reader1.HasRows)
                {
                    
                    if (reader1["Status"].ToString() == "1")
                    {
                        Response.Write("<script>window.alert('Please pay the fine first!');</script>");
                        return;
                    }
                    break;
                }
            }
            reader1.Close();

            MySqlCommand cmd = new MySqlCommand(deleteReaderSql, OLMSDBConnection);
            cmd.Parameters.AddWithValue("?readerId", readerId);
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                Response.Write("<script>window.alert(' The removal completed successfully!');</script>");
                return;
            }
            else
            {
                Response.Write("<script>window.alert('Failed');</script>");
                //Response.Redirect()
                return;
            }

        }
        catch (MySqlException ex)
        {
            //Console.WriteLine(ex.Message);
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            OLMSDBConnection.Close();
        }


    }

    protected void Cancel(object sender, EventArgs e)
    {
        //返回上一个页面  Response.Redirect()
        return;
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void Repeater1_ItemCommand2(object source, RepeaterCommandEventArgs e)
    {

    }
   
    public class Record
    {
        public string title { get; set; }
        public string issueTime { get; set; }
        public string returnTime { get; set; }
        public string overdueTime { get; set; }
        public string status { get; set; }
        public string fine { get; set; }
    }



    protected void TextBoxPhone_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBoxName_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBoxIDNumber_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBoxEmail_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBoxPassword_TextChanged(object sender, EventArgs e)
    {

    }
}
