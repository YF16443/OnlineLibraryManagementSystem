<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="Pages_Addbooks_ISBN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" Runat="Server">
      <a><asp:Label runat="server" Text="<%$ Resources:Resource, Add_Books %>" CssClass="navbar-brand"></asp:Label> </a>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
            margin-top: 0px;
        }
        .auto-style1 {
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
        .auto-style5 {
            font-size: xx-large;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
    <div class="auto-style1">
        <br /> 
        <table class ="style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, ISBN %>"></asp:Label>
                </td>
                <td class="auto-style4">
                <asp:TextBox ID="TextBoxISBN" runat="server"  ></asp:TextBox>
                    <asp:Button ID="ButtonSearch" runat="server" Text="<%$ Resources:Resource, Search %>" OnClick="ButtonSearch_Click" />    
                    <br />
                </td>
            </tr>
            <br>
            <tr>
                <td>
                    &nbsp
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Image ID="Image1" ImageUrl="~/Images/default.jpg" runat="server" Width="200" Hight="400"/>
                </td>
            </tr>
            <tr>
                <td  class="auto-style2">
                    <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource, Upload %>" OnClick="ButtonUpload_Click" />
                </td>
                <td class="auto-style4">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr >
                <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label>
                </td>
                <td class="auto-style4"><asp:TextBox ID="TextBoxTitle" runat="server" ></asp:TextBox></td>
            </tr>
              <tr>
                <td class="auto-style2">
                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Author %>"></asp:Label>
                      </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxAuthor" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, Pubdate %>"></asp:Label>
                 </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPubdate" runat="server" ></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, Price %>"></asp:Label>
                 </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPrice" runat="server" ></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, ISBN13 %>"></asp:Label>
                 </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxISBN13" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, ISBN10 %>"></asp:Label>
                 </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxISBN10" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, Pages %>"></asp:Label>
                 </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPages" runat="server" ></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, Publisher %>"></asp:Label>
                 </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxPublisher" runat="server" ></asp:TextBox>
                </td>
            </tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Position %>"></asp:Label>
                    
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>  
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Quantity %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxQuantity" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        </br>
        <div class="style1">
            </div>
             <asp:Button ID="AddButton" runat="server" Text="<%$ Resources:Resource, Add %>" OnClick="Addbooks"  CausesValidation="False" CssClass="auto-style7" />
            <asp:Button ID="Print_BarcodeButton" runat="server" Text="<%$ Resources:Resource, Print_Barcode %>" OnClick="Print_Barcode"  CausesValidation="False" CssClass="auto-style7" />
        </div>
    </div>   
</asp:Content>