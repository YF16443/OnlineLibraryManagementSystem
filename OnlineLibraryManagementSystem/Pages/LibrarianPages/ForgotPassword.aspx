<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ReaderPages/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Pages_LibrarianPages_ForgotPassword" %>

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
            height: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
     <div>
        <form>
            <table  style="width: 100%;">
             <tr>
                  <td style="text-align:right" class="auto-style2">
                     <label><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Account %>"></asp:Label></label>
                  </td>
                  <td style="text-align:center" class="auto-style3">
                     <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control" ></asp:TextBox>
                  </td>
                  <td class="auto-style4">
                      <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ControlToValidate="txtAccount" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                  </td>
            </tr>
            <tr>
                <td style="text-align:right" class="auto-style2">
                    <label><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label></label>
                </td>
                <td style="text-align:center" class="auto-style3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="auto-style4">
                      <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="Verify" runat="server" Text="<%$ Resources:Resource, Verify %>" OnClick="Verify_Click" CausesValidation="true" CssClass="btn btn-default btn-fill"/>
                </td>
            </tr>
            </table>
            </form>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="foot" Runat="Server">
</asp:Content>

