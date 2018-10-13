using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// 定时器任务，主要包括定时短信提醒和清理过期预定
/// </summary>
public class TimerTasks
{
    public static void Task()
    {
        System.Timers.Timer timer = new System.Timers.Timer(10000)
        {
            //AutoReset 属性为 true 时，每隔指定时间循环一次
            //如果为 false，则只执行一次
            AutoReset = true,
            Enabled = true
        };
        timer.Elapsed += new System.Timers.ElapsedEventHandler(Task_do);
    }
    static void Task_do(object sender, EventArgs e)
    {
        //暂时默认逾期时间为1天
        TimeSpan overdue_time = TimeSpan.FromDays(1);
        DateTime time_now = DateTime.Now;
        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        try
        {
            string querySql = "SELECT RecordId, IssueTime FROM IssueRecords WHERE " +
                            "ReturnTime is null ORDER BY IssueTime ASC";
            MySqlCommand cmd = new MySqlCommand(querySql, conn);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    
                }
            }
        }
        finally
        {
            conn.Close();
        }
    }
}