using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_LibrarianPages_AddNotice : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Add_Click(object sender, EventArgs e)
    {
        if (!rfvId.IsValid || !rfvDetails.IsValid)
        {
            return;
        }
        int id = int.Parse(txtnoticeid.Text);
        string details = txtdetails.Text;

        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        MySqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "select * from Notices where NoticeId=@i";
        MySqlParameter param;
        param = new MySqlParameter("@i", id);
        cmd.Parameters.Add(param);
        object res = cmd.ExecuteScalar();
        if (res != null)
        {
            Response.Write("<script>alert('" + Resources.Resource.NoticeIdExist + "')</script>");
            return;
        }
        cmd.CommandText = "insert into Notices(NoticeId,Details) values(@n,@d);";
        param = new MySqlParameter("@n", id);
        cmd.Parameters.Add(param);
        param = new MySqlParameter("@d", details);
        cmd.Parameters.Add(param);
        int result = cmd.ExecuteNonQuery();
        if (result == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.Successful + "');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "", "window.alert('" + Resources.Resource.Failure + "');", true);
        }
    }
}