<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Login_zh-CN.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
    
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 50%;
            text-align: right;
            height: 35px;
        }

        .auto-style4 {
            width: 50%;
            text-align: left;
            height: 35px;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style6 {
            font-size: x-large;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
        <div class="auto-style1">
            <asp:Label ID="Label4" runat="server" Text="网上图书管理系统" CssClass="auto-style5"></asp:Label>
            <br />
            <br />
            <table class="style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="登录名" CssClass="auto-style6"></asp:Label>
                        <span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp; </span>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="登录名不为空"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="密码" CssClass="auto-style6"></asp:Label>
                        <span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <br />
                        &nbsp;
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="密码不为空"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            <div class="style1">
                <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" CssClass="auto-style7" />
                &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="注册" OnClick="Button2_Click" CausesValidation="False" CssClass="auto-style7" />
            </div>
        </div>
</asp:Content>

