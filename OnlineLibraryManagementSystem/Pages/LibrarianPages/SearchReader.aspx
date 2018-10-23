<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchReader.aspx.cs" Inherits="Pages_SearchReader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, Search %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <br />
    <table style="width:100%;">
        <tr>
            <td style="width:35%; text-align:right;">
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:Listitem value="0" Text="<%$ Resources:Resource, Default %>"></asp:Listitem> 
                    <asp:Listitem value="1" Text="<%$ Resources:Resource, Readerid %>"></asp:Listitem> 
                    <asp:Listitem value="2" Text="<%$ Resources:Resource, Name %>"></asp:Listitem> 
                </asp:DropDownList>
            </td>
            <td style="width:30%; text-align:center;" >
                <asp:TextBox ID="TextSearch" runat="server" OnTextChanged="TextSearch_TextChanged" Width="400px" ></asp:TextBox>
            </td>
            <td style:30%;>
                <asp:Button ID="Button2" runat="server" Text="<%$ Resources:Resource, Search %>" BorderColor="Black" ForeColor="Black" Width="100px" OnClick="Search"  UseSubmitBehavior="False" />
            </td>
        </tr>
    </table>
    <br />
    <div class="style1">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <%#Eval("Name") %> <%#Eval("Phone") %><%#Eval("Email") %><a href="<%#Eval("href") %>" ><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Check %>"></asp:Label></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <br />
</asp:Content>
