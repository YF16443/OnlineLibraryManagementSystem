<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Pages_ChangePassword" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
        <div>
        <table style="width: 100%;">
            <tr>
                <td style="width:45%; text-align:right">
                    <asp:Label ID="lbOldPassword" runat="server" Text="<%$ Resources:Resource,OldPassword %>"></asp:Label>
                </td>
                <td style="width:20%; text-align:center">
                    <asp:TextBox ID="tbOldPassword" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width:35%">
                    <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="tbOldPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:45%; text-align:right">
                    <asp:Label ID="lbNewPassword" runat="server" Text="<%$ Resources:Resource,NewPassword %>"></asp:Label>
                </td>
                <td style="width:20%; text-align:center">
                    <asp:TextBox ID="tbNewPassword" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width:35%">
                    <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="tbNewPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:45%; text-align:right">
                    <asp:Label ID="lbConfirmNewPassword" runat="server" Text="<%$ Resources:Resource,ConfirmNewPassword %>"></asp:Label>
                </td>
                <td style="width:20%; text-align:center">
                    <asp:TextBox ID="tbConfirmNewPassword" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width:35%">
                    <asp:RequiredFieldValidator ID="rfvConfirmNewPassword" runat="server" ControlToValidate="tbConfirmNewPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvNewPassword" runat="server" ControlToCompare="tbConfirmNewPassword" ControlToValidate="tbNewPassword" ErrorMessage="x" Display="Dynamic" Operator="Equal"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="btChangePassword" runat="server" OnClick="btChangePassword_Click" Text="<%$ Resources:Resource,ChangePassword %>" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
