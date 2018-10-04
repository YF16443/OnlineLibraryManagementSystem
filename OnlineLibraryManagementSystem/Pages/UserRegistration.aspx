<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="Pages_UserRegistration" %>
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
        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,ReaderRegister %>" CssClass="auto-style5"></asp:Label>
        <br /> <br />
        <table class ="style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Account %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxAccount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, IDNumber %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxIDNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Telephone %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxTelephone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Email %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:checkbox runat="server" Id = "IsDeposit" Text="<%$ Resources:Resource, IsDeposit %>" Checked="TRUE" CssClass="auto-style2"></asp:checkbox>
        <br /> <br />
        <div class="style1">
            <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Register %>" OnClick="RegisterReader"  CausesValidation="False" CssClass="auto-style7" />
            <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>" OnClick="Cancel" CausesValidation="False" CssClass="auto-style7" />
        </div>
    </div>
  
      
</asp:Content>