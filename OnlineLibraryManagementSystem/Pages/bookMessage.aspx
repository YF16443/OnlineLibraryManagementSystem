<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="bookMessage.aspx.cs" Inherits="Pages_bookMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <%-- '<%#Eval("ImageURL") %>' --%>
    <div>
    <asp:Image ID="Image1" runat="server"/>
        </div>
    <asp:Label ID="title" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="author" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="pubDate" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="price" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="isbn13" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="isbn10" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="subtitle" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="origintitle" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="binding" runat="server" Text=""></asp:Label><br />
    <%--<asp:Label ID="translater" runat="server" Text=""></asp:Label><br />--%>
    <asp:Label ID="catalog" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="pages" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="publisher" runat="server" Text=""></asp:Label>
    
    
    <br />

</asp:Content>

