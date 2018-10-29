<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddPeriodicals.aspx.cs" Inherits="Pages_LibrarianPages_AddPeriodicals" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <table style="width: 100%;">
        <tr id="tableHead">
            <td colspan="3">
                <asp:label ID="lbHead" runat="server" text="<%$ Resources:Resource,AddPeriodical %>"></asp:label>
            </td>
        </tr>
        <tr id="cover">
            <td colspan="3">
                <asp:Image ID="imCover" runat="server" />
            </td>
        </tr>
        <tr id="coverUpload">
            <td colspan="3">
                <asp:fileupload ID="fuCover" runat="server"></asp:fileupload>
            </td>
        </tr>
        <tr id="title">
            <td>
                <asp:label ID="lbTitle" runat="server" text="<%$ Resources:Resource,Title %>"></asp:label>
            </td>
            <td>
                <asp:textbox ID="tbTitle" runat="server"></asp:textbox>
            </td>
            <td>
                <asp:requiredfieldvalidator ID="rfvTitle" runat="server" errormessage="*" ControlToValidate="tbTitle"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="country">
            <td>
                <asp:label ID="lbCountry" runat="server" text="<%$ Resources:Resource,Country %>"></asp:label>
            </td>
            <td>
                <asp:textbox ID="tbCountry" runat="server"></asp:textbox>
            </td>
            <td>
                <asp:requiredfieldvalidator ID="rfvCountry" runat="server" errormessage="*" ControlToValidate="tbCountry"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="type">
            <td>
                <asp:label ID="lbType" runat="server" text="<%$ Resources:Resource,Type %>"></asp:label>
            </td>
            <td>
                <asp:dropdownlist ID="ddlType" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource,Magazine %>">Magazine</asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource,Newspaper %>">Newspaper</asp:ListItem>
                </asp:dropdownlist>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr id="issn">
            <td>
                <asp:label ID="lbISSN" runat="server" text="ISSN"></asp:label>
            </td>
            <td>
                <asp:textbox ID="tbISSN" runat="server"></asp:textbox>
            </td>
            <td>
                <asp:requiredfieldvalidator ID="rfvISSN" runat="server" errormessage="*" ControlToValidate="tbISSN"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="price">
            <td>
                <asp:label ID="lbPrice" runat="server" text="<%$ Resources:Resource,Price %>" ></asp:label>
            </td>
            <td>
                <asp:textbox ID="tbPrice" runat="server" TextMode="Number"></asp:textbox>
            </td>
            <td>
                <asp:requiredfieldvalidator ID="rfvPrice" runat="server" errormessage="*" ControlToValidate="tbPrice"></asp:requiredfieldvalidator>
            </td>
        </tr>
        <tr id="shelf">
            <td>
                <asp:label ID="lbShelf" runat="server" text="<%$ Resources:Resource,Shelf %>"></asp:label>
            </td>
            <td>
                <asp:dropdownlist ID="ddlShelf" runat="server"></asp:dropdownlist>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr id="submit">
            <td colspan="3">
                <asp:Button ID="btSubmit" runat="server" Text="<%$ Resources:Resource,Submit %>" OnClick="btSubmit_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

