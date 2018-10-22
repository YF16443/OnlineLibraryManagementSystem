﻿<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Pages_LibrarianPages_Test" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" >
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >

    <title>Amaze - Bootstrap Admin Dashboard Template</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no' name='viewport' >
    <meta name="viewport" content="width=device-width" >

    <!-- Bootstrap core CSS     -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" >

    <!--  Material Dashboard CSS    -->
    <link href="../../assets/css/amaze.css" rel="stylesheet" >

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../../assets/css/demo.css" rel="stylesheet" >

    <!--     Fonts and icons     -->
    <link href="../../assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../assets/css/font-muli.css" rel='stylesheet' type='text/css'>
    <link href="../../assets/css/themify-icons.css" rel="stylesheet">

    <link href="../../assets/vendors/sweetalert/css/sweetalert2.min.css" rel="Stylesheet" >
</head>

<body>
    <form id="form" runat="server">
    <div class="wrapper">
		<div class="sidebar" data-background-color="brown" data-active-color="danger">
	    <!--
			Tip 1: you can change the color of the sidebar's background using: data-background-color="white | brown"
			Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
		-->
            <div class="logo">
                <a href="#" class="simple-text">
                    <asp:ImageButton ID="ibLogo" runat="server" ImageUrl="~/Images/logo.png" PostBackUrl="~/Pages/SearchDemo.aspx" Height="43.2px" Width="145.35px"/>
                </a>
            </div>
  <%--          <div class="logo logo-mini">
                <a href="#" class="simple-text">
                    A
                </a>
            </div>--%>
            <div class="sidebar-wrapper">
				<ul class="nav">
					<li>
						<a data-toggle="collapse" href="#BookCirculation" class="collapsed" aria-expanded="false">
							<i class="ti-loop"></i>
							<p><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource,BookCirculation %>"></asp:Label>
								<b class="caret"></b>
							</p>
						</a>
						<div class="collapse" id="BookCirculation" role="navigation" aria-expanded="false" style="height: 0px;">
							<ul class="nav">
								<li>
									<a href="IssueBookDemo.aspx">
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource,Issue %>"></asp:Label></a>
								</li>
								<li>
									<a href="ReturnBookDemo.aspx">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource,Return %>"></asp:Label></a>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<a data-toggle="collapse" href="#BookManagement" class="collapsed" aria-expanded="false">
							<i class="ti-book"></i>
							<p><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource,BookManagement %>"></asp:Label>
								<b class="caret"></b>
							</p>
						</a>
						<div class="collapse" id="BookManagement" role="navigation" aria-expanded="false" style="height: 0px;">
							<ul class="nav">
								<li><a href="AddBooks.aspx">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource,AddBook %>"></asp:Label></a></li>
								<li><a href="AddPeriodicals.aspx">
                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource,AddPeriodical %>"></asp:Label></a></li>
								<li><a href="SearchBooks.aspx">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource,Search %>"></asp:Label></a></li>
								<li><a href="OperationHistory.aspx">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource,OperationHistory %>"></asp:Label></a></li>
								<li><a href="CategoryManagement.aspx">
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource,Category %>"></asp:Label></a></li>
							</ul>
						</div>
					</li>
					<li>
						<a data-toggle="collapse" href="#StacksManagement" class="collapsed" aria-expanded="false">
							<i class="ti-layout-column3"></i>
							<p>
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource,StacksManagement %>"></asp:Label>
								<b class="caret"></b>
							</p>
						</a>
						<div class="collapse" id="StacksManagement" role="navigation" aria-expanded="false" style="height: 0px;">
							<ul class="nav">
								<li><a href="Search_Stacks_Shelves.aspx">
                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource,Search %>"></asp:Label></a></li>
								<li><a href="EditStack.aspx">
                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource,AddStack %>"></asp:Label></a></li>
								<li><a href="AddShelves.aspx">
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource,AddShelf %>"></asp:Label></a></li>
							</ul>
						</div>
					</li>
					<li>
						<a data-toggle="collapse" href="#ReaderManagement" class="collapsed" aria-expanded="false">
							<i class="ti-user"></i>
							<p>
                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Resource,ReaderManagement %>"></asp:Label>
								<b class="caret"></b>
							</p>
						</a>
						<div class="collapse" id="ReaderManagement" role="navigation" aria-expanded="false" style="height: 0px;">
							<ul class="nav">
								<li><a href="ReaderRegistration.aspx">
                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Resource,Register %>"></asp:Label></a></li>
								<li><a href="SearchReader.aspx">
                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Resource,Search %>"></asp:Label></a></li>
							</ul>
						</div>
					</li>
                    <li>
						<a data-toggle="collapse" href="#FineManagement" class="collapsed" aria-expanded="false">
							<i class="ti-money"></i>
							<p>
                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Resource,FineManagement %>"></asp:Label>
								<b class="caret"></b>
							</p>
						</a>
						<div class="collapse" id="FineManagement" role="navigation" aria-expanded="false" style="height: 0px;">
							<ul class="nav">
								<li><a href="FineInfo.aspx">
                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Resource,Fine %>"></asp:Label></a></li>
								<li><a href="DamageFine.aspx">
                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Resource,Reparation %>"></asp:Label></a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="">
							<i class="ti-bar-chart"></i>
							<p>
                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Resource,Statistics %>"></asp:Label>
							</p>
						</a>
					</li>
					<li>
						<a href="">
							<i class="ti-clipboard"></i>
							<p>
                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Resource,NoticeManagement %>"></asp:Label></p>
						</a>
					</li>
                    <li>
                        <a href="../AboutUs.aspx">
                            <i class="ti-info"></i>
                            <p><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,AboutUs %>"></asp:Label></p>
                        </a>
                    </li>
				</ul>

            </div>
        </div>
        <div class="main-panel">

                
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <asp:LoginView ID="LoginView" runat="server">
                            <AnonymousTemplate>
                                <asp:LinkButton ID="lbLogin" runat="server" Text="<%$ Resources:Resource,Login %>" PostBackUrl="~/Pages/LibrarianLogin.aspx"></asp:LinkButton>
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <asp:LinkButton ID="lbLogout" runat="server" Text="<%$ Resources:Resource,Logout %>" OnClick="lbLogout_Click"></asp:LinkButton>
                            </LoggedInTemplate>
                        </asp:LoginView>
                            </li>
                            <li>
                                <div class="select" style="position:relative;bottom:0px">
                                    <asp:DropDownList ID="ddlLanguages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLanguages_SelectedIndexChanged" CssClass="form-control">
                                        <asp:ListItem Value="zh-CN">简体中文</asp:ListItem>
                                        <asp:ListItem Value="en-US">English</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </li>
                      
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="content">
                 
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                          
                            <li>
                                <a>
                                   <asp:HyperLink ID="hlAboutUs" runat="server" Text="<%$ Resources:Resource,AboutUs %>" NavigateUrl="~/Pages/AboutUs.aspx"></asp:HyperLink>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        SPM-A3</a>
                    </p>
                </div>
            </footer>
        </div>

    </div>
        
        </form>
<!--   Core JS Files   -->
<script src="../../assets/vendors/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/jquery-ui.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/bootstrap.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/material.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="../../assets/vendors/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="../../assets/vendors/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="../../assets/vendors/charts/flot/jquery.flot.js"></script>
<script src="../../assets/vendors/charts/flot/jquery.flot.resize.js"></script>
<script src="../../assets/vendors/charts/flot/jquery.flot.pie.js"></script>
<script src="../../assets/vendors/charts/flot/jquery.flot.stack.js"></script>
<script src="../../assets/vendors/charts/flot/jquery.flot.categories.js"></script>
<script src="../../assets/vendors/charts/chartjs/Chart.min.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="../../assets/vendors/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="../../assets/vendors/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="../../assets/vendors/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script src="../../assets/vendors/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="../../assets/vendors/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyAurmSUEQDwY86-wOG3kCp855tCI8lHL-I"></script>
<!-- Select Plugin -->
<script src="../../assets/vendors/jquery.select-bootstrap.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="../../assets/js/bootstrap-checkbox-radio-switch-tags.js"></script>

<!-- Circle Percentage-chart -->
<script src="../../assets/js/jquery.easypiechart.min.js"></script>

<!--  DataTables.net Plugin    -->
<script src="../../assets/vendors/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="../../assets/vendors/sweetalert/js/sweetalert2.min.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="../../assets/vendors/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="../../assets/vendors/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="../../assets/vendors/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="../../assets/js/amaze.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../../assets/js/demo.js"></script>

<script src="../../assets/js/charts/flot-charts.js"></script>
<script src="../../assets/js/charts/chartjs-charts.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		demo.initVectorMap();
		demo.initCirclePercentage();

	});
</script>
</body>
</html>

