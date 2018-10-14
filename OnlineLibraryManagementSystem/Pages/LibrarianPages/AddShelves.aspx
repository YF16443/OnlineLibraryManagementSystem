<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="AddShelves.aspx.cs" Inherits="Pages_AddShelves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    </style>
    <div class="auto-style1">
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Add_Shelves %>" CssClass="auto-style5"></asp:Label>
        <br /> <br />
        <table class ="style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, ShelfId %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxShelfId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, StackId %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxStackId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Shelf_Summary %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxShelf_Summary" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="style1">
             <asp:Button ID="AddButton" runat="server" Text="<%$ Resources:Resource, Add %>" OnClick="AddShelves"  CausesValidation="False" CssClass="auto-style7" />
             <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel" CausesValidation="False" CssClass="auto-style7" />
        </div>
    </div>
  
      
</asp:Content>