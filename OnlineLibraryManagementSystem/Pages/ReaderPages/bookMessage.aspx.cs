﻿using System;
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

public partial class Pages_bookMessage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
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
                    title.Text =   reader["Title"].ToString();
                    author.Text =  reader["Author"].ToString();
                    pubDate.Text = Convert.ToDateTime(reader["PubDate"]).ToString("yyyy-MM-dd");
                    price.Text =   reader["Price"].ToString();
                    isbn13.Text = reader["ISBN13"].ToString();
                    isbn10.Text = reader["ISBN10"].ToString();
                    subtitle.Text = reader["SubTitle"].ToString();
                    origintitle.Text = reader["OriginTitle"].ToString();
                    binding.Text = reader["Binding"].ToString();
                    translator.Text = reader["Translator"].ToString();
                    catalog.Text = reader["Catalog"].ToString();
                    pages.Text = reader["Pages"].ToString();
                    publisher.Text = reader["Publisher"].ToString();
                    break;
                }
            }

            reader.Close();



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

    protected void reserve_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty((string)Session["id"]))
        {
            //未登录时提示登录
            Response.Write("<script type='text/javascript'>alert('" + Resources.Resource.LogInNotice + "');location.href='../ReaderLogin.aspx';</script>");
        }
        string bookId = Request["book_id"];
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection OLMSDBConnection = new MySqlConnection(OLMSDBConnectionString);
        try
        {
            string book_sql1 = "select * from BookBarcodes where BookId=" + bookId;
            OLMSDBConnection.Open();
            MySqlCommand cmd1 = new MySqlCommand(book_sql1, OLMSDBConnection);
            ArrayList bookList = new ArrayList();
            MySqlDataReader bookReader = cmd1.ExecuteReader();
            Boolean bookAva = false;
            string reserveBarcode = null;
            while(bookReader.Read()&&!bookAva)
            {
                if(bookReader.HasRows)
                {
                    //有可预约图书
                    if((int)bookReader["Status"]==0)
                    {
                        bookAva = true;
                        reserveBarcode = bookReader["BookBarcode"].ToString();
                    }

                }

            }
            bookReader.Close();
            //库存不足
            if(!bookAva)
            {
                Response.Write("<script>alert('" + Resources.Resource.Reservation_Fail + "')</script>");
                return;
            }
            else
            {
                string reservingTime = DateTime.Now.ToString();
                int reservingReaderId = 0;
                if (Session["id"] != null)
                {
                    string readerId = Session["id"].ToString();
                    reservingReaderId = int.Parse(readerId);

                }
                System.Diagnostics.Debug.Write(reservingReaderId);
                string reserve_sql = "update BookBarcodes set Status=2, ReservingTime=?reservingtime,ReservingReaderId=?reservingreaderid where BookBarcode=?bookbarcode";
                MySqlCommand cmd2 = new MySqlCommand(reserve_sql, OLMSDBConnection);
                cmd2.Parameters.AddWithValue("?reservingtime", reservingTime);
                cmd2.Parameters.AddWithValue("?reservingreaderid", reservingReaderId);
                cmd2.Parameters.AddWithValue("?bookbarcode", reserveBarcode);
                int result = cmd2.ExecuteNonQuery();
                if (result == 1)
                {
                    Response.Write("<script>alert('" + Resources.Resource.Reservation_Success + "')</script>");
                }
                else
                {
                    Response.Write("<script>alert('" + Resources.Resource.Reservation_Fail + "')</script>");
                }
            }
        }
        catch(MySqlException ex)
        {
            System.Diagnostics.Debug.Write(ex.Message);
        }
        finally
        {
            OLMSDBConnection.Close();
        }
    }
}
