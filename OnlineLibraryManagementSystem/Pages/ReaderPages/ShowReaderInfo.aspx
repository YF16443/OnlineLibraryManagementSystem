<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ReaderPages/MasterPage.master" AutoEventWireup="true" CodeFile="ShowReaderInfo.aspx.cs" Inherits="Pages_ShowReaderInfo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
        }
        .style2 {
            width: auto;
            text-align: center;
            font-family: Consolas;
            margin:auto;

        }
        .auto-style2 {
            width: 50%;
            text-align: right;
            height: 35px;
            font-size: x-large;
        }

        .auto-style4 {
            width: 50%;
            text-align: left;
            height: 35px;
            font-size: x-large;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style8 {
            font-size: x-large;
            background-color: #e8e8e8;
        }
        .auto-style9 {
            font-size: x-large;
        }
    </style>
</asp:Content>

<asp:Content ID="body" runat="server" contentplaceholderid="body">
    <div style="text-align:center;">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,ReaderInfo %>" CssClass="auto-style5"></asp:Label>
        <br />
        <br />
        <table class ="style1">
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
        <br />
        <div style="margin:0px; text-align:center;">
        <table style="text-align:center; margin: 0px auto; width:100%;">
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table>
                <tr class ="auto-style9">
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, BookTitle %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, IssueTime %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, ReturnTime %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, OverDueTime %>"></asp:Label>
                    </td>
                </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
            <table>
            <tr class="auto-style9">
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "title") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "issueTime") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "returnTime") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "overdueTime") %>
                </td>
            </tr>
            </table>
            </ItemTemplate>
            <AlternatingItemTemplate>
            <table>
            <tr class ="auto-style8">
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "title") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "issueTime") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "returnTime") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "overdueTime") %>
                </td>
            </tr>
            </table>
            </AlternatingItemTemplate>
        </asp:Repeater>
        </table>
        </div>
        <div class="style1">
        </div>
    </div>
</asp:Content>