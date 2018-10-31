<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddPeriodicals.aspx.cs" Inherits="Pages_LibrarianPages_AddPeriodicals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" Runat="Server">
      <a><asp:Label runat="server" Text="<%$ Resources:Resource, AddPeriodical %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>

<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
            margin-top: 0px;
        }
        .auto-style1 {
            width: 100%;
            text-align: center;
        }
        .auto-style2 {
            width:40%;
            text-align: right;
            height: 35px;
            font-size: x-large;
        }

        .auto-style4 {
            width:50%;
            text-align: left;
            height: 35px;
            font-size: x-large;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
    <table class="style1">
        <tr id="cover">
            <td colspan="2">
                <asp:Image ID="imCover" ImageUrl="~/Images/default.jpg" runat="server" Width="200" Hight="400"/>
            </td>
        </tr>
        <tr id="coverUpload">
            <td  class="auto-style2">
                    <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource, Upload %>" OnClick="ButtonUpload_Click" />
                </td>
            <td  class="auto-style2">
                <asp:fileupload ID="fuCover" runat="server"></asp:fileupload>
            </td>
        </tr>
        <tr id="title">
            <td class="auto-style2">
                <asp:label ID="lbTitle" runat="server" text="<%$ Resources:Resource,Title %>"></asp:label>
            </td>
            <td class="auto-style4">
                <asp:textbox ID="tbTitle" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator ID="rfvTitle" runat="server" errormessage="*" ControlToValidate="tbTitle"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="country">
            <td class="auto-style2">
                <asp:label ID="lbCountry" runat="server" text="<%$ Resources:Resource,Country %>"></asp:label>
            </td>
            <td class="auto-style4">
                <asp:textbox ID="tbCountry" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator ID="rfvCountry" runat="server" errormessage="*" ControlToValidate="tbCountry"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="type">
            <td class="auto-style2">
                <asp:label ID="lbType" runat="server" text="<%$ Resources:Resource,Type %>"></asp:label>
            </td>
            <td class="auto-style4">
                <asp:dropdownlist ID="ddlType" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource,Magazine %>" Value="0">Magazine</asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource,Newspaper %>" Value="1">Newspaper</asp:ListItem>
                </asp:dropdownlist>
            </td>
        </tr>
        <tr id="issn">
            <td class="auto-style2">
                <asp:label ID="lbISSN" runat="server" text="ISSN"></asp:label>
            </td>
            <td class="auto-style4">
                <asp:textbox ID="tbISSN" runat="server"></asp:textbox>
                <asp:requiredfieldvalidator ID="rfvISSN" runat="server" errormessage="*" ControlToValidate="tbISSN"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="price">
            <td class="auto-style2">
                <asp:label ID="lbPrice" runat="server" text="<%$ Resources:Resource,Price %>" ></asp:label>
            </td>
            <td class="auto-style4">
                <asp:textbox ID="tbPrice" runat="server" TextMode="Number"></asp:textbox>
                <asp:requiredfieldvalidator ID="rfvPrice" runat="server" errormessage="*" ControlToValidate="tbPrice"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="shelf">
            <td class="auto-style2">
                <asp:label ID="lbShelf" runat="server" text="<%$ Resources:Resource,Shelf %>"></asp:label>
            </td>
            <td class="auto-style4">
                <asp:dropdownlist ID="ddlShelf" runat="server"></asp:dropdownlist>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btSubmit" runat="server" Text="<%$ Resources:Resource,Submit %>" OnClick="btSubmit_Click" CssClass="auto-style7"/>
            </td>
            </tr>
    </table>
</asp:Content>

