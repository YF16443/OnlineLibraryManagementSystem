﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Pages_AdminLogin" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div class="card card-login card-hidden">
        <div class="header text-center">
            <table style="width: 100%;">
            <tr>
                <td></td>
                <td style="text-align:center; width:300px">
                    <asp:Login ID="Login1" runat="server" LoginButtonText="<%$ Resources:Resource,Login_Login %>" PasswordLabelText="<%$ Resources:Resource,Login_Password %>" RememberMeText="<%$ Resources:Resource,Login_Remember %>" TitleText="<%$ Resources:Resource,AdminLogin %>" UserNameLabelText="<%$ Resources:Resource,Phone %>" Width="300px" DestinationPageUrl="~/Pages/AdminPages/Settings.aspx" OnAuthenticate="Login1_Authenticate" CssClass="content" EnableTheming="True" PasswordRequiredErrorMessage="*" style="left: 0px; top: 0px" UserNameRequiredErrorMessage="*" FailureText="<%$ Resources:Resource,LoginFailure %>">
                        <CheckBoxStyle HorizontalAlign="Left" />
                        <LabelStyle CssClass="col-sm-2 control-label" Font-Bold="False" Font-Overline="False" Font-Size="Small" Font-Strikeout="False" VerticalAlign="Middle" />
                        <LoginButtonStyle CssClass="btn btn-sm" />
                        <TextBoxStyle CssClass="form-control input-no-border" />
                        <TitleTextStyle Font-Bold="True" Font-Italic="False" Font-Size="X-Large" VerticalAlign="Top" Wrap="True" />
                    </asp:Login>
                </td>
                <td></td>
            </tr>
        </table>
        </div>
    </div>
</asp:Content>

