<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/ReaderPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchDemo.aspx.cs" Inherits="Pages_SearchDemo" %>



<asp:Content ID="head" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .resultImg img{
            max-height:84px;
            max-width:60px;
        }
    </style>
    <link href="../assets/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
    <link href="../assets/vendors/jquery-ui-1.12.0/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../assets/slider/css/edslider.css">
	<link rel="stylesheet" href="../../assets/slider/css/styles.css">
	<link rel="stylesheet" href="../../assets/slider/css/animate-custom.css">

</asp:Content>
<asp:Content ID="body" ContentPlaceHolderID="body" Runat="Server">
    <div style="padding-top:50px">
        <table style="width: 100%;">
            <tr>
                <td style="width:30%; text-align:right">
                    <div class="col-md-4 col-md-offset-8">
                        <asp:DropDownList ID="ddlField" runat="server" CssClass="selectpicker" data-style="btn btn-primary btn-round">
                            <asp:ListItem Text="<%$ Resources:Resource,Title %>" Value="Title"></asp:ListItem>
                            <asp:ListItem Text="<%$ Resources:Resource,Author %>" Value="Author"></asp:ListItem>
                            <asp:ListItem Text="ISBN" Value="ISBN"></asp:ListItem>
                            <asp:ListItem Text="ISSN" Value="ISSN" Enabled="false"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </td>
                <td style="width:30%">
                    <asp:TextBox ID="tbSearch" runat="server" Width="450px" CssClass="form-control"></asp:TextBox>
                </td>
                <td style="width:40%">
                    <div class="col-md-3">
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" CssClass="selectpicker" data-style="btn btn-primary btn-round">
                        <asp:ListItem Text="<%$ Resources:Resource,Book %>" Value="Books" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="<%$ Resources:Resource,Periodical %>" Value="Periodicals"></asp:ListItem>
                    </asp:DropDownList>
                        </div>
                    <asp:Button ID="brSearch" runat="server" Text="<%$ Resources:Resource,Search %>" OnClick="brSearch_Click" CssClass="btn btn-default btn-fill" />
                </td>
            </tr>
            <tr>
                <td style="text-align:center; height:30px" colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <div class="table-responsive">
                <td style="text-align:center" colspan="3">
                    <asp:GridView ID="gvBookResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" Enabled="False" AllowSorting="True" OnSorting="gvBookResult_Sorting" OnPageIndexChanging="gvBookResult_PageIndexChanging" CssClass="table table-no-bordered">
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
                    <asp:GridView ID="gvPeriodicalResult" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"  Enabled="False" AllowSorting="True" OnSorting="gvBookResult_Sorting" OnPageIndexChanging="gvBookResult_PageIndexChanging" CssClass="table table-no-bordered">
                        <Columns>
                            <asp:ImageField HeaderText="<%$ Resources:Resource, Cover %>" DataImageUrlField="ImageURL" ReadOnly="True">
                                <ItemStyle Height="84px" HorizontalAlign="Center" VerticalAlign="Middle" Width="60px" CssClass="resultImg" />
                            </asp:ImageField>
                             <asp:BoundField HeaderText="<%$ Resources:Resource, Title %>"  DataField="Title" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, ISSN %>" SortExpression="Title" DataField="ISSN" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Country %>"  DataField="Country" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Type %>"  DataField="NewType" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="<%$ Resources:Resource, Price %>" SortExpression="Price" DataField="Price" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
                </div>
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

	



</asp:Content>
<asp:Content ID="foot" runat="server" ContentPlaceHolderID="foot">
    <script src="../Scripts/art-Template/template-web.js"></script>
    <script src="../assets/vendors/dropzone/dropzone.min.js"></script>
    <script src="../assets/vendors/jquery.select-bootstrap.js"></script>
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
        ("#<%=tbSearch.ClientID %>").bind('input propertychange', function () {
            var body_notice = document.getElementById('<%=notice.ClientID %>');
            if (($this).val()) {
                body_notice.setAttribute("style","visibility:hidden;");
            }
            else {
                body_notice.setAttribute("style","visibility:visible;");
      
            }
    });
</script>
</asp:Content>



