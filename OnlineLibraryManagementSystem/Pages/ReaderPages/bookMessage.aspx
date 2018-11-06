<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ReaderPages/MasterPage.master" AutoEventWireup="true" CodeFile="bookMessage.aspx.cs" Inherits="Pages_bookMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 930px;
            height: 200px;
            text-align:center;
        }
        .auto-style3 {
            width: 618px;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    
    <%-- '<%#Eval("ImageURL") %>' --%>
    <div style="border: #333333; border-style: dashed; border-top-width: 1px;
              border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px">
    <div class="auto-style2">
     <div style="text-align:center;float:left;width:200px">
    <asp:Image ID="Image1" runat="server" Width="110" Hight="120"/>
     </div>
        <div style="text-align:left;" class="auto-style3">
    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Title %>"></asp:Label>
    <asp:Label ID="title" runat="server" Text=""></asp:Label><br/>
    
    
    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource,Author %>"></asp:Label>
    
    <asp:Label ID="author" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource,PublishDate %>"></asp:Label>
    <asp:Label ID="pubDate" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource,Price %>"></asp:Label>
    <asp:Label ID="price" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="Label5" runat="server" Text="ISBN13"></asp:Label>
    <asp:Label ID="isbn13" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label6" runat="server" Text="ISBN10"></asp:Label>
    <asp:Label ID="isbn10" runat="server" Text=""></asp:Label><br/>
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
    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource,Pages %>"></asp:Label>
    <asp:Label ID="pages" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource,Publisher %>"></asp:Label>
    <asp:Label ID="publisher" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource,Position %>"></asp:Label>
            <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
            <br/>
    </div>
    <asp:Button ID="reserve" runat="server" Text="<%$ Resources:Resource,Reserve %>" OnClick="reserve_Click" />
    
        </div>
    </div>
    <br />

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                        <Columns>
                            
                            
                            <asp:BoundField DataField="BookBarcode" HeaderText="BookBarcode" HeaderStyle-CssClass="text-primary"/>
                            <asp:BoundField DataField="BookId" HeaderText="<%$ Resources:Resource,BookId %>" HeaderStyle-CssClass="text-primary"/>
                            <asp:BoundField DataField="ShelfId" HeaderText="<%$ Resources:Resource,ShelfId %>" HeaderStyle-CssClass="text-primary"/>
                            <asp:BoundField DataField="Status" HeaderText="<%$ Resources:Resource,Status %>" HeaderStyle-CssClass="text-primary"/>
                        </Columns>
                    </asp:GridView>
</asp:Content>

