﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="IncomeReport.aspx.cs" Inherits="Pages_LibrarianPages_IncomeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--    <link href="../../assets/vendors/DataTables/datatables.css" rel="stylesheet" />--%>
<%--    <script src="../../assets/vendors/DataTables/datatables.js"></script>--%>
<%--    <link href="../../assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />--%>
<%--    <script src="../../assets/vendors/DataTables/datatables.min.js"></script>--%>
        <link href="../../assets/vendors/daterangepicker/styles/vendor.css" rel="stylesheet" />
    <link href="../../assets/vendors/daterangepicker/styles/daterangepicker.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" Runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, IncomeReport %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">

    <div class="card">
        <div class="content">
              <div class="row">
             <div class='col-md-4'>
                        <input class="daterangepicker-field" style="z-index: 999"></input></span>
                </div>
                    <div class="col-md-1">
                        <asp:Button ID="reset" runat="server" Text="<%$ Resources:Resource, Reset %>" CssClass="btn btn-primary btn-fill"/> 
                    </div> 
                </br></br>
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
  </asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="foot" runat="server">
        <script src="../../assets/vendors/daterangepicker/scripts/vendor.js"></script>
    <script src="../../assets/vendors/daterangepicker/scripts/daterangepicker.js"></script>

    <script>
$(".daterangepicker-field").daterangepicker({
  forceUpdate: true,
    single: true,
  callback: function(startDate, endDate, period){
    var title = startDate.format('L') + ' – ' + endDate.format('L');
    $(this).val(title)
  }
});
</script>
</asp:Content>
<%--<script type="text/javascript">
    <%-- $(document).ready(function () {
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
                    "bLengthChange": false,
                   
         });
         var date=

    });--%>

  



