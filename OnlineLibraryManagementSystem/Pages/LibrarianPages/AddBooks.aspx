<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="Pages_Addbooks_ISBN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 35%;
            text-align: right;
            height: 35px;
            font-size: x-large;
            padding: 0px,10px,0px,0px;
        }

        .auto-style4 {
            width: 30%;
            text-align: center;
            height: 35px;
            font-size: x-large;
        }
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
    <div class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Add_Books %>" CssClass="auto-style5"></asp:Label>
        <br />
        <br />
        <table class ="style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, ISBN %>"></asp:Label>
                    &nbsp;
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxISBN" runat="server"></asp:TextBox>
                </td>
                <td style="width:35%;">
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Select_Shelf %>"></asp:Label>
                    &nbsp;
                </td>
                <td class="auto-style4">    
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList> 
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Quantity %>"></asp:Label>
                    &nbsp;
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxQuantity" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="style1">
             <asp:Button ID="AddButton" runat="server" Text="<%$ Resources:Resource, Add %>" OnClick="Addbooks"  CausesValidation="False" CssClass="auto-style7" />
            <asp:Button ID="Print_BarcodeButton" runat="server" Text="<%$ Resources:Resource, Print_Barcode %>" OnClick="Print_Barcode"  CausesValidation="False" CssClass="auto-style7" Visible="False" />
        </div>
    </div>   
</asp:Content>