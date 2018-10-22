﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="LibrarianLogin.aspx.cs" Inherits="Pages_LibrarianLogin" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">

    <div>
        <table style="width: 100%;">
            <tr>
                <td></td>
                <td style="text-align:center; width:300px">
                    <asp:Login ID="Login1" runat="server" LoginButtonText="<%$ Resources:Resource,Login_Login %>" PasswordLabelText="<%$ Resources:Resource,Login_Password %>" RememberMeText="<%$ Resources:Resource,Login_Remember %>" TitleText="<%$ Resources:Resource,LibrarianLogin %>" UserNameLabelText="<%$ Resources:Resource,Login_UsrName %>" Width="300px" DestinationPageUrl="~/Pages/LibrarianPages/IssueBookDemo.aspx" OnAuthenticate="Login1_Authenticate" CssClass="align-middle">
                    </asp:Login>
                </td>
                <td></td>
            </tr>
        </table>
    </div>

</asp:Content>
