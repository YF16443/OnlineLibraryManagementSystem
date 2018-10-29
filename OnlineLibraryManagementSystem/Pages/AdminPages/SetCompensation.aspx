<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPages/MasterPage.master" AutoEventWireup="true" CodeFile="SetCompensation.aspx.cs" Inherits="Pages_AdminPages_SetCompensation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
        <a> <asp:Label runat="server" Text="<%$ Resources:Resource, SetCompensation %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">

    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, DamageFineRate %>"></asp:Label>
    <asp:TextBox ID="DamageFineRate" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, LostFineRate %>"></asp:Label>
    <asp:TextBox ID="LostFineRate" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Submit %>" OnClick="Submit"  CausesValidation="False"/>
    <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel" CausesValidation="False" />      
</asp:Content>