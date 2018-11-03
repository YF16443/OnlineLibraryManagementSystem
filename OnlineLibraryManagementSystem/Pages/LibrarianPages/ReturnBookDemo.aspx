<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="ReturnBookDemo.aspx.cs" Inherits="Pages_ReturnBookDemo" %>

<asp:Content ID="head" ContentPlaceHolderID="header" Runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, Return %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <div class="content">
        <table style="width: 100%;">
            <tr>
                <td style="width: 40%; text-align:right" class="auto-style1">
                    <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>"></asp:Label>
                    &nbsp;
                </td>
                <td style="width: 40%; text-align:center" class="auto-style2">
                    <asp:TextBox ID="tbBarcode" runat="server" Width="300px" CssClass="form-control"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvBarcode" runat="server" ControlToValidate="tbBarcode" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Width="100%" Text="   "></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="btReturn" runat="server" OnClick="btReturn_Click" Text="<%$ Resources:Resource,Return %>" CssClass="btn btn-default btn-fill"/>
                </td>
            </tr>
        </table>
            </div>
    </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>


