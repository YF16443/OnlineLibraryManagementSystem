<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="ShowReaderInfoByLib.aspx.cs" Inherits="Pages_ShowReaderInfo" %>
<asp:Content ID="header" ContentPlaceHolderID="header" Runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, ReaderInfo %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div class="card">
        <div class="content">
            <div class="form-group">
                <label><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Telephone %>"></asp:Label></label>
                <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label></label>
                <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label><asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, IDNumber %>"></asp:Label></label>
                <asp:TextBox ID="TextBoxIDNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label><asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Email %>"></asp:Label></label>
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label></label>
                <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Submit %>" CssClass="btn btn-fill btn-default" OnClick="Submit" />
            <asp:Button ID="Button" runat="server" Text="<%$ Resources:Resource, Delete %>" CssClass="btn btn-fill btn-default" OnClick="Delete" />
        </div>
    </div>

    <div class="card">

   <div class="content">
    <div class="material-datatables">
        <asp:GridView ID="Category" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-no-bordered table-hover"   style="width:100%;cellspacing:0"  >
            <Columns>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, BookTitle %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, IssueTime %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("issueTime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, ReturnTime %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("returnTime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource,  OverDueTime %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("overdueTime") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource, Status %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:Resource,  Fine %>" HeaderStyle-CssClass="text-primary">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("fine") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
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
            "bStateSave":true,
        });
        
</script>

</asp:Content>