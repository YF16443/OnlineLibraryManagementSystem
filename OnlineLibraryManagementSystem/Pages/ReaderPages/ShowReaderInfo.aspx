﻿<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ShowReaderInfo.aspx.cs" Inherits="Pages_ShowReaderInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <style type="text/css">
        .style1 {
            width: 35%;
            text-align: center;
            font-family: Consolas;
            float:left;
        }
        .style2 {
            width: 35%;
            text-align: center;
            font-family: Consolas;
            margin:auto;
        }
        .style3{
            float:left;
            width: 65%;
        }
        .auto-style1 {
            text-align: center;
            margin:0 auto;
        }
        .auto-style2 {
            width: auto;
            text-align: right;
            height: 35px;
            font-size: x-large;
        }

        .auto-style4 {
            width: auto;
            text-align: left;
            height: 35px;
            font-size: x-large;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        
    </style>
    <div class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,ReaderInfo %>" CssClass="auto-style5"></asp:Label>
        <br /> <br />
        <div class="style1">
            <table>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="TextBoxName" runat="server" Text="name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, IDNumber %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="TextBoxIDNumber" runat="server" Text="IdNumber"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Telephone %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="TextBoxTelephone" runat="server" Text="phone"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Email %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="TextBoxEmail" runat="server" Text="email"></asp:Label>
                </td>
            </tr>
    </table>
    <table>
        <tr>
            <td class="auto-style2" style="text-align:center">
                <br />
                <asp:LinkButton ID="lbChangePassword" runat="server" Text="<%$ Resources:Resource, ChangePassword %>" PostBackUrl="~/Pages/ReaderPages/ChangePassword.aspx"></asp:LinkButton>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="text-align:center">
                <asp:LinkButton ID="lbChangeReaderInfomation" runat="server" Text="<%$ Resources:Resource, ChangeReaderInfomation %>" PostBackUrl="~/Pages/ReaderPages/ChangeReaderInfomation.aspx"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="text-align:center">
                <asp:LinkButton ID="lbForgotPassword" runat="server" Text="<%$ Resources:Resource, ForgotPassword %>" PostBackUrl="~/Pages/ReaderPages/ForgotPassword.aspx"></asp:LinkButton>
            </td>
        </tr>
    </table>
        </div>
        <div class = "style3">
            <asp:GridView ID="GridView1" runat="server" CellPadding="20" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </div>
    </div>
</asp:Content>