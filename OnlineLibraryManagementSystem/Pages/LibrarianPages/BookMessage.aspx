<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="BookMessage.aspx.cs" Inherits="Pages_LibrarianPages_BookMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 930px;
            height: 200px;
            text-align:center;
        }
        .auto-style3 {
            width: 618px;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <%-- '<%#Eval("ImageURL") %>' --%>
    <div style="border: #333333; border-style: dashed; border-top-width: 1px;
              border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px">
    <div class="auto-style2">
     <div style="text-align:center;float:left;width:200px">
    <asp:Image ID="Image1" runat="server" Width="110" Hight="120"/>
     </div>
        <div style="text-align:left;" class="auto-style3">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:TextBox ID="TextBoxtitle" runat="server" Width="450px"></asp:TextBox>
    
    
            <br/>
    
    
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    
            <asp:TextBox ID="TextBoxauthor" runat="server"></asp:TextBox>
            <br/>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="TextBoxpubdate" runat="server"></asp:TextBox>
            <br/>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="TextBoxprice" runat="server"></asp:TextBox>
            <br/>
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="TextBoxisbn13" runat="server"></asp:TextBox>
            <br/>
    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
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
    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="TextBoxpages" runat="server"></asp:TextBox>
            <br/>
    <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="TextBoxpublisher" runat="server"></asp:TextBox>
            <br/>
    </div>
        </div>
    </div>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" Height="27px" />
    <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource,Upload %>" OnClick="Upload_Click" />
    <br>
        <asp:Button ID="Alter" runat="server" Text="<%$ Resources:Resource,Alter %>" OnClick="Alter_Click" />

</asp:Content>

