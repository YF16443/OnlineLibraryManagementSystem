<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeReaderInfomation.aspx.cs" Inherits="Pages_ChangeReaderInfomation" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
        <div>
        <table style="width: 100%;">
            <tr>
                <td style="width:45%; text-align:right">
                    <asp:Label ID="lbNewEmail" runat="server" Text="<%$ Resources:Resource,NewEmail %>"></asp:Label>
                </td>
                <td style="width:20%; text-align:center">
                    <asp:TextBox ID="tbNewEmail" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td style="width:35%">
                    <asp:RequiredFieldValidator ID="rfvNewEmail" runat="server" ControlToValidate="tbNewEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:45%; text-align:right">
                    <asp:Label ID="lbNewPhone" runat="server" Text="<%$ Resources:Resource,NewPhone %>"></asp:Label>
                </td>
                <td style="width:20%; text-align:center">
                    <asp:TextBox ID="tbNewPhone" runat="server" Width="300px"></asp:TextBox>
                </td>
                <td style="width:35%">
                    <asp:RequiredFieldValidator ID="rfvNewPhone" runat="server" ControlToValidate="tbNewPhone" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="btNewInfomation" runat="server" OnClick="btNewInfomation_Click" Text="<%$ Resources:Resource,Submit %>" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
