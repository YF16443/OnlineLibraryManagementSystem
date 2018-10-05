<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="IssueBooks.aspx.cs" Inherits="Pages_IssueBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 50%;
            text-align: right;
            height: 35px;
        }
        .auto-style4 {
            width: 50%;
            text-align: left;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div>
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:Resource,Issue_Title %>"></asp:Label>
        </div>
        <br />
            <table class="style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource,Issue_Reader %>"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource,Issue_BookID %>"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        <div class="style1">
                <asp:Button ID="Button1" runat="server" Text="<%$ Resources:Resource,Issue_Execute %>" OnClick="Button1_Click" />
                &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="<%$ Resources:Resource,Issue_Scan %>" CausesValidation="False" OnClick="Button2_Click" />
        </div>
    </div>
</asp:Content>
