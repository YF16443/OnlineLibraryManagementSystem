<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="OverdueFineInfo.aspx.cs" Inherits="Pages_LibrarianPages_FineInfo" %>

<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <asp:GridView ID="FineOverdue" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField HeaderText="<%$ Resources:Resource, ReaderId %>" DataField="ReaderID" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, Barcode %>" DataField="BookBarcode" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, IssueTime %>" DataField="IssueTime" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, Status %>" DataField="newStatus" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, ReturnTime %>" DataField="ReturnTime" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, OverDueTime %>" DataField="OverdueLength" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="<%$ Resources:Resource, Fine %>" DataField="Fine" ReadOnly="true" >
            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>

