<%@ Page Language="C#" MasterPageFile="~/Pages/AdminPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchLibrarian.aspx.cs" Inherits="Pages_AdminPages_SearchLibrarian" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <script>
        document.getElementById("librarian").className = "active";
    </script>
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, LibrarianManagement %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="card">
        <div class="content">
            <div class="form-group">
                <label><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Account %>"></asp:Label></label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"></asp:TextBox>
            </div>
            <div class="form-group">
                <label><asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label></label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text="00010001" onpaste="return false;" onKeyPress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"></asp:TextBox>
            </div>
            <div class="form-group">
                <label><asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label></label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:Resource, Add %>" CssClass="btn btn-fill btn-default" OnClick="Button1_Click" />
        </div>
    </div>
    <div class="card">
        <div class="content">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" CssClass="table table-bordered">
                        <Columns>
                            <asp:BoundField DataField="LibrarianId" HeaderText="LibrarianId" ReadOnly="True" HeaderStyle-CssClass="text-primary" ItemStyle-Width="120"/>
                            
                            <asp:BoundField DataField="Account" HeaderText="<%$ Resources:Resource, Account %>" HeaderStyle-CssClass="text-primary"/>
                            <asp:BoundField DataField="Password" HeaderText="<%$ Resources:Resource, Password %>" HeaderStyle-CssClass="text-primary"/>
                            <asp:BoundField DataField="Name" HeaderText="<%$ Resources:Resource, Name %>" HeaderStyle-CssClass="text-primary"/>
                            <asp:CommandField HeaderText="<%$ Resources:Resource, Edit %>" ShowEditButton="True" HeaderStyle-CssClass="text-primary" ItemStyle-Width="100"/>
                            <asp:CommandField HeaderText="<%$ Resources:Resource, Delete %>" ShowDeleteButton="True" HeaderStyle-CssClass="text-primary" ItemStyle-Width="100"/>
                        </Columns>
                    </asp:GridView>
        </div>
        </div>
    </div>
</asp:Content>
