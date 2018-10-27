<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="EditStack.aspx.cs" Inherits="Pages_LibrarianPages_EditStack" %>

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
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Details %>" CssClass="auto-style5"></asp:Label>
        <br /> <br />
        <table class ="style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource,StackId %>"></asp:Label>
                </td>
                <td class="auto-style4">
          
                    <asp:TextBox ID="TextBoxStackId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Position %>"></asp:Label>
                </td>
                <td class="auto-style4">
 
                    <asp:TextBox ID="TextBoxPosition" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Stack_Summary %>"></asp:Label>
                </td>
                <td class="auto-style4">
        
                    <asp:TextBox ID="TextBoxSummary" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Stack_Timestamp %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="LabelStack_Timestamp" runat="server" Text="LabelStack_Timestamp"></asp:Label>
                </td>
            </tr>
        </table>
        <div class="style1">
            <asp:Button ID="AlterButton" runat="server" Text="<%$ Resources:Resource, Alter %>" OnClick="Alter_StackInfo" CausesValidation="False" CssClass="auto-style7" />
            <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel" CausesValidation="False" CssClass="auto-style7" />
            <br>
            <asp:Label ID="Label6" runat="server" Text="（StackId Example：A-101）"></asp:Label>
        </div>
    </div>
  
      
</asp:Content>