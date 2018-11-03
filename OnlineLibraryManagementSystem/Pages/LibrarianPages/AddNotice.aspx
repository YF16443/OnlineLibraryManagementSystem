<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddNotice.aspx.cs" Inherits="Pages_LibrarianPages_AddNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" Runat="Server">
        <a> <asp:Label runat="server" Text="<%$ Resources:Resource, AddNotice %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
    <div class="form-group">
        <label><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, NoticeId %>"></asp:Label></label>
        <asp:TextBox ID="txtnoticeid" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvId" runat="server" ControlToValidate="txtnoticeid" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Notice %>"></asp:Label></label>
        <asp:TextBox ID="txtdetails" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDetails" runat="server" ControlToValidate="txtdetails" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
    <asp:Button ID="Add" runat="server" Text="<%$ Resources:Resource, Add %>" CssClass="btn btn-fill btn-default" OnClick="Add_Click"/>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="foot" Runat="Server">
</asp:Content>

