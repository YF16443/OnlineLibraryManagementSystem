using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AdminPages_SetOverdueFinePerDay : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit(object sender, EventArgs e)
    {
        string value = Deposit.Text;
        string key = "OverdueFinePerDay";
        string item = "appSettings";
        if (value == null || value == "")
        {
            value = ConfigurationManager.AppSettings.Get(key);
        }
        Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(System.Web.HttpContext.Current.Request.ApplicationPath);
        AppSettingsSection appSection = (AppSettingsSection)config.GetSection(item);
        if (appSection.Settings[key] == null)
        {
            appSection.Settings.Add(key, value);
            config.Save();
        }
        else
        {
            appSection.Settings.Remove(key);
            appSection.Settings.Add(key, value);
            config.Save();
        }
        Response.Write("<script>alert('" + Resources.Resource.Successful + "')</script>");
    }
    protected void Cancel(object sender, EventArgs e)
    {
        Response.Write("<script>alert('" + Resources.Resource.Failure + "')</script>");

    }
}