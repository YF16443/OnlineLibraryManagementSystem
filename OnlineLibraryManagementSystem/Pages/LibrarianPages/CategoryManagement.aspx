<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="CategoryManagement.aspx.cs" Inherits="Pages_LibrarianPages_CategoryManagement" %>

<asp:Content ID="header" ContentPlaceHolderID="header" runat="Server">
    <script>
        document.getElementById("book").className = "active";
    </script>
    <a>
        <asp:label runat="server" text="<%$ Resources:Resource, CategoryManagement %>" cssclass="navbar-brand"></asp:label>
    </a>
</asp:Content>

<asp:Content ID="body" ContentPlaceHolderID="body" runat="Server">
    <div class="card">
        <div class="content">
            <div class="form-group">
                <label>
                    <asp:label id="Label2" runat="server" text="<%$ Resources:Resource, CategoryName %>"></asp:label>
                </label>
                <asp:textbox id="newName" runat="server" cssclass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator id="rfvName" runat="server" controltovalidate="newName" errormessage="*" forecolor="Red"></asp:requiredfieldvalidator>
            </div>
            <asp:button id="Add" runat="server" text="<%$ Resources:Resource, Add %>" cssclass="btn btn-fill btn-default" onclick="Add_Click" />
        </div>
    </div>

    <div class="card">

        <div class="content">
            <div class="material-datatables">
                <asp:gridview id="Category" runat="server" autogeneratecolumns="False" cssclass="table table-striped table-no-bordered table-hover" onrowediting="Category_RowEditing" onrowdatabound="Category_RowDataBound" onrowupdating="Category_RowUpdating" style="width: 100%; cellspacing: 0" onrowcancelingedit="Category_RowCancelingEdit" onpageindexchanging="Category_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, CategoryId %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, CategoryName %>" HeaderStyle-CssClass="text-primary">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true"  />
            </Columns>
        </asp:gridview>
            </div>
        </div>
    </div>

    <script src="../../assets/vendors/DataTables/jQuery-1.12.4/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        var $124 = $;
    </script>
    <script src="../../assets/vendors/jquery.datatables.js"></script>
</asp:Content>

<asp:Content ID="content4" ContentPlaceHolderID="foot" runat="server">
    <script>
        var income = $124('#body_Category').DataTable({
            "searching": false,
            "lengthChange": false,
            "order": [[0, 'asc']],
            "bStateSave": true,
            columnDefs: [{
                'targets': [2],
                'orderable': false
            }]
        });
    </script>
</asp:Content>

