<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchBooks.aspx.cs" Inherits="Pages_LibrarianPages_SearchBooks" %>
<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .resultImg img{
            max-height:84px;
            max-width:60px;
        }
    </style>
    <script src="../Scripts/art-Template/template-web.js"></script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div style="padding-top:50px">
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
                    <asp:Button ID="brDelete" runat="server" Text="<%$ Resources:Resource,Delete %>" OnClick="brDelete_Click" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center; height:30px" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="3">
                    <asp:GridView ID="gvBookResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Enabled="False" AllowSorting="True" OnSorting="gvBookResult_Sorting" OnPageIndexChanging="gvBookResult_PageIndexChanging">
                        <Columns>
                            <asp:ImageField HeaderText="<%$ Resources:Resource, Cover %>" DataImageUrlField="ImageURL" ReadOnly="True">
                                <ItemStyle Height="84px" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" CssClass="resultImg" />
                            </asp:ImageField>
                            <asp:HyperLinkField HeaderText="<%$ Resources:Resource, BookTitle %>" SortExpression="Title" DataNavigateUrlFields="BookId" DataNavigateUrlFormatString="~/Pages/ReaderPages/bookMessage.aspx?book_id={0}" DataTextField="Title">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Author %>" SortExpression="Author" DataField="Author" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Publisher" HeaderText="<%$ Resources:Resource, Publisher %>" SortExpression="Publisher" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, Select %>">
                                <ItemTemplate>
                                <asp:CheckBox id="CheckBoxDeleteBook" runat="Server" style="zoom:200%;" />
                                </ItemTemplate>
                            </asp:TemplateField>
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


