<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="Pages_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .right {
            text-align:right;
            height:25px;
             width: 85%;
        }

        .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
        }
        .style2{
            height: 35px;
           
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <div class="style2">

    </div>
    
    <div class="right">
<%--    <select id="Select1" dir="ltr" name="D1">

        <option value="1"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Book %>"></asp:Label></option>
        <option value="2"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, BookPeriodicalNews %>"></asp:Label></option>
    </select>--%>
    </div>

    <table class ="style1" dir="ltr">

        <tr>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:Listitem value="0">默认</asp:Listitem> 
                    <asp:Listitem value="1">图书</asp:Listitem> 
                    <asp:Listitem value="2">作者</asp:Listitem> 
                    <asp:Listitem value="3">ISSN</asp:Listitem> 
                    </asp:DropDownList>
                    <asp:TextBox ID="TextSearch" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="Button2" runat="server" Text="<%$ Resources:Resource, Search %>" BorderColor="Black" ForeColor="Black" Height="40px" Width="100px" OnClick="Search" />
                    
                </td>
        </tr>

<%--            <tr>
                <td class="auto-style2" colspan="1" dir="ltr">
                    图书名称</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBookName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="1" dir="ltr">
                    图书书号</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBookNum" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="1" dir="ltr">
                    图书作者</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBookAur" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="1" dir="ltr">
                    图书日期</td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBookDate" runat="server"></asp:TextBox>
                </td>
            </tr>--%>
        </table>
<%--    <div class="style1">
    <asp:Button ID="Button1" runat="server" Text="查询" BorderColor="Black" ForeColor="Black" Height="40px" Width="100px" OnClick="Search" />
    </div>--%>

    <div class="style1">
    
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <%#Eval("Title") %> <a href="<%#Eval("href") %>" ><asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Check %>"></asp:Label></a>
            </ItemTemplate>
        </asp:Repeater>
    
    </div>

        </asp:Content>

