<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPages/MasterPage.master" AutoEventWireup="true" CodeFile="SetOverdueFinePerDay.aspx.cs" Inherits="Pages_AdminPages_SetOverdueFinePerDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
        <a> <asp:Label runat="server" Text="<%$ Resources:Resource, SetFineRules %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">

    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, OverdueFinePerDay %>"></asp:Label>
    <asp:TextBox ID="Deposit" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Submit %>" OnClick="Submit"  CausesValidation="False"/>
    <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel" CausesValidation="False" />      
</asp:Content>