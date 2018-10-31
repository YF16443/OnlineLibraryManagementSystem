<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="ReaderRegistration.aspx.cs" Inherits="Pages_ReaderRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="Server">
    <a> <asp:Label runat="server" Text="<%$ Resources:Resource, ReaderRegister %>" CssClass="navbar-brand"></asp:Label> </a>
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
        .auto-style7 {
            font-size: large;
        }
    </style>
    <div class="auto-style1">
        <br /> <br />
        <table class ="style1" dir="ltr">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, Name %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="<%$ Resources:Resource, UserNameError %>" ControlToValidate ="TextBoxName" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, IDNumber %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxIDNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="<%$ Resources:Resource, IdNumberError %>" ControlToValidate="TextBoxIDNumber" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBoxIDNumber" ValidationExpression="^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$" Display="Dynamic" ForeColor="Red" ></asp:RegularExpressionValidator>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Telephone %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxTelephone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="<%$ Resources:Resource, PhoneError %>" ControlToValidate ="TextBoxTelephone" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Email %>"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="<%$ Resources:Resource, EmailError %>" ControlToValidate ="TextBoxEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:checkbox runat="server" Id = "IsDeposit" Text="<%$ Resources:Resource, IsDeposit %>" CssClass="auto-style2"></asp:checkbox>        <br /> <br />
        <div class="style1">
            <asp:Button ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Register %>"  OnClick="RegisterReader"  CausesValidation="True" CssClass="auto-style7" />
    </div>
  
      
</asp:Content>