<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="DamageFine.aspx.cs" Inherits="Pages_LibrarianPages_DamageFine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Label ID="lbTitle" runat="server" Text="<%$ Resources:Resource,Reparation %>"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align:right" class="auto-style1">
                    <asp:Label ID="lbBarcode" runat="server" Text="<%$ Resources:Resource,Barcode %>"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style2">
                    <asp:TextBox ID="tbBarcode" runat="server" Width="300px" TextMode="Number"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvBarcode" runat="server" ControlToValidate="tbBarcode" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr>
                <td style="text-align:right" class="auto-style1">
                    <asp:Label ID="Type" runat="server" Text="<%$ Resources:Resource,Type %>"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style2">
                    <asp:DropDownList ID="TypeField" runat="server" Width="300px">
                        <asp:ListItem Text="<%$ Resources:Resource,Damage %>" Value="Damage" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,Lost %>" Value="Lost"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="fineReparation" runat="server" Text="<%$ Resources:Resource,Reparation %>" OnClick="fineReparation_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

