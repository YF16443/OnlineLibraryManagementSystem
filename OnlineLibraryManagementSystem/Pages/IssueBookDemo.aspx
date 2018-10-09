<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="IssueBookDemo.aspx.cs" Inherits="Pages_IssueBookDemo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Label ID="lbTitle" runat="server" Text="<%$ Resources:Resource,Issue %>"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width:37%; text-align:right">
                    <asp:Label ID="lbReaderId" runat="server" Text="<%$ Resources:Resource,ReaderId %>"></asp:Label>
                </td>
                <td style="width:26%; text-align:center">
                    <asp:TextBox ID="tbReaderId" runat="server" Width="300px" TextMode="Number"></asp:TextBox>
                </td>
                <td style="width:37%">
                    <asp:RequiredFieldValidator ID="rfvReaderId" runat="server" ControlToValidate="tbReaderId" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:37%; text-align:right">
                    <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>"></asp:Label>
                </td>
                <td style="width:26%; text-align:center">
                    <asp:TextBox ID="tbBarcode" runat="server" Width="300px" TextMode="Number"></asp:TextBox>
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

