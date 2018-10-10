﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div>
        <table style="width: 100%;">
            <tr>
                <td></td>
                <td style="text-align:center; width:300px">
                    <asp:Login ID="Login1" runat="server" LoginButtonText="<%$ Resources:Resource,Login_Login %>" PasswordLabelText="<%$ Resources:Resource,Login_Password %>" RememberMeText="<%$ Resources:Resource,Login_Remember %>" TitleText="<%$ Resources:Resource,Login_Login %>" UserNameLabelText="<%$ Resources:Resource,Login_UsrName %>" Width="300px" DestinationPageUrl="~/Pages/SearchDemo.aspx" OnAuthenticate="Login1_Authenticate" CssClass="align-middle" CreateUserText="<%$ Resources:Resource, Register %>" CreateUserUrl="~/Pages/ReaderRegistration.aspx">
                    </asp:Login>
                </td>
                <td></td>
            </tr>
        </table>
    </div>

</asp:Content>
