using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AdminLogin : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        var loginView = Master.FindControl("LoginView") as LoginView;
        if (loginView != null)
        {
            loginView.Visible = false;
        }
    }
}