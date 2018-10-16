using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// 通过key,获取appSetting的值
/// </summary>
public class GetWebConfigValue
{
    public static string GetWebConfigValueByKey(string key)
    {
        string value = string.Empty;
        Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
        AppSettingsSection appSetting = (AppSettingsSection)config.GetSection("appSettings");
        if (appSetting.Settings[key] != null)//如果不存在此节点，则添加 
        {
            value = appSetting.Settings[key].Value;
        }
        config = null;
        return value;
    }
}