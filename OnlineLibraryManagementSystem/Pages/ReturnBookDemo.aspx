<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="ReturnBookDemo.aspx.cs" Inherits="Pages_ReturnBookDemo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Label ID="lbTitle" runat="server" Text="<%$ Resources:Resource,Return %>"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width:37%; text-align:right">
                    <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>"></asp:Label>
                </td>
                <td style="width:26%; text-align:center">
                    <asp:TextBox ID="tbBarcode" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td style="width:37%">
                    <asp:RequiredFieldValidator ID="rfvBarcode" runat="server" ControlToValidate="tbBarcode" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="btReturn" runat="server" OnClick="btReturn_Click" Text="<%$ Resources:Resource,Return %>" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

