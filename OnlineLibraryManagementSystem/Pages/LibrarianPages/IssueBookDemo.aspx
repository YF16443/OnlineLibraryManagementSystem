<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="IssueBookDemo.aspx.cs" Inherits="Pages_IssueBookDemo" %>

<asp:Content ID="head" ContentPlaceHolderID="header" Runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, Issue %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <table style="width: 100%;">
            <tr style="margin:10px,0px,5px,0px">
                <td style="width:37%; text-align:right; padding:5px,5px,2.5px,5px;">
                    <asp:Label ID="lbReaderId" runat="server" Text="<%$ Resources:Resource,ReaderId %>"></asp:Label>
                    &nbsp;
                </td>
                <td style="width:26%; text-align:center; padding:5px,5px,2.5px,5px;">
                    <asp:TextBox ID="tbReaderId" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td style="width:37%">
                    <asp:RequiredFieldValidator ID="rfvReaderId" runat="server" ControlToValidate="tbReaderId" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="margin:5px,0px,10px,0px">
                <td style="width:37%; text-align:right; padding:5px,5px,2.5px,5px;">
                    <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>"></asp:Label>
                    &nbsp;
                </td>
                <td style="width:26%; text-align:center; padding:2.5px,5px,5px,5px">
                    <asp:TextBox ID="tbBarcode" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td style="width:37%">
                    <asp:RequiredFieldValidator ID="rfvBarcode" runat="server" ControlToValidate="tbBarcode" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="btIssue" runat="server" OnClick="btIssue_Click" Text="<%$ Resources:Resource,Issue %>" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

