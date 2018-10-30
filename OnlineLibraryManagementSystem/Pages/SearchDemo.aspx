<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ReaderPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchDemo.aspx.cs" Inherits="Pages_SearchDemo" %>



<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../assets/vendors/daterangepicker/styles/vendor.css" rel="stylesheet" />
    <link href="../../assets/vendors/daterangepicker/styles/daterangepicker.css" rel="stylesheet" />
    <meta charset="UTF-8">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../../assets/slider/css/edslider.css">
	<link rel="stylesheet" href="../../assets/slider/css/styles.css">
	<link rel="stylesheet" href="../../assets/slider/css/animate-custom.css">
    <style type="text/css">
        .resultImg img{
            max-height:84px;
            max-width:60px;
        }
    </style>
    <script src="../Scripts/art-Template/template-web.js"></script>
</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div style="padding-top:50px">
        <table style="width: 100%;">
            <tr>
                <td style="width:35%; text-align:right">
                    <asp:DropDownList ID="ddlField" runat="server">
                        <asp:ListItem Text="<%$ Resources:Resource,Title %>" Value="Title"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,Author %>" Value="Author"></asp:ListItem>
                        <asp:ListItem Text="ISBN" Value="ISBN"></asp:ListItem>
                        <asp:ListItem Text="ISSN" Value="ISSN" Enabled="false"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width:30%">
                  <asp:textbox id="tbSearch" runat="server" Width="450px" OnTextChanged="tbSearch_TextChanged" ></asp:TextBox>
                    
                </td>
                <td style="width:35%">
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        <asp:ListItem Text="<%$ Resources:Resource,Book %>" Value="Books" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,Periodical %>" Value="Periodicals"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="brSearch" runat="server" Text="<%$ Resources:Resource,Search %>" OnClick="brSearch_Click" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center; height:30px" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="3">
                    <asp:GridView ID="gvBookResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Enabled="False" AllowSorting="True" OnSorting="gvBookResult_Sorting" OnPageIndexChanging="gvBookResult_PageIndexChanging">
                        <Columns>
                            <asp:ImageField HeaderText="<%$ Resources:Resource, Cover %>" DataImageUrlField="ImageURL" ReadOnly="True">
                                <ItemStyle Height="84px" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" CssClass="resultImg" />
                            </asp:ImageField>
                            <asp:HyperLinkField HeaderText="<%$ Resources:Resource, BookTitle %>" SortExpression="Title" DataNavigateUrlFields="BookId" DataNavigateUrlFormatString="~/Pages/ReaderPages/bookMessage.aspx?book_id={0}" DataTextField="Title">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Author %>" SortExpression="Author" DataField="Author" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Publisher" HeaderText="<%$ Resources:Resource, Publisher %>" SortExpression="Publisher" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="gvPeriodicalResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" ShowHeader="False" Enabled="False">
                        <Columns>
                            <asp:HyperLinkField ShowHeader="False" DataTextField="Title">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:HyperLinkField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
    </div>
    <div class="container" ID="notice" runat="server">
		<ul class="mySlideshow">
			<li class="first">
				<div class="animated fadeInRight">
                    <asp:label id="notice1" runat="server" text="No announcement!"></asp:label>
                   
                </div>

			</li>
			<li class="second">
				<div class="animated fadeInLeft">
                    <asp:label id="notice2" runat="server" text="No announcement!"></asp:label>
				</div>
			</li>
			<li class="third">
				<div class="animated fadeInRight">
                    <asp:label id="notice3" runat="server" text="No announcement!"></asp:label>
				</div>
			</li>
			<li class="fourth">
				<div class="animated fadeInLeft">
                    <asp:label id="notice4" runat="server" text="No announcement!"></asp:label>
                    
				</div>
			</li>
			<li class="fifth">
				<div class="animated fadeInRight">
                    <asp:label id="notice5" runat="server" text="No announcement!"></asp:label>
				</div>
			</li>
		</ul>
  <center><a href="ReaderPages/ViewNotice.aspx"><asp:Label ID="search" runat="server" Text="<%$ Resources:Resource, MoreNotices %>"  /></a></center>
	</div>

	
	<script src="../../assets/slider/js/jquery-1.11.0.min.js"></script>
	<script src="../../assets/slider/js/jquery.edslider.js"></script>
	<script>
		$(document).ready(function(){
			//Call plugin
			$('.mySlideshow').edslider({
				width : '100%',
				height: 500
			});
		});
	</script>
     
    <script>
        $("#<%=tbSearch.ClientID %>").bind('input propertychange', function () {
            var body_notice = document.getElementById('<%=notice.ClientID %>');
            if ($(this).val()) {
                body_notice.setAttribute("style","visibility:hidden;");
            }
            else {
                body_notice.setAttribute("style","visibility:visible;");
      
            }
    });
</script>


</asp:Content>



