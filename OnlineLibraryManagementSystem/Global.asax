<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition {
            Path = "~/scripts/jquery-3.0.0.min.js", DebugPath = "~/scripts/jquery-3.0.0.js",
            CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.0.0.min.js", CdnDebugPath =
        "http://ajax.microsoft.com/ajax/jQuery/jquery-3.0.0.js" });
        
        //SendEmail.Send("spm_a4@163.com", "测试邮件", "本餐厅经理对搞餐厅是个外行，不能够做到对餐厅的有效管理。我调查过，透过和他们的深入交谈均反映领导的无能。工程餐厅能有此刻的成绩，很大一部分是那些有职责心的老员工的功劳，而让他们尽心尽力工作的原因是他们出于对工作负职责的态度。我跟保洁组、大厨、择菜洗菜阿姨、售饭阿姨聊天的时候他们主动给我透露了经理无能与不会管理。我个人的看法是这样的：经理是有心无力。他想做好，但是不明白该怎样做。另外在意识形态上也对自己的工作不重视。作为餐厅的领导，自己进售饭柜台的时候经常不穿工衣，不戴工帽，在高峰期的时候，经常也能够看到他在各售饭窗口忙来忙去的。想做又不明白怎样做，所以只能在这上面出点力。我觉得这是瞎忙，忙的不是地方。该做的不做，紧要的事情不做，一些零碎的事情倒把自己搞的很忙!也不明白该怎样忙，认为进行岗位操作就是在管理。这不是什么身体力行的事，而是暂时潜力有限所致。");
        TimerTasks.Task();
    }

    void Application_End(object sender, EventArgs e)
    {
        //  在应用程序关闭时运行的代码

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }

</script>
