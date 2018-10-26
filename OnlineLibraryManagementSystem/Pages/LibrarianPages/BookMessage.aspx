<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="BookMessage.aspx.cs" Inherits="Pages_LibrarianPages_BookMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 618px;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <%-- '<%#Eval("ImageURL") %>' --%>
    
    <div>
     <div  class="Image" style="float:left;width:300px">
            <asp:Image ID="Image1" runat="server" Width="300" Hight="240"/>
            <br/>
            <asp:FileUpload ID="FileUpload1" runat="server" Text="test" Height="27px" />
            <br/>
            <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource,Upload %>" OnClick="Upload_Click" />
            <asp:Button ID="Alter" runat="server" Text="<%$ Resources:Resource,Alter %>" OnClick="Alter_Click" />
     </div>
        <div class="Bookinfo" style="float:left" class="auto-style3">
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
            <asp:TextBox ID="TextBoxtitle" runat="server" ></asp:TextBox>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Author %>"></asp:Label>
            <asp:TextBox ID="TextBoxauthor" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Pubdate %>"></asp:Label>
            <asp:TextBox ID="TextBoxpubdate" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Price %>"></asp:Label>
            <asp:TextBox ID="TextBoxprice" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, ISBN13 %>"></asp:Label>
            <asp:TextBox ID="TextBoxisbn13" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, ISBN10 %>"></asp:Label>
            <asp:TextBox ID="TextBoxisbn10" runat="server"></asp:TextBox>
            <br/>
<%--    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="subtitle" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="origintitle" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="binding" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="translator" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="catalog" runat="server" Text=""></asp:Label>--%>
            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, Pages %>"></asp:Label>
            <asp:TextBox ID="TextBoxpages" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, Publisher %>"></asp:Label>
            <asp:TextBox ID="TextBoxpublisher" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, Position %>"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <br/>  
    </div>
        </div>
    <br/>

</asp:Content>
