using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;

public partial class Pages_MasterPage : BaseMasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlLanguages.SelectedValue = Session["PreferredCulture"].ToString();
        }
        //ShowAccount.Text = (string)Session["id"];
    }

    protected void lbSignOut_Click(object sender, EventArgs e)
    {
        Session["id"] = null;
        Response.Redirect("~/Pages/Login.aspx");
    }

    protected void ddlLanguages_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["PreferredCulture"] = ddlLanguages.SelectedValue.ToString();
        Response.Redirect(Request.Url.ToString());
    }
}
