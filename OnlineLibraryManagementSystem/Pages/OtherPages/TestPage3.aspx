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
    <table style="width: 100%;">
            <tr>
                <td colspan="3" style="text-align:center">
                  <div class="h4">
                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Reparation %>" CssClass="h4"></asp:Label>
                </div>
                        </td>
            </tr>
            <tr>
                <div class="form-group">
                <td style="text-align:right" class="auto-style1">
                      <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource,Barcode %>" CssClass="col-md-3 control-label"></asp:Label>
                    </td>
                  <td style="text-align:center" class="auto-style2">
                    <div class="col-md-9" >
                        <asp:TextBox ID="TextBox1" runat="server" Width="300px" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    </div>
                      </td>
                </div>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvBarcode" runat="server" ControlToValidate="tbBarcode" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
    
        <div class="form-group" style="text-align:center">
            <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>" CssClass="col-md-3 control-label"></asp:Label>
            <div class="col-md-9" >
                <asp:TextBox ID="tbBarcode" runat="server" Width="300px" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group" style="text-align:center">
             <asp:Label ID="Type" runat="server" Text="<%$ Resources:Resource,Type %>" CssClass="col-md-3 control-label"></asp:Label>
             <div class="col-md-9">
                 <div class="select">
                     <asp:DropDownList ID="TypeField" runat="server" Width="300px" CssClass="form-control">
                         <asp:ListItem Text="<%$ Resources:Resource,Damage %>" Value="Damage" Selected="True"></asp:ListItem>
                         <asp:ListItem Text="<%$ Resources:Resource,Lost %>" Value="Lost"></asp:ListItem>
                     </asp:DropDownList>
                     </div>
                 </div>
        </div>
        <div class="form-group" style="text-align:center">
            <div class="col-md-9">
             <label class="col-md-3"></label>
            <asp:Button ID="fineReparation" runat="server" Text="<%$ Resources:Resource,Reparation %>" OnClick="fineReparation_Click" CssClass="btn btn-fill btn-default"/>
        </div>
                </div>
                </table>
 


    
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

