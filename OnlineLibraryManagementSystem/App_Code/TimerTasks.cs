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
        timer.Elapsed += new System.Timers.ElapsedEventHandler(Task_Email);
        timer.Elapsed += new System.Timers.ElapsedEventHandler(Task_Email);
    }
    static void Task_Email(object sender, EventArgs e)
    {
        int overdueDuration = int.Parse(GetWebConfigValue.GetWebConfigValueByKey("OverdueDuration"));
        //暂时默认提醒时间为7天
        TimeSpan notice_time = TimeSpan.FromDays(7);
        //暂时默认逾期时间为10天
        TimeSpan overdue_time = TimeSpan.FromDays(overdueDuration);
        DateTime time_now = DateTime.Now;

        string OLMSDBConnectionString = ConfigurationManager.ConnectionStrings["OLMSDB"].ConnectionString;
        MySqlConnection conn = new MySqlConnection(OLMSDBConnectionString);
        conn.Open();
        try
        {
            string querySql = "SELECT * FROM IssueRecords WHERE " +
                            "ReturnTime is null ORDER BY IssueTime ASC";
            MySqlCommand queryCmd = new MySqlCommand(querySql, conn);
            MySqlDataReader reader = queryCmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.HasRows)
                {
                    //emailNoticeStatus表示已经向该订单用户发送邮件的数量
                    int emailNoticeStatus = (int)reader["EmailNoticeStatus"];
                    int returnStatus = (int)reader["Status"];
                    DateTime time_notice = (DateTime)reader["IssueTime"] + notice_time;
                    DateTime time_overdue = (DateTime)reader["IssueTime"] + overdue_time;
                    //DateTime.Compare前一个时间早于后一个时间时返回结果小于0
                    if (emailNoticeStatus < 2 && DateTime.Compare(time_notice, time_now) < 0)
                    {
                        //System.Diagnostics.Debug.WriteLine(time_overdue);
                        MySqlConnection conn2 = new MySqlConnection(OLMSDBConnectionString);
                        conn2.Open();
                        string queryReaderEmailSql = "SELECT Email FROM Readers WHERE ReaderId = " +
                            reader["ReaderId"];
                        MySqlCommand emailCmd = new MySqlCommand(queryReaderEmailSql, conn2);
                        MySqlDataReader reader2 = emailCmd.ExecuteReader();
                        reader2.Read();
                        String emailReceiver = null;
                        if (reader2.HasRows)
                            emailReceiver = (string)reader2["Email"];
                        reader2.Close();
                        //发送提醒邮件
                        if (emailNoticeStatus == 0)
                        {
                            SendEmail.Send(emailReceiver, "OnlineLibraryManagement书籍即将逾期提醒",
                            "尊敬的用户，您在本馆所借书籍还有3天将逾期，请尽快归还，谢谢合作！");
                        }
                        // 发送逾期邮件
                        else if (emailNoticeStatus == 1 && DateTime.Compare(time_overdue, time_now) < 0)
                        {
                            SendEmail.Send(emailReceiver, "OnlineLibraryManagement书籍逾期提醒",
                            "尊敬的用户，您在本馆所借书籍已经逾期未归还，请尽快归还，谢谢合作！");
                        }
                        string updateEmailStatusSql = "UPDATE IssueRecords SET EmailNoticeStatus = "
                            + (emailNoticeStatus + 1) + " WHERE (RecordId = "+ reader["RecordId"] + ");";
                        MySqlCommand cmd2 = new MySqlCommand(updateEmailStatusSql, conn2);
                        cmd2.ExecuteReader();
                        conn2.Close();
                    }
                    if (DateTime.Compare(time_overdue, time_now) < 0 && (returnStatus == 0 || returnStatus == 3)) 
                    {
                        MySqlConnection conn2 = new MySqlConnection(OLMSDBConnectionString);
                        conn2.Open();

                    }
                }
            }
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }
}