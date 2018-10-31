﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_AdminPages_Settings : BasePage
{
    string DamageKey = "DamageFineRate";
    string depositKey = "Deposit";
    string LostKey = "LostFineRate";
    string MaximumKey = "MaximumIssue";
    string OverdueFinePerDayKey = "OverdueFinePerDay";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Deposit.Text = getValue(depositKey);
            DamageFineRate.Text = getValue(DamageKey);
            LostFineRate.Text = getValue(LostKey);
            MaximumIssue.Text = getValue(MaximumKey);
            OverdueFinePerDay.Text = getValue(OverdueFinePerDayKey);

        }
    }
    protected void Submit(object sender, EventArgs e)
    {

        string item = "appSettings";
        Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(System.Web.HttpContext.Current.Request.ApplicationPath);
        AppSettingsSection appSection = (AppSettingsSection)config.GetSection(item);
        string depositValue = Deposit.Text;
        setValue(appSection, depositKey, depositValue);
        string DamageValue = DamageFineRate.Text;
        setValue(appSection, DamageKey, DamageValue);
        string LostValue = LostFineRate.Text;
        setValue(appSection, LostKey, LostValue);
        string MaximunValue = MaximumIssue.Text;
        setValue(appSection, MaximumKey, MaximunValue);
        string OverdueFinePerDayValue = OverdueFinePerDay.Text;
        setValue(appSection, OverdueFinePerDayKey, OverdueFinePerDayValue);
        config.Save();
        Response.Write("<script>alert('" + Resources.Resource.Successful + "')</script>");
    }
    protected void Cancel(object sender, EventArgs e)
    {
        Response.Write("<script>alert('" + Resources.Resource.Failure + "')</script>");
    }
    private string getValue(string key)
    {
        try
        {
            return ConfigurationManager.AppSettings.Get(key);
        }
        catch
        {
            return "";
        }
    }
    private void setValue(AppSettingsSection appSection, string key, string value)
    {
        if (value == null || value == "")
        {
            value = ConfigurationManager.AppSettings.Get(key);
        }
        if (appSection.Settings[key] == null)
        {
            appSection.Settings.Add(key, value);
        }
        else
        {
            appSection.Settings.Remove(key);
            appSection.Settings.Add(key, value);
        }
    }
}