<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchReader.aspx.cs" Inherits="Pages_SearchReader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style type="text/css">
          .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
            }
           .style2 {
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
      </style>
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <table class ="style1" dir="ltr">

        <tr>
                <td class="style2" >
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:Listitem value="0" Text="<%$ Resources:Resource, Default %>"></asp:Listitem> 
                    <asp:Listitem value="1" Text="<%$ Resources:Resource, Readerid %>"></asp:Listitem> 
                    <asp:Listitem value="2" Text="<%$ Resources:Resource, Name %>"></asp:Listitem> 
                    </asp:DropDownList>
                    <asp:TextBox ID="TextSearch" runat="server" OnTextChanged="TextSearch_TextChanged" ></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="Button2" runat="server" Text="<%$ Resources:Resource, Search %>" BorderColor="Black" ForeColor="Black" Height="40px" Width="100px" OnClick="Search" />    
                </td>
        </tr>
        </table>
    <div class="style1">
    
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <%#Eval("Name") %> <%#Eval("Phone") %><%#Eval("Email") %><a href="<%#Eval("href") %>" ><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Check %>"></asp:Label></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
