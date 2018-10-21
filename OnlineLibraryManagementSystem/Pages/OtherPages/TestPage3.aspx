<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="TestPage3.aspx.cs" Inherits="Pages_OtherPages_TestPage3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Bootstrap core CSS     -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" >

    <!--  Paper Dashboard CSS    -->
    <link href="../../assets/css/amaze.css" rel="stylesheet" >

    <!--     Fonts and icons     -->
    <link href="../../assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../assets/css/font-muli.css" rel='stylesheet' type='text/css'>
    <link href="../../assets/css/themify-icons.css" rel="stylesheet">
    <!--    JQuery UI     -->
    <link href="../../assets/vendors/jquery-ui-1.12.0/jquery-ui.css" rel="stylesheet">
    <link href="../../assets/vendors/sweetalert/css/sweetalert2.min.css" rel="Stylesheet" >
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div class="table-responsive">
        <asp:GridView ID="FineOverdue" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField HeaderText="<%$ Resources:Resource, ReaderId %>" DataField="ReaderID" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, Barcode %>" DataField="BookBarcode" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, IssueTime %>" DataField="IssueTime" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, Status %>" DataField="newStatus" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, ReturnTime %>" DataField="ReturnTime" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, OverDueTime %>" DataField="OverdueLength" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, Fine %>" DataField="Fine" ReadOnly="true" HeaderStyle-CssClass="text-primary">
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</div>
<%--<script src="../../assets/vendors/jquery-3.1.1.min.js" type="text/javascript"></script>
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
<!-- Sweet Alert 2 plugin -->
<script src="../../assets/vendors/sweetalert/js/sweetalert2.min.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="../../assets/vendors/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="../../assets/vendors/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="../../assets/vendors/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="../../assets/js/amaze.js"></script>--%>
       
</asp:Content>

