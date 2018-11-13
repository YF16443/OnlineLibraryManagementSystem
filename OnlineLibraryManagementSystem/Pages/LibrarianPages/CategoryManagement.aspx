<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="CategoryManagement.aspx.cs" Inherits="Pages_LibrarianPages_CategoryManagement" %>

<asp:Content ID="header" ContentPlaceHolderID="header" Runat="Server">
    <script>
        document.getElementById("book").className = "active";
    </script>
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, CategoryManagement %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div class="card">
        <div class="content">
            <div class="form-group">
                <label><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, CategoryName %>"></asp:Label></label>
                <asp:TextBox ID="newName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="newName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="Add" runat="server" Text="<%$ Resources:Resource, Add %>" CssClass="btn btn-fill btn-default" OnClick="Add_Click" />
        </div>
    </div>

    <div class="card">

   <div class="content">
    <div class="material-datatables">
        <asp:GridView ID="Category" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-no-bordered table-hover" OnRowEditing="Category_RowEditing" OnRowDataBound="Category_RowDataBound" OnRowUpdating="Category_RowUpdating" style="width:100%;cellspacing:0" OnRowCancelingEdit="Category_RowCancelingEdit" OnPageIndexChanging="Category_PageIndexChanging">
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
        </asp:GridView>
    </div>
         </div></div>

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

