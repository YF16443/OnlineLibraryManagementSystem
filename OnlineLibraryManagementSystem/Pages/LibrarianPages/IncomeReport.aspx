<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="IncomeReport.aspx.cs" Inherits="Pages_LibrarianPages_IncomeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <%--  <link href="../../assets/vendors/My97DatePicker/skin/twoer/datepicker.css" rel="stylesheet" />--%>
<%--    <script src="../../assets/vendors/My97DatePicker/WdatePicker.js"></script>--%>
<%--    <link href="../../assets/vendors/DataTables/datatables.css" rel="stylesheet" />--%>
<%--    <script src="../../assets/vendors/DataTables/datatables.js"></script>--%>
<%--    <link href="../../assets/vendors/DataTables/datatables.min.css" rel="stylesheet" />--%>
<%--    <script src="../../assets/vendors/DataTables/datatables.min.js"></script>--%>
                    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
        <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
        <link href="../../assets/vendors/jquery-date-range-picker-master/dist/daterangepicker.css" rel="stylesheet" />
        <script src="../../assets/vendors/jquery-date-range-picker-master/src/jquery.daterangepicker.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" Runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, IncomeReport %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <input id="date-range1" size="60" value="">
    <div class="card">
        <div class="content">
            <div class="toolbar">
                <div class="row">
                    <div class="col-md-1">
 
                        <asp:Label ID="Label1" runat="server" Text="年" CssClass="col-md-3 label-on-left"></asp:Label>       
                    </div>
                    <div class="col-md-3">
                        <input id="year" class="Wdate" type="text" onfocus="WdatePicker({dateFmt:'yyyy年'})"/>
                    </div>
                    </br></br>
                </div>
                <div class="row">
                    <div class="col-md-1">
                         <asp:Label ID="Label2" runat="server" Text="月" CssClass="col-md-3 label-on-left"></asp:Label>   
                    </div>
                    <div class="col-md-3">
                        <input id="month" class="Wdate" type="text" onfocus="WdatePicker({dateFmt:'yyyy年MM月'})"/>
                    </div>
                    </br></br>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <asp:Label ID="Label3" runat="server" Text="周" CssClass="col-md-3 label-on-left"></asp:Label>  
                    </div>
                    <div class="col-md-3">
                        <input id="d121" class="Wdate" type="text" onfocus="WdatePicker({isShowWeek:true,onpicked:funccc,errDealMode:3})"/>
                    </div>
                    </br></br>
                </div>
                <div class="row"></div>
                    <div class="col-md-1">
                        <asp:Button ID="reset" runat="server" Text="<%$ Resources:Resource, Reset %>" CssClass="btn btn-primary btn-fill"/> 
                    </div> 
                </br></br>
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
  

<script type="text/javascript">
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
    function funccc() {
        $dp.$('d121').value = $dp.cal.getP('y') + $dp.cal.getP('W', 'WW');
    };
        $('#date-range1').dateRangePicker(
            {batchMode: 'week', 
                showShortcuts: false,
    language:'en',
        });

    </script>
</asp:Content>

