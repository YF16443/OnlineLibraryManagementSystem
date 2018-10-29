<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ReaderPages/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Pages_ReaderPages_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 45%;
            height: 50px;
        }
        .auto-style3 {
            width: 20%;
            height: 50px;
        }
        .auto-style4 {
            width: 35%;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <form>
            <table  style="width: 100%;">
             <tr>
                  <td style="text-align:right" class="auto-style2">
                     <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Phone %>"></asp:Label>
                  </td>
                  <td style="text-align:center" class="auto-style3">
                     <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                  </td>
                  <td class="auto-style4">
                      <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="*"></asp:RequiredFieldValidator>
                  </td>
            </tr>
            <tr>
                <td style="text-align:right" class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, IdNumber %>"></asp:Label>
                </td>
                <td style="text-align:center" class="auto-style3">
                    <asp:TextBox ID="TextBoxId" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                      <asp:RequiredFieldValidator ID="rfvId" runat="server" ControlToValidate="TextBoxId" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="Verify" runat="server" Text="<%$ Resources:Resource, Verify %>" OnClick="Verify_Click" CausesValidation="true"/>
                </td>
            </tr>
            </table>
            </form>
        </div>
</asp:Content>

