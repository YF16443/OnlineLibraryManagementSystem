<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="BookMessage.aspx.cs" Inherits="Pages_LibrarianPages_BookMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 618px;
            float: left;
        }
        .auto-style2{
            font-size:x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <%-- '<%#Eval("ImageURL") %>' --%>
    
    <div style="float:left">
     <div  class="Image" style="width:350px">
         <table>
            <tr>
            <asp:Image ID="Image1" runat="server" Width="300" Hight="240"/>
                </tr>
             <tr>
                 <td>
                 &nbsp
                     </td>
             </tr>
             <tr>
                 <td class="auto-style2">
                     <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource,Upload %>" OnClick="Upload_Click" />
                 </td>
                 <td class="auto-style2">
                    <asp:FileUpload ID="FileUpload1" runat="server" Text="test" />
                 </td>
                     </tr>
                 </table>
     </div>
        <div class="Bookinfo">
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource, Title %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxtitle" runat="server" ></asp:TextBox>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Author %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxauthor" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Pubdate %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxpubdate" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Price %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxprice" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, ISBN13 %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxisbn13" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, ISBN10 %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxisbn10" runat="server"></asp:TextBox>
            <br/>
<%--    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="subtitle" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="origintitle" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="binding" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="translator" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="catalog" runat="server" Text=""></asp:Label>--%>
            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, Pages %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxpages" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, Publisher %>" class="auto-style2"></asp:Label>
            <asp:TextBox ID="TextBoxpublisher" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, Position %>" class="auto-style2"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            <br/>
              <asp:Button ID="Alter" runat="server" Text="<%$ Resources:Resource,Alter %>" OnClick="Alter_Click" class="auto-style2"/>
    </div>
        </div>
    <div>
        <asp:GridView ID="gvBookBarcodeResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Enabled="False" AllowSorting="True" OnSorting="gvBookBarcodeResult_Sorting" OnPageIndexChanging="gvBookBarcodeResult_PageIndexChanging" OnSelectedIndexChanged="gvBookBarcodeResult_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Barcode %>" SortExpression="BookBarcode" DataField="BookBarcode" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, BookId %>" SortExpression="BookId" DataField="BookId" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ShelfId" HeaderText="<%$ Resources:Resource, ShelfId %>" SortExpression="ShelfId" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="newStatus" HeaderText="<%$ Resources:Resource, Status %>" SortExpression="newStatus" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Timestamp" HeaderText="<%$ Resources:Resource, Barcode_Timestamp %>" SortExpression="Timestamp" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, Print_Barcode %>">
                                <ItemTemplate>
                                    <asp:Button ID="ButtonPrint_Barcode" runat="server" Text="<%$ Resources:Resource, Print %>" CommandArgument='<%# Eval("BookBarcode") %>' OnClick="ButtonPrint_Barcode_Click" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, Select %>">
                                <ItemTemplate>
                                <asp:CheckBox id="CheckBoxDeleteBook" runat="Server" style="zoom:200%; text-align:center" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
    </div>
    <br/>

</asp:Content>
