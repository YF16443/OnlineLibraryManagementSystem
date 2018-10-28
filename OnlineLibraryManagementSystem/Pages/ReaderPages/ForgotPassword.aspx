<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Pages_ReaderPages_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div>
            <table  style="width: 100%;">
            <tr  style="margin:10px,0px,5px,0px">
                <td style="width:100%; text-align:center; padding:5px,5px,2.5px,5px;">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, VerifyIdNumber %>"></asp:Label>
                    &nbsp;
                </td>
            </tr>
            <tr style="margin:10px,0px,5px,0px">
                <td style="width:100%; text-align:center; padding:5px,5px,2.5px,5px;">
                    <asp:TextBox ID="TextBoxId" runat="server"></asp:TextBox>
                     &nbsp;
                </td>
            </tr>
            <tr style="width: 100%;">
                <td style="width:100%; text-align:center; padding:5px,5px,2.5px,5px;">
                    <asp:Button ID="Verify" runat="server" Text="<%$ Resources:Resource, Verify %>" OnClick="Verify_Click" />
                </td>
            </tr>
            </table>
        </div>
</asp:Content>

