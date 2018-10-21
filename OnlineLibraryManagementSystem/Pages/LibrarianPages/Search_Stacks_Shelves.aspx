<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Search_Stacks_Shelves.aspx.cs" Inherits="Pages_Search_Stacks_Shelves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <style type="text/css">
        .style1 {
            width: 100%;
            font-family: Consolas;
        }
        .auto-style1 {
            padding-top:50px;
            text-align:center;
        }
        .auto-style2 {
            width: 35%;
            height: 35px;
            text-align: right;
            font-size: x-large;
        }

        .auto-style4 {
            width: 30%;
            height: 35px;
            text-align:left;
            font-size: x-large;
        }
        .auto-style5 {
            width:35%;
            height:35px;
            text-align:left;
            font-size:x-large;
        }
        </style>
    <div class="auto-style1">
        <table class="style1">
            <tr>
                <td class="auto-style2">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Text="<%$ Resources:Resource,StackId %>" Value="Stacks"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,ShelfId %>" Value="Shelves"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxID" runat="server" Width="450px"> </asp:TextBox></td>
                <td class="auto-style5">
                    <asp:Button ID="SearchButton" runat="server" Text="<%$ Resources:Resource,Search %>" OnClick="Search" />
                    <asp:Button ID="Button1" runat="server" Text="<%$ Resources:Resource, Delete %>" OnClick="Delete"  CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center; height:30px" colspan="3"> &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="3">
                    <asp:GridView ID="gvStacksResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Enabled="False" AllowSorting="True" OnSorting="gvStacksResult_Sorting" OnPageIndexChanging="gvStacksResult_PageIndexChanging">
                        <Columns>
                            <asp:HyperLinkField HeaderText="<%$ Resources:Resource, StackId %>" SortExpression="StackId" DataNavigateUrlFields="StackId" DataNavigateUrlFormatString="~/Pages/LibrarianPages/StackInfo.aspx?StackId={0}" DataTextField="StackId">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Position %>" SortExpression="Position" DataField="Position" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Summary" HeaderText="<%$ Resources:Resource, Stack_Summary %>" SortExpression="Summary" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, Select %>">
                                <ItemTemplate>
                                <asp:CheckBox id="CheckBoxDeleteStack" runat="Server" style="zoom:200%;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="gvShelvesResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Enabled="False" AllowSorting="True" OnSorting="gvShelvesResult_Sorting" OnPageIndexChanging="gvShelvesResult_PageIndexChanging">
                        <Columns>
                            <asp:HyperLinkField HeaderText="<%$ Resources:Resource, ShelfId %>" SortExpression="ShelfId" DataNavigateUrlFields="ShelfId" DataNavigateUrlFormatString="~/Pages/LibrarianPages/ShelfInfo.aspx?ShelfId={0}" DataTextField="ShelfId">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, StackId %>" SortExpression="StackId" DataField="StackId" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Summary" HeaderText="<%$ Resources:Resource, Shelf_Summary %>" SortExpression="Summary" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, Select %>">
                                <ItemTemplate>
                                <asp:CheckBox id="CheckBoxDeleteShelf" runat="Server" style="zoom:200%;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
  
      
</asp:Content>