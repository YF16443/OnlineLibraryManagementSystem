<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/LibrarianPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddBooks.aspx.cs" Inherits="Pages_Addbooks_ISBN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" Runat="Server">
      <a><asp:Label runat="server" Text="<%$ Resources:Resource, Add_Books %>" CssClass="navbar-brand"></asp:Label> </a>
     <link href="../../assets/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
    <link href="../../assets/vendors/jquery-ui-1.12.0/jquery-ui.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="body">
    <style type="text/css">
        .style1 {
            width: 100%;
            text-align: center;
            font-family: Consolas;
            margin-top: 0px;
        }
        </style>
    <div class="card">
        <div class="content">
            <fieldset style="text-align:center;">    
                <div class="form-group">
                                                <div >
                                                <asp:Image ID="Image1" ImageUrl="~/Images/default.jpg" runat="server" Width="200" Hight="400"/>
                                                </div>
                    <div>
                        &nbsp
                        </div>
                                                <div>
                                                    <asp:Button ID="ButtonUpload" runat="server" Text="<%$ Resources:Resource, Upload %>" OnClick="ButtonUpload_Click" CssClass="btn btn-fill btn-default"/>                            
                                                    <input type=button value="<asp:Literal runat="server" Text="<%$ Resources:Resource, Selectimage%>" />" onclick=fileupload.click() Class="btn btn-fill btn-default">
                                                        <input type="file" id="fileupload" name="fileupload"  style="display: none;" onchange="filepath.value=this.value"/>                                                      
                                                        <label><input type="Text" id="filepath" name="filepath" value="" class="form-control" style="width:400px;"></label>                                                        
                                                </div>
                    </div>                                        
                </fieldset>
             <fieldset>
                 <asp:Panel ID="panSearch" runat="server" DefaultButton="ButtonSearch">  
	                 <div class="form-group" >
                      <label class="col-sm-1 control-label"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, ISBN %>"></asp:Label></label>
                        <div class="col-sm-10">
                          <asp:TextBox ID="TextBoxISBN" runat="server" Cssclass="form-control"></asp:TextBox>
                        </div>
                         <asp:Button ID="ButtonSearch" runat="server" Text="<%$ Resources:Resource, Search %>" OnClick="ButtonSearch_Click" CssClass="btn btn-fill btn-default" />        
	                   </div>
                   </asp:Panel>
	              </fieldset>
              <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"><asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, Title %>"></asp:Label></label>
	                   <div class="col-sm-11">
                           <asp:TextBox ID="TextBoxTitle" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
                  &nbsp
                    <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, Author %>"></asp:Label></label>
	                   <div class="col-sm-11">
                           <asp:TextBox ID="TextBoxAuthor" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
            <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"><asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, Pubdate %>"></asp:Label></label>
	                   <div class="col-sm-11">
                           <asp:TextBox ID="TextBoxPubdate" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
  <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"><asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, Price %>"></asp:Label></label>
	                   <div class="col-sm-11">
                           <asp:TextBox ID="TextBoxPrice" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
<fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"><asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, ISBN13 %>"></asp:Label></label>
	                   <div class="col-sm-11">
                           <asp:TextBox ID="TextBoxISBN13" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
 <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"> <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, ISBN10 %>"></asp:Label></label>
	                   <div class="col-sm-11">
                           <asp:TextBox ID="TextBoxISBN10" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
  <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"> <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, Pages %>"></asp:Label></label>
	                   <div class="col-sm-11">
                            <asp:TextBox ID="TextBoxPages" runat="server"  Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
<fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label"> <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, Publisher %>"></asp:Label></label>
	                   <div class="col-sm-11">
                            <asp:TextBox ID="TextBoxPublisher" runat="server"    Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
 <fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label">  <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Position %>"></asp:Label></label>
	                   <div class="col-sm-2">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="selectpicker" data-style="btn btn-primary btn-round"></asp:DropDownList>  
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
<fieldset>
	                <div class="form-group">
	                   <label class="col-sm-1 control-label">  <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, Quantity %>"></asp:Label></label>
	                   <div class="col-sm-11">
                             <asp:TextBox ID="TextBoxQuantity" runat="server" Cssclass="form-control" onkeypress="return doClick(event);"></asp:TextBox>
	                    </div>
	                 </div>
	              </fieldset>
            &nbsp
  <fieldset style="text-align:center;">
                    <asp:Button ID="AddButton" runat="server" Text="<%$ Resources:Resource, Add %>" OnClick="Addbooks"  CausesValidation="False" CssClass="btn btn-fill btn-default" />
      <input type=button value="<asp:Literal runat="server" Text="<%$ Resources:Resource, Print%>" />" onclick="doPrint()" Class="btn btn-fill btn-default">             
  </fieldset>
            &nbsp
<!--startprint--><!--注意要加上html里star和end的这两个标记-->
       <asp:DataList ID="DataListbookbarcode" runat="server" RepeatColumns="1" HorizontalAlign="center" Enabled="false">
           <ItemTemplate>
               <br>
               </br>
                <asp:image ID="Imagebarcode" runat="server"  ImageUrl='<%#"~/Images/Barcode/" +Eval("Name")%>'/>     
               <br>     
               </br>       
            </ItemTemplate>
        </asp:DataList>
<!--endprint-->
            </div>
        </div>
        
</asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="foot" runat="server">
    <script src="../../assets/vendors/jquery.select-bootstrap.js"></script>
    <!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
    <script src="../../assets/vendors/jasny-bootstrap.min.js"></script>
    <script type="text/javascript">
        function doClick(event) {
            //    if ($.trim($('#' + buttonId + '').val()) == '') {
            //        shorError();
            //        return;
            //    }
            var key;
 
            if (window.event)
                key = window.event.keyCode;     //IE
            else
                key = event.which;     //firefox
 
            if (key == 13) {
                //                if ($.trim($('#btnVerificationCode').val()) == '') {
                //                    shorError();
                //                }
                try {
                    if (window.event) {//ie
                        window.event.keyCode = 0
                        window.event.returnValue = false;
                    }
                    else {//firefox
                        return false;
                    }
                }
                catch (ex) {
                }
            }
        }
        function doPrint() {
            //onreadystatechange = bind();
            bdhtml=window.document.body.innerHTML;    
            sprnstr="<!--startprint-->";    
            eprnstr="<!--endprint-->";    
            prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);    
            prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));    
            window.document.body.innerHTML=prnhtml; 
            window.print();
            var result="<%=deletebind() %>";
        }    
    </script>
 </asp:Content>