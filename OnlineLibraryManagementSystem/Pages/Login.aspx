<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">

    <div>
        <asp:Login ID="Login1" runat="server" LoginButtonText="<%$ Resources:Resource,Login_Login %>" PasswordLabelText="<%$ Resources:Resource,Login_Password %>" RememberMeText="<%$ Resources:Resource,Login_Remember %>" TitleText="<%$ Resources:Resource,Login_Login %>" UserNameLabelText="<%$ Resources:Resource,Login_UsrName %>" Width="304px" DestinationPageUrl="~/Pages/TestPage.aspx" OnAuthenticate="Login1_Authenticate">
        </asp:Login>
    </div>

</asp:Content>
