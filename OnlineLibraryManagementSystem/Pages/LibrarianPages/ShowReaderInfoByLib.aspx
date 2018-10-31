<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="ShowReaderInfoByLib.aspx.cs" Inherits="Pages_ShowReaderInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, ReaderInfo %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
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
        .auto-style1 {
            text-align: center;
            margin:0 auto;
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
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            font-size: x-large;
            background-color: #e8e8e8;
        }
        .auto-style9 {
            font-size: x-large;
        }

    </style>
    <div class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,ReaderInfo %>" CssClass="auto-style5"></asp:Label>
        <br /> <br />
        <table class ="style1"> 
           
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Telephone %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPhone" runat="server" Text="" OnTextChanged="TextBoxPhone_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxName" runat="server" Text="" OnTextChanged="TextBoxName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, IDNumber %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxIDNumber" runat="server" Text="" OnTextChanged="TextBoxIDNumber_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Email %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Text="" OnTextChanged="TextBoxEmail_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, Password %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPassword" runat="server" Text="" OnTextChanged="TextBoxPassword_TextChanged"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <div class="style1">
            <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Submit %>" OnClick="Submit" CausesValidation="False" CssClass="auto-style7" />
        </div>
        <div class="style1">
            <asp:Button ID="Button" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="Delete" CausesValidation="False" CssClass="auto-style7" />
        </div>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand2">
            <HeaderTemplate>
            <table class ="style2">
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
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, Status %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, Fine %>"></asp:Label>
                    </td>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
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
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "status") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "fine") %>
                </td>
            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
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
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "status") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "fine") %>
                </td>
            </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
            </table>
            </FooterTemplate>
        </asp:Repeater>
        <div class="style1">
            <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, BackingOut %>" OnClick="Cancel" CausesValidation="False" CssClass="auto-style7" />
        </div>
    </div>
</asp:Content>