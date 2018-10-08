﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchDemo.aspx.cs" Inherits="Pages_SearchDemo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .resultImg img{
            max-height:84px;
            max-width:60px;
        }
    </style>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td style="width:35%; text-align:right">
                    <asp:DropDownList ID="ddlField" runat="server">
                        <asp:ListItem Text="<%$ Resources:Resource,Title %>" Value="Title"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,Author %>" Value="Author"></asp:ListItem>
                        <asp:ListItem Text="ISBN" Value="ISBN"></asp:ListItem>
                        <asp:ListItem Text="ISSN" Value="ISSN" Enabled="false"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width:30%">
                    <asp:TextBox ID="tbSearch" runat="server" Width="450px"></asp:TextBox>
                </td>
                <td style="width:35%">
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        <asp:ListItem Text="<%$ Resources:Resource,Book %>" Value="Books" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,Periodical %>" Value="Periodicals"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="brSearch" runat="server" Text="<%$ Resources:Resource,Search %>" OnClick="brSearch_Click" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center; height:30px" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="3">
                    <asp:GridView ID="gvBookResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" ShowHeader="False" Enabled="False">
                        <Columns>
                            <asp:ImageField ShowHeader="False" DataImageUrlField="ImageURL" ReadOnly="True">
                                <ItemStyle Height="84px" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" CssClass="resultImg" />
                            </asp:ImageField>
                            <asp:HyperLinkField ShowHeader="False" DataNavigateUrlFields="BookId" DataNavigateUrlFormatString="~/Pages/bookMessage.aspx?book_id={0}" DataTextField="Title">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                            <asp:BoundField ShowHeader="False" DataField="Author" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Publisher" ReadOnly="True" ShowHeader="False">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="gvPeriodicalResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" ShowHeader="False" Enabled="False">
                        <Columns>
                            <asp:HyperLinkField ShowHeader="False" DataTextField="Title">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
    </div>
</asp:Content>
