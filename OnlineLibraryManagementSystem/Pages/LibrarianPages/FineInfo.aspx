<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="FineInfo.aspx.cs" Inherits="Pages_LibrarianPages_FineInfo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
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
</asp:Content>

