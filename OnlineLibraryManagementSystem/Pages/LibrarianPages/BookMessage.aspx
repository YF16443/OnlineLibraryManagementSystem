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
    <div>
        <div style="text-align:center;float:left;width:200px">
            <asp:Image ID="Image1" runat="server" Width="110" Hight="120"/>
        </div>
        <div style="text-align:left;" class="auto-style3">
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Title %>"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxtitle" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource,Author %>"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxauthor" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource,PublishDate %>"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxpubdate" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource,Price %>"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxprice" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label5" runat="server" Text="ISBN13"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxisbn13" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label6" runat="server" Text="ISBN10"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxisbn10" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource,Pages %>"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxpages" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource,Publisher %>"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TextBoxpublisher" runat="server" Width="300px"></asp:TextBox>
            <br/>
            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource,Position %>"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <br/>  
        </div>
    </div>
    <br/>
    <asp:FileUpload ID="FileUpload1" runat="server" Height="27px" Visible="False" />
    <br/>
    <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource,Upload %>" OnClick="Upload_Click" Visible="False" />
    &nbsp;
    <asp:Button ID="Alter" runat="server" Text="<%$ Resources:Resource,Updata %>" OnClick="Alter_Click" />
</asp:Content>

