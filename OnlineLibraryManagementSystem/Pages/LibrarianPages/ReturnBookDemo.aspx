<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="ReturnBookDemo.aspx.cs" Inherits="Pages_ReturnBookDemo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 37%;
            height: 29px;
        }
        .auto-style2 {
            width: 26%;
            height: 29px;
        }
    </style>
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
                <td style="text-align:right" class="auto-style1">
                    <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style2">
                    <asp:TextBox ID="tbBarcode" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td class="auto-style1">
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

