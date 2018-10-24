﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="IncomeReport.aspx.cs" Inherits="Pages_LibrarianPages_IncomeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Bootstrap core CSS     -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" >

    <!--  Paper Dashboard CSS    -->
    <link href="../../assets/css/amaze.css" rel="stylesheet" >

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../../assets/css/demo.css" rel="stylesheet" >

    <!--     Fonts and icons     -->
    <link href="../../assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../assets/css/font-muli.css" rel='stylesheet' type='text/css'>
    <link href="../../assets/css/themify-icons.css" rel="stylesheet">

    <link href="../../assets/vendors/jquery-ui-1.12.0/jquery-ui.css" rel="stylesheet">
    <link href="../../assets/vendors/sweetalert/css/sweetalert2.min.css" rel="Stylesheet" >
<%--    <link href="../../assets/vendors/DataTables/datatables.css" rel="stylesheet" />
    <link href="../../assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />--%>
    <link href="../../assets/vendors/daterangepicker/daterangepicker.css" rel="stylesheet" />
    <link href="../../assets/vendors/daterangepicker/daterangepicker.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" Runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, IncomeReport %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="card">
        <div class="content">
            <div class="toolbar">
                <div class="input-group" id="id_search_date">
                    <span class="add-on input-group-addon">
                        <i class="glyphicon glyphicon-calendar fa fa-calendar" style="font-size: 18px"></i>
                    </span>
                    <input class="reportrange" />
                    <input data-bind="daterangepicker: dateRange" />
                    &nbsp;&nbsp;
                    <asp:Button ID="reset" runat="server" Text="<%$ Resources:Resource, Reset %>" CssClass="btn btn-primary  btn-fill"/>
                </div>
            </div>  
             <div class="material-datatables">
                 <asp:GridView ID="Income" runat="server" CssClass="table table-striped table-no-bordered table-hover" AutoGenerateColumns="False" style="width:100%;cellspacing:0">
            <Columns>
                <asp:BoundField HeaderText="<%$ Resources:Resource, ReaderId %>" DataField="ReaderId" ReadOnly="true" />
                <asp:BoundField HeaderText="<%$ Resources:Resource, Type %>" DataField="Type" ReadOnly="true" />
                <asp:BoundField HeaderText="<%$ Resources:Resource, Amount %>" DataField="Amount" ReadOnly="true" />
                <asp:BoundField HeaderText="<%$ Resources:Resource, Time %>" DataField="Time" ReadOnly="true" />
            </Columns>
        </asp:GridView>
    </div>
        </div>
    </div>
   
<!--   Core JS Files   -->
<script src="../../assets/vendors/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/jquery-ui-1.12.0/jquery-ui.js"></script>
<script src="../../assets/vendors/bootstrap.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/material.min.js" type="text/javascript"></script>
<script src="../../assets/vendors/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="../../assets/vendors/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="../../assets/vendors/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="../../assets/vendors/chartist.min.js"></script>
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
<!-- Select Plugin -->
<script src="../../assets/vendors/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="../../assets/vendors/jquery.datatables.js"></script>
<script src="../../assets/vendors/DataTables/datatables.js"></script>
<script src="../../assets/vendors/DataTables/datatables.min.js"></script>
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
<!--Date Range Picker-->
<script src="../../assets/vendors/daterangepicker/daterangepicker.js"></script>
<script src="../../assets/vendors/daterangepicker/daterangepicker.min.js"></script>
<script src="../../assets/js/moment.min.js"></script>

<script type="text/javascript">
     $(document).ready(function () {
         var oTable = $('#' + '<%=Income.ClientID%>').dataTable({
                    "searching": false,
                    "sDom": "Rlfrtip",
                    "bAutoWidth": false,
                    "bFilter": true,
                    "bPagination": true,
                    "sPaginationType": "full_numbers",
                    "bStateSave": true,
                    "bPaginate": true,
                    "bInfo": true,
                   
         });

    });
    $(".reportrange").daterangepicker({
  forceUpdate: true,
  callback: function(startDate, endDate, period){
    var title = startDate.format('L') + ' – ' + endDate.format('L');
    $(this).val(title)
  }
});

</script>
</asp:Content>

