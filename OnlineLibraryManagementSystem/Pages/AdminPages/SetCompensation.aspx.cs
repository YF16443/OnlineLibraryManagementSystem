using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AdminPages_SetCompensation : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit(object sender, EventArgs e)
    {
        string value1 = DamageFineRate.Text;
        string key1 = "DamageFineRate";
        string value2 = LostFineRate.Text;
        string key2 = "LostFineRate";
        string item = "appSettings";
        if (value1 == null || value1 == "")
        {
            value1 = ConfigurationManager.AppSettings.Get(key1);
        }
        if (value2 == null || value2 == "")
        {
            value2 = ConfigurationManager.AppSettings.Get(key2);
        }
        Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(System.Web.HttpContext.Current.Request.ApplicationPath);
        AppSettingsSection appSection = (AppSettingsSection)config.GetSection(item);
        if (appSection.Settings[key1] == null)
        {
            appSection.Settings.Add(key1, value1);
        }
        else
        {
            appSection.Settings.Remove(key1);
            appSection.Settings.Add(key1, value1);
        }
        if (appSection.Settings[key2] == null)
        {
            appSection.Settings.Add(key2, value2);
        }
        else
        {
            appSection.Settings.Remove(key2);
            appSection.Settings.Add(key2, value2);
        }
        config.Save();
        Response.Write("<script>alert('" + Resources.Resource.Successful + "')</script>");
    }
    protected void Cancel(object sender, EventArgs e)
    {
        Response.Write("<script>alert('" + Resources.Resource.Failure + "')</script>");

    }
}