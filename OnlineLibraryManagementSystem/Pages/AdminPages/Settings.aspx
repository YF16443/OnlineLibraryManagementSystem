<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPages/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Pages_AdminPages_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
        <a> <asp:Label runat="server" Text="<%$ Resources:Resource, Settings %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <div class="card">
    <div class="content">
    <h4 ><asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, ChangeConfiguration %>" CssClass="title"></asp:Label></h4>
    <div class="form-group label-floating">
        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, IsDeposit %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="Deposit" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="Deposit" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group label-floating">
        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, DamageFineRate %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="DamageFineRate" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="DamageFineRate" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group label-floating">
        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, LostFineRate %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="LostFineRate" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="LostFineRate" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group label-floating">
        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, MaximunIssue %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="MaximunIssue" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="MaximunIssue" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group label-floating">
        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, OverdueFinePerDay %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="OverdueFinePerDay" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="OverdueFinePerDay" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group label-floating">
        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Limitofreservation %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="Limitofreservation" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="OverdueFinePerDay" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group label-floating">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Limitofissue %>" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="Limitofissue" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
             ErrorMessage="<%$ Resources:Resource, Error %>" ControlToValidate ="OverdueFinePerDay" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <div class="form-footer text-right">
    <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Submit %>" OnClick="Submit"  CausesValidation="True" CssClass="btn btn-rose btn-fill"/>
    <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel" CausesValidation="False" CssClass="btn btn-rose btn-fill"/>   
    </div>
    </div>   
    </div>
</asp:Content>