<%@ Master Language="C#" AutoEventWireup="true" CodeFile="Master.aspx.cs" Inherits="Pages_MasterPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Bibliosoft</title>
    <link rel="icon" href="~/Images/headicon.ico" type="image/x-ico"/>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/bootstrap-reboot.min.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/bootstrap-grid.min.css" rel="stylesheet" type="text/css" />
    <asp:ContentPlaceHolder id="head" runat="server"></asp:ContentPlaceHolder>
</head>
<body>
    <form id="form" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td style="width:150px">
                        <asp:ImageButton ID="ibLogo" runat="server" ImageUrl="~/Images/logo.png" PostBackUrl="~/Pages/SearchDemo.aspx" Height="43.2px" Width="145.35px"/>
                    </td>
                    <td>
                        <asp:Menu ID="LibrarianMenu" runat="server" DisappearAfter="0" Orientation="Horizontal" RenderingMode="List">
                            <Items>
                                <asp:MenuItem Text="<%$ Resources:Resource,BookCirculation %>" Value="Circulation" Selectable="False">
                                    <asp:MenuItem Text="<%$ Resources:Resource,Issue %>" Value="Issue" NavigateUrl="~/Pages/LibrarianPages/IssueBookDemo.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,Return %>" Value="Return" NavigateUrl="~/Pages/LibrarianPages/ReturnBookDemo.aspx"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="<%$ Resources:Resource,BookManagement %>" Value="BookManagement" Selectable="False">
                                    <asp:MenuItem Text="<%$ Resources:Resource,AddBook %>" Value="AddBook" NavigateUrl="~/Pages/LibrarianPages/AddBooks.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,AddPeriodical %>" Value="AddPeriodical" NavigateUrl="~/Pages/LibrarianPages/AddPeriodicals.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,Search %>" Value="Search" NavigateUrl="~/Pages/LibrarianPages/SearchBooks.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,OperationHistory %>" Value="OperationHistory" NavigateUrl="~/Pages/LibrarianPages/OperationHistory.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,Category %>" Value="Category" NavigateUrl="~/Pages/LibrarianPages/CategoryManagement.aspx"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="<%$ Resources:Resource,StacksManagement %>" Value="StackManagement" Selectable="False">
                                    <asp:MenuItem Text="<%$ Resources:Resource,Search %>" Value="Search" NavigateUrl="~/Pages/LibrarianPages/Search_Stacks_Shelves.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,AddStack %>" Value="AddStack" NavigateUrl="~/Pages/LibrarianPages/EditStack.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,AddShelf %>" Value="AddShelf" NavigateUrl="~/Pages/LibrarianPages/AddShelves.aspx"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="<%$ Resources:Resource,ReaderManagement %>" Value="ReaderManagement" Selectable="False">
                                    <asp:MenuItem Text="<%$ Resources:Resource,Register %>" Value="Register" NavigateUrl="~/Pages/LibrarianPages/ReaderRegistration.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="<%$ Resources:Resource,Search %>" Value="Search" NavigateUrl="~/Pages/LibrarianPages/SearchReader.aspx"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="<%$ Resources:Resource,Statistics %>" Value="Statistics"></asp:MenuItem>
                                <asp:MenuItem Text="<%$ Resources:Resource,NoticeManagement %>" Value="NoticeManagement"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </td>
                    <td style="width:120px">
                        <asp:LoginView ID="LoginView" runat="server">
                            <AnonymousTemplate>
                                <asp:LinkButton ID="lbLogin" runat="server" Text="<%$ Resources:Resource,Login %>" PostBackUrl="~/Pages/LibrarianLogin.aspx"></asp:LinkButton>
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <asp:LinkButton ID="lbLogout" runat="server" Text="<%$ Resources:Resource,Logout %>" OnClick="lbLogout_Click"></asp:LinkButton>
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </td>
                    <td style="width:100px">
                        <asp:DropDownList ID="ddlLanguages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLanguages_SelectedIndexChanged">
                            <asp:ListItem Value="zh-CN">简体中文</asp:ListItem>
                            <asp:ListItem Value="en-US">English</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:ContentPlaceHolder id="body" runat="server"></asp:ContentPlaceHolder>
        </div>
        <div style="text-align:center">
            <asp:HyperLink ID="hlAboutUs" runat="server" Text="<%$ Resources:Resource,AboutUs %>" NavigateUrl="~/Pages/AboutUs.aspx"></asp:HyperLink>
        </div>
    </form>
</body>
</html>
