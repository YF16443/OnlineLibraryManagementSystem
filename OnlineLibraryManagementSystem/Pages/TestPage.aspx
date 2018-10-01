<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="TestPage.aspx.cs" Inherits="Pages_TestPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:Label ID="lbTest" runat="server" Text="<%$ Resources:Resource,TestString %>"></asp:Label>
    <br />
    <asp:Label ID="lbBookInfo" runat="server" Text="Book Information Show Failed"></asp:Label>
</asp:Content>

