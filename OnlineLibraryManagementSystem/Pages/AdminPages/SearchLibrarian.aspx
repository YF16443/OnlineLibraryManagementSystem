<%@ Page Language="C#" MasterPageFile="~/Pages/AdminPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchLibrarian.aspx.cs" Inherits="Pages_AdminPages_SearchLibrarian" %>
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
<%--<!DOCTYPE html>--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>--%>
<%--    <form id="form1" runat="server">--%>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div style="text-align:center">
    
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="Black" GridLines="Vertical" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" Height="264px" Width="720px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                        <FooterStyle BackColor="#CCCC99" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="LibrarianId" HeaderText="LibrarianId" ReadOnly="True" />
                            
                            <asp:BoundField DataField="Account" HeaderText="<%$ Resources:Resource, Account %>" />
                            <asp:BoundField DataField="Password" HeaderText="<%$ Resources:Resource, Password %>" />
                            <asp:BoundField DataField="Name" HeaderText="<%$ Resources:Resource, Name %>" />
                            <asp:CommandField HeaderText="<%$ Resources:Resource, Select %>" ShowSelectButton="True" />
                            <asp:CommandField HeaderText="<%$ Resources:Resource, Edit %>" ShowEditButton="True" />
                            <asp:CommandField HeaderText="<%$ Resources:Resource, Delete %>" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>

        
            <%--Table开始--%>
            <table border="1" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="140"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="120"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="120"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="105"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="<%$ Resources:Resource, Add %>" OnClick="Button1_Click" />
                    </td>
                   
                </tr>
            </table>
            <%--Table结束--%>
            <%--Button开始--%>
            <%--Button结束--%>


    </div>
    </asp:Content>
<%--    </form>
</body>
</html>--%>
