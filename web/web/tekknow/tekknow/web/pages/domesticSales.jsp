<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Domestic Sales</title>
</head>
<%
   String mode=request.getParameter("mode");
   String code=request.getParameter("code");
   String userId=(String)session.getAttribute("LOGIN_ID");
   String branch=request.getParameter("branch");
   String screenCode=request.getParameter("screencode");
%>
<body>
    <div class="col-sm-12 col-md-12 col-lg-12 mpZero  marTp" id="heading">
    	<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
				Invoice
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero" id="firsttab">
		<div class="col-md-6 col-sm-6 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Type</label></div>
					<div class="col-md-8"><select class="form-control" id="saletype"></select><input type="hidden" class="form-control" id="code"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Inv No</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="billno"><input type="hidden" class="form-control" id="dcnos"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="billdate"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>				
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Customer</label></div>
				<div class="col-md-8"><input type="text" class="form-control" id="customername"><input type="hidden" class="form-control" id="customercode"></div>
				<div class="col-md-2"><button id="btnShowDC" class="btn btn-primary priBut" style="padding:3px" type="button" onclick="showDCDialog()">Select DC</button></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Address </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="address1"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>&nbsp;&nbsp;&nbsp; </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="address2"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>&nbsp;&nbsp;&nbsp; </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="address3"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>&nbsp;&nbsp;&nbsp;</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="place"/></div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Tax Code</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="taxname"><input type="hidden" class="form-control" id="taxcode"><input type="hidden" class="form-control" id="taxtype"><input type="hidden" class="form-control" id="vattype"></div>				
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Stock Transfer</label></div>
					<div class="col-md-8"><select class="form-control" id="stocktransfer"></select></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Supplementary</label></div>
					<div class="col-md-8"><select class="form-control" id="supplementary"></select></div>
				</div>
				</div>	
			</div>
		 </div>
		</div>
		</div>
		<div class="col-md-6 col-sm-6 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">      		 
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Invoice Issue</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="issuedatetime"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-5"><label>Goods Removal</label></div>
					<div class="col-md-7"><input type="text" class="form-control" id="removedatetime"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>DC Date</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="dcdate"></div>
				</div>
				</div>
			</div>
      		 <div class="clearfix"></div>
			 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Export Inv.No</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="expinvno"><input type="hidden" class="form-control" id="expinvcode"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-5"><label>PO No</label></div>
					<div class="col-md-7"><input type="text" class="form-control" id="pono"><input type="hidden" id="posno"></div>
				</div>
				</div>					
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Transport</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="transporter"><input type="hidden" id="transportercode"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Documents Through</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="documentsthro"><input type="hidden" id="documentsthrocode"></div>
				</div>
				</div>	
			</div>									
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Despatched To</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="despatchedto"></div>
				</div>
				</div>	
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>LR No</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="lrno"><input type="hidden" class="form-control" id="lrnos"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-5"><label>Date</label></div>
					<div class="col-md-7"><input type="text" class="form-control" id="lrdate"></div>
				</div>
				</div>						
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Lorry No</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="lorryno"><input type="hidden" class="form-control" id="lorrynos"></div>
				</div>
				</div>	
			</div>		
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Sales Return GIR No</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="girno"><input type="hidden" class="form-control" id="gircode"></div>
				</div>
				</div>						
			</div>
		 </div>
		</div>
		</div>		
		</div>
		<div class="clearfix"></div>	
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="salesgrid" style="height:250px">
			<span>DC Grid<span/>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
		  </div>
		</div>
		<div class="col-md-12 col-sm-12 mpZero">
			<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="totalamount" disabled/></div>
				</div>
			</div>
			<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Discount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="totaldiscount" disabled/></div>
				</div>
			</div>
			<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Net Total Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="nettotalamount" disabled/></div>
				</div>
			</div>			
		</div>
		<div class="col-md-5 col-sm-5 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Freight</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="freight" />
					</div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-4"><label>ST% on Freight</label></div>
				<div class="col-md-8"><input type="text" class="form-control" id="stperc"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-4"><label>ST Amt on Freight</label></div>
				<div class="col-md-8"><input type="text" class="form-control" id="stamount" disabled/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-4"><label>Freight Paid</label></div>
				<div class="col-md-8"><select class="form-control" id="freightpaid"></select></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-4"><label>Consignee</label></div>
				<div class="col-md-8"><input type="text" class="form-control" id="consignee"/><input type="hidden" class="form-control" id="consigneecode"/></div>
				</div>
			</div>			
			<div  class="col-md-12 col-sm-12 mpZero">		
			<div class="form-group mbotto">
				<div class="col-md-12"><label>Description</label></div>
				<div class="col-md-12"><textarea row=10 col=200 style="height:125px" class="form-control" id="consigndesc"></textarea></div>
			</div>
			</div>	
		 </div>
		</div>
		</div>
		<div class="col-md-7 col-sm-7 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			<div class="col-md-12 col-sm-12 mpZero" id="taxgrid" style="height:200px">
			<span>Tax Grid<span/>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
			</br>
		  </div>
		</div>
		<div class="clearfix"></div>			
    </div>
    <div style="position:fixed; bottom:0; width:94.5%; background:#fff; z-index:1000;">
			<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveDomesticInvoice()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editSales()">Edit</div>
				</span>
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
				<div class="col-sm-12 col-md-12" style="background:#fedc34; display:inline-block;height:84px;text-align:center;padding-top:20px" >
	    		<input type="hidden" id="detamount" value="0"/><input type="hidden" id="billamount" value="0"/>
    			<div class="netAm">Net Amount <span id="netAmt">0.00</span></div>
    			</div>
    		</div>
    	</div>
	</div>
	<div style="display:none">
		<div id='dlgdc' class='pop_lov_box'>
			<div id='dlgdctitle' class='pop_lov_hed_box'>
			<div class='pop_lov_clos'>
				<a href='#'>
					<span class='fa fa-times-circle'>
					</span>
				</a>
			</div>
			<div class='pop_lov_hed_txt'>Select DC</div>
			</div>
			<div id='dcscont' class='pop_lov_inp_box'>
				<div class="col-md-12 col-sm-12 mpZero" id="dcs" style="height:200px">
		  		</div>				
				<div class="clearfix"></div>
				<div id="actButton" class="col-md-12 text-right">
                	<button id="btnDC" class="btn btn-primary priBut" type="button" onclick="selectDC()">Ok</button>
	                <button id="btnCancelDlg" class="btn btn-default" type="button" onclick="cancelDCDlg()">Cancel</button>
            	</div>							
			</div>
		</div>
	</div>
	<script>
    var sProps={js:"",screen:[
  	{name:"group1",predesigned:true,contentType:"Fields",
  	fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},  	
  	{name:"saletype",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"R","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"dcdate",values:"P~M~O",keys:"Product~Machinery~Others"},
  	{name:"billno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"dcdate"},
  	{name:"billdate",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"customername"},  	
  	{name:"customercode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"customername"},
  	{name:"customername",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"taxname",lovOptions:{url:"/tekknow/service/ajax",ajax:"customers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"customername",tt:false,id:"ledger_name"},
  	{tgt:"customername",tt:true,id:"ledger_name"},
  	{tgt:"customercode",tt:false,id:"ledger_code"},
  	{tgt:"address1",tt:false,id:"addr1"},
  	{tgt:"address2",tt:false,id:"addr2"},
  	{tgt:"address3",tt:false,id:"addr3"},
  	{tgt:"place",tt:false,id:"place"}
  	]}},
  	{name:"address1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"address2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"address3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"place",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"taxname",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"invno",lovOptions:{url:"/tekknow/service/ajax",ajax:"taxes",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"taxname",tt:false,id:"tax_name"},
  	{tgt:"taxname",tt:true,id:"tax_name"},
  	{tgt:"taxcode",tt:false,id:"tax_code"},
  	{tgt:"taxtype",tt:false,id:"tax_type"},
  	{tgt:"vattype",tt:false,id:"vat_type"}
  	]},validation:"onTaxCodeChange"},
  	{name:"taxcode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"stocktransfer"},
  	{name:"taxtype",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"stocktransfer"},
  	{name:"vattype",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"stocktransfer"},
  	{name:"stocktransfer",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"N","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"supplementary",values:"N~Y",keys:"No~Yes"},
  	{name:"supplementary",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"N","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"issuedatetime",values:"N~Y",keys:"No~Yes"},
  	{name:"issuedatetime",inputType:0,type:"DATETIME",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"removedatetime"},
  	{name:"removedatetime",inputType:0,type:"DATETIME",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"dcdate"},
  	{name:"dcdate",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"expinvno"},
  	{name:"expinvcode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"expinvcode"},
  	{name:"expinvno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":20,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"pono"},
  	{name:"posno",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"pono"},
  	{name:"pono",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"transporter"},
  	{name:"transportercode",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"transporter"},
  	{name:"transporter",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"documentsthro",lovOptions:{url:"/tekknow/service/ajax",ajax:"transporters",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"transporter",tt:false,id:"ledger_name"},
  	{tgt:"transporter",tt:true,id:"ledger_name"},
  	{tgt:"transportercode",tt:false,id:"ledger_code"}
  	]}},
  	{name:"documentsthrocode",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"documentsthro"},
  	{name:"documentsthro",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"despatchedto",lovOptions:{url:"/tekknow/service/ajax",ajax:"documentsthrough",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"documentsthro",tt:false,id:"docu_through_name"},
  	{tgt:"documentsthro",tt:true,id:"docu_through_name"},
  	{tgt:"documentsthrocode",tt:false,id:"docu_through_code"}
  	]}},
  	{name:"despatchedto",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":200,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"lrno"},
  	{name:"lrno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":150,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"lrdate"},
  	{name:"lrdate",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"lorryno"},
  	{name:"lorryno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":150,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"girno"},
  	{name:"gircode",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girno"},
  	{name:"girno",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"salesgrid_data",lovOptions:{url:"/tekknow/service/ajax",ajax:"girs",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"suppcode",src:"customercode",tt:false}],results:[
  	{tgt:"girno",tt:false,id:"girno"},
  	{tgt:"girno",tt:true,id:"girno"},
  	{tgt:"gircode",tt:false,id:"gir_code"}
  	]}},
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"salesgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "productcode", name: "ProductCode", field: "productcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "productname", name: "Product", field: "productname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"salesgrid_data",tt:false,row:"cr",id:"product_code",col:"productcode"},
  	{tgt:"salesgrid_data",tt:false,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"salesgrid_data",tt:true,row:"cr",id:"product_name",col:"productname"}
  	]}},
  	{order:"3",id: "packtypecode", name: "PackCode", field: "packtypecode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
    {order:"4",id: "packtype", name: "Packing Type", field: "packtype",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"packingtypes",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"salesgrid_data",tt:false,row:"cr",id:"packing_type_name",col:"packtype"},
  	{tgt:"salesgrid_data",tt:true,row:"cr",id:"packing_type_name",col:"packtype"},
  	{tgt:"salesgrid_data",tt:false,row:"cr",id:"packing_type_code",col:"packtypecode"},
  	{tgt:"salesgrid_data",tt:false,row:"cr",id:"packing_value",col:"packingvalue"}
  	]}},
    {order:"5",id: "packingvalue", name: "Packing Value", field: "packingvalue",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
    {order:"6",id: "packages", name: "Packages", field: "packages",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"7",id: "totalqty", name: "Total Qty", field: "totalqty",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":true,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"8",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"right"},
    {order:"9",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"right"},
    {order:"10",id: "discount", name: "Discount", field: "discount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right"},
    {order:"11",id: "taxperc", name: "VAT %", field: "taxperc",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,onchange:"onRateQuantityChange",align:"right"},
    {order:"12",id: "taxamt", name: "VAT Amt", field: "taxamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right"},
    {order:"13",id: "netamount", name: "Total", field: "netamount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right"},
    {order:"14",id: "remarks", name: "Remarks", field: "remarks",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":100,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":false,width:0,align:"left"},
    {order:"15",id: "camount", name: "CAmount", field: "camount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"16",id: "cdiscamt", name: "CDiscamt", field: "cdiscamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"17",id: "ctaxamt", name: "Ctaxamt", field: "ctaxamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"18",id: "ccessamt", name: "CCessamt", field: "ccessamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"19",id: "cnetamt", name: "CNetamt", field: "cnetamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"20",id: "ceducessamt", name: "CEduCessamt", field: "ceducessamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"21",id: "dcdetcode", name: "DC DetCode", field: "dcdetcode",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"22",id: "dcsalescode", name: "DC Code", field: "dcsalescode",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0}
    ]
    }},
    {name:"group2",predesigned:true,contentType:"Fields",
  	fields:[
  	{name:"totalamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"freight"},
  	{name:"totaldiscount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"freight"},
  	{name:"nettotalamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"freight"},
  	{name:"detamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"freight"},
  	{name:"billamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"freight"},
  	{name:"freight",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"chkTag":false,nf:"stperc",onchange:"onFreightChange"},
  	{name:"stperc",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"chkTag":false,nf:"freightpaid",onchange:"onFreightChange"},
  	{name:"stamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"freightpaid"},
  	{name:"freightpaid",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"N","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"consignee",values:"N~Y",keys:"No~Yes",onchange:"onFreightChange"},
  	{name:"consigneecode",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"consignee"},
  	{name:"consignee",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"consigndesc",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"consignee",tt:false,id:"ledger_name"},
  	{tgt:"consignee",tt:true,id:"ledger_name"},
  	{tgt:"consigneecode",tt:false,id:"ledger_code"}
  	]}},
  	{name:"consigndesc",inputType:0,type:"TEXTAREA",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":200,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"taxgrid_data"},
  	{name:"lrnos",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":200,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"taxgrid_data"},
  	{name:"lorrynos",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":200,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"taxgrid_data"},
  	{name:"dcnos",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":200,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"taxgrid_data"},
	{name:"det2amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
  	]},
  	{name:"taxgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"",enableAddRow:true,rowEmptyCheckColumn:"ledger_code",optional:false,columns:[
    {order:"0",id: "ledger_code", name: "Code", field: "ledger_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"1",id: "description", name: "Account Name", field: "description",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:150,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"taxgrid_data",tt:false,row:"cr",id:"ledger_code",col:"ledger_code"},
  	{tgt:"taxgrid_data",tt:false,row:"cr",id:"ledger_name",col:"description"},
  	{tgt:"taxgrid_data",tt:true,row:"cr",id:"ledger_name",col:"description"}
  	]}},
    {order:"2",id: "perc", name: "%", field: "perc",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:75,onchange:"onTaxDetailChange",align:"right"},
    {order:"3",id: "taxamount", name: "Amount", field: "taxamount",defaultValue:"0","inputType":0,"type":"NEGDEC","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:75,onchange:"onTaxDetailChange",align:"right"},
    {order:"4",id: "cr_dr", name: "Cr/Dr", field: "cr_dr",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":false,width:50,"chkTag":false,onchange:"onTaxDetailChange",align:"right"},
    {order:"5",id: "col_type", name: "coltype", field: "col_type",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"6",id: "basic_ledger_code", name: "basic_ledger_code", field: "basic_ledger_code",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"7",id: "basic_others", name: "basic_others", field: "basic_others",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"8",id: "divid", name: "divid", field: "divid",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"9",id: "ded", name: "ded", field: "ded",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false}
    ]
    }},
  	{name:"dcs",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"dccode",optional:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "dccode", name: "DCCode", field: "dccode",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "dcno", name: "DC No", field: "dcno",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"pendingdcs",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"custcode",src:"customercode",tt:false}],results:[
  	{tgt:"dcs_data",tt:false,row:"cr",id:"sales_code",col:"dccode"},
  	{tgt:"dcs_data",tt:false,row:"cr",id:"bill_no",col:"dcno"},
  	{tgt:"dcs_data",tt:true,row:"cr",id:"bill_no",col:"dcno"},
  	{tgt:"dcs_data",tt:false,row:"cr",id:"freight",col:"dcfreight"},
  	{tgt:"dcs_data",tt:false,row:"cr",id:"lr_no",col:"dclrno"},
  	{tgt:"dcs_data",tt:false,row:"cr",id:"vehicle_no",col:"dcvehno"}
  	]}},
  	{order:"3",id: "dcfreight", name: "Freight", field: "dcfreight",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"4",id: "dclrno", name: "Lr No", field: "dclrno",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":150,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":false,width:0,"chkTag":false}, 	
    {order:"5",id: "dcvehno", name: "Vehicle No", field: "dcvehno",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":150,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":false,width:0,"chkTag":false}
    ]
    }}  	
    ]
    };
	var domesticinvoice=new FlexUI.Screen("domesticinvoice",sProps);	

	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("salesgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("salesgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            screenObjects.getScreenObject("saletype").focus();
        });        
        function saveDomesticInvoice(){
        	if('<%=mode%>'=="View") return;
        	if(domesticinvoice.getSaveInProgress()) return;
        	var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="0" || code==""){
    			domesticinvoice.setOperation("ADD");
    		}
    		domesticinvoice.setScreenCode(600031);
    		var d=domesticinvoice.processDataToSave();
    		domesticinvoice.setSaveInProgress(true);    		
			if("FAILED"!=d){
				var s=new FlexUI.Ajax();
				showLoader();
				r=s.callAjax("POST","/tekknow/service/screen/save",d);
				hideLoader();
		 	}else{
		 		alert("Please correct the validation errors and continue...");
		 		domesticinvoice.setSaveInProgress(false);		 		
		 		return;
		 	}		 
		 	if(r.result=="Success"){
				alert(r.message+" [No:"+r.code+"]");
				clearInnerScreen();
				return r.key;			
			}else{
				domesticinvoice.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function clearInnerScreen(){
        	$('#overlapdiv').css('display','none');
        	domesticinvoice.clearScreen();
        	domesticinvoice.setSaveInProgress(false);
        	screenObjects.getScreenObject("saletype").focus();
        }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateAmount(t.getCurrentRow());
			calculateTotal();
			return true;
		}
		function onFreightChange(id,me){
			var fr=screenObjects.getScreenObject("freight");
			var stperc=screenObjects.getScreenObject("stperc");
			var stamt=screenObjects.getScreenObject("stamount");
			var st=roundOff(toNumber(fr.getValue())*(toNumber(stperc.getValue())/100),2);
			stamt.setValue(st);
			calculateTotal(); 
		}
		function onTaxDetailChange(id,me){
			var t=me.getParent();
			calculateTotal(true);
			return true;
		}
		function calculateTotal(fromTax){
			var total=0;
			var totalDisc=0;
			var netTotal=0;
			var billAmount=0;
			var taxes={};
			var t=screenObjects.getScreenObject("salesgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				total+=toNumber(t.getText(i,cols.amount));
				if(taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]==undefined){
					taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]=0;
				}
				taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]=taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]+toNumber(t.getText(i,cols.taxamt));				
				totalDisc+=toNumber(t.getText(i,cols.discount));
				netTotal+=toNumber(t.getText(i,cols.netamount));
			}
			screenObjects.getScreenObject("totalamount").setValue(roundOff(total,2));
			screenObjects.getScreenObject("totaldiscount").setValue(roundOff(totalDisc,2));
			screenObjects.getScreenObject("nettotalamount").setValue(roundOff(netTotal,2));
			//calculate the total taxes & other amounts
			var tg=screenObjects.getScreenObject("taxgrid_data");
			var tgCols=tg.getCols();
			s=tg.getSize();
			var ls_tax_type=screenObjects.getScreenObject("taxtype").getValue();
			var ls_vat_type=screenObjects.getScreenObject("vattype").getValue();
			for(var i=0;i<s;i++){
                var lc_amt = 0
                if(toNumber(tg.getText(i, tgCols.perc)) > 0){
                    if(tg.getText(i, tgCols.cr_dr) == "C"){
                        if(tg.getText(i, tgCols.basic_others) == "B"){
                            if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type!="N")){
                                    if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100) * toNumber(tg.getText(i, tgCols.divid)) / 100), 0));
                                    }else{
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0));
                                    }
                                }
                            }else{
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type !="N")){
                                	tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0));
                                }
                            }

                        }else if(tg.getText(i, tgCols.basic_others) == "O"){
                                var ll_found = findRowNumber("taxgrid_data","ledger_code", tg.getText(i, tgCols.basic_ledger_code), s);
                                var lc_found_amt =0;
                                if(ll_found != -1){
                                    lc_found_amt = tg.getText(ll_found, tgCols.taxamount);
                                }
                                tg.setText(i, tgCols.taxamount, Math.round((toNumber(lc_found_amt) * toNumber(tg.getText(i, tgCols.perc))/ 100)));
                        }else{
                        	var lc_amt=0;
                            for(var j=0;j<=i-1;j++){
                                lc_amt = lc_amt + toNumber(tg.getText(j, tgCols.taxamount));
                            }
                            lc_amt = lc_amt + netTotal;
                            tg.setText(i, tgCols.taxamount, Math.round((lc_amt * toNumber(tg.getText(i, tgCols.perc)) / 100)));
                        }
                    }else{
                        if(tg.getText(i, tgCols.basic_others) == "B"){
                            if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type!="N")){
                                    if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100) * toNumber(tg.getText(i, tgCols.divid)) / 100), 0)*-1);
                                    }else{
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0)*-1);
                                    }
                                }
                            }else{
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type !="N")){
                                	tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0)*-1);
                                }
                            }

                        }else if(tg.getText(i, tgCols.basic_others) == "O"){
                                var ll_found = findRowNumber("taxgrid_data","ledger_code", tg.getText(i, tgCols.basic_ledger_code), s);
                                var lc_found_amt =0;
                                if(ll_found != -1){
                                    lc_found_amt = tg.getText(ll_found, tgCols.taxamount);
                                }
                                tg.setText(i, tgCols.taxamount, Math.round((toNumber(lc_found_amt) * toNumber(tg.getText(i, tgCols.perc))/ 100)));
                        }else{
                        	var lc_amt=0;
                            for(var j=0;j<=i;j++){
                                lc_amt = lc_amt + toNumber(tg.getText(j, tgCols.taxamount));
                            }
                            lc_amt = lc_amt + netTotal;
                            tg.setText(i, tgCols.taxamount, Math.round((lc_amt * toNumber(tg.getText(i, tgCols.perc)) / 100)));
                        }
                    }
                }
            }
            billAmount=netTotal;
            var lc_perc="";
            var li_found=-1;
            var lc_tax_amt=0;
            lc_tax_amt = 0
            var det2amount=0;
            for(var i=0;i<s;i++){
            	var colType=tg.getText(i, tgCols.col_type);
                if(colType!="" && !fromTax){
                    if ((colType=="V" && (ls_vat_type == "V" || ls_vat_type == "N")) || (colType == "C" && ls_tax_type == "C")){
                        lc_perc = roundOff(toNumber(tg.getText(i, tgCols.perc)),2);
                        if(taxes[lc_perc]!=undefined){
                        	lc_tax_amt = lc_tax_amt + taxes[lc_perc];
                        }
                        if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                            tg.setText(i, tgCols.taxamount, Math.round((lc_tax_amt * toNumber(tg.getText(i, tgCols.divid)) / 100)));
                        }else{
                            tg.setText(i, tgCols.taxamount, (Math.round(lc_tax_amt, 0)));
                        }
                    }
                    lc_tax_amt = 0
                }
                billAmount+=toNumber(tg.getText(i, tgCols.taxamount));
                det2amount+=toNumber(tg.getText(i, tgCols.taxamount));                                                            
            }
            if(screenObjects.getScreenObject("freightpaid").getValue()=="N"){
            	billAmount+=toNumber(screenObjects.getScreenObject("freight").getValue());
            	billAmount+=toNumber(screenObjects.getScreenObject("stamount").getValue());            	
            }
            screenObjects.getScreenObject("det2amount").setValue(roundOff(det2amount,2));
            screenObjects.getScreenObject("detamount").setValue(roundOff(billAmount,2));            
            screenObjects.getScreenObject("billamount").setValue(roundOff(billAmount,2));
			$("#netAmt").text(roundOff(billAmount,2));
		}
		function findRowNumber(gridName,columnName,uptoRow,searchTxt){
			var tg=screenObjects.getScreenObject(gridName);
			var tgCols=tg.getCols();
			var s=tg.getSize();
			if(uptoRow!=0){
				s=uptoRow;
			}
			for(var k=0;k<s;k++){
				if(t.getText(k,tgCols[columnName])==searchTxt){
					return k;
				}
			}
			return -1;
		}
		function calculateAmount(row){
			var t=screenObjects.getScreenObject("salesgrid_data");
			//var disc=screenObjects.getScreenObject("billdiscperc");
			var cols=t.getCols();	
			var baseqty=0;
			baseqty=toNumber(t.getText(row,cols.packages))*toNumber(t.getText(row,cols.packingvalue));
			var amt=roundOff(toNumber(t.getText(row,cols.rate))*baseqty,2);
			var tax=0;
			var netAmt=0;
			taxableamt=amt;
			var disc=toNumber(t.getText(row,cols.discount));
			taxableamt-=disc;	
			tax=taxableamt*toNumber(t.getText(row,cols.taxperc))/100;
			netAmt=roundOff(taxableamt+tax,2);
			t.setText(row,cols.totalqty,roundOff(baseqty,3));
			t.setText(row,cols.taxamt,roundOff(tax,2));
			t.setText(row,cols.discount,roundOff(disc,2));
			t.setText(row,cols.camount,amt);
			t.setText(row,cols.amount,roundOff(amt,2));
			t.setText(row,cols.cnetamt,roundOff(taxableamt,2));
			t.setText(row,cols.netamount,roundOff(taxableamt,2));
		}
		function onTaxCodeChange(id,me){
			var taxcode=screenObjects.getScreenObject("taxcode");
			var taxgrid=screenObjects.getScreenObject("taxgrid_data");
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET","/tekknow/service/ajax","ic=0&ro=true&id=taxdetail&taxcode="+taxcode.getValue());
			taxgrid.clear();
			taxgrid.setObjectData(v.data);
			return true;			
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				saveDomesticInvoice();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadBillData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			domesticinvoice.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}
		function cancelDCDlg(){
			$('#dlgdc').dialog('close');
			$('#dlgdc').dialog('destroy');
		}
		function showDCDialog(){
			$('#dlgdc').dialog({autoOpen:false,modal:true,minHeight:600,minWidth:700,position:'center'});
			$('#dlgdc').dialog('open');
	    }
	    function selectDC(){
	   		var g=screenObjects.getScreenObject("dcs_data");
			var gCols=g.getCols();
			var s=g.getSize();
			var selectedDCs="";
			var totalFreight=0;
			var lrnos="";
			var lorrynos="";
			var comma="";
			for(var k=0;k<s;k++){
				if(g.getText(k,gCols["dccode"])!=""){				
					selectedDCs=selectedDCs+comma+g.getText(k,gCols["dccode"]);
					lrnos=lrnos+comma+g.getText(k,gCols["dclrno"]);
					lorrynos=lorrynos+comma+g.getText(k,gCols["dcvehno"]);
					totalFreight=totalFreight+toNumber(g.getText(k,gCols["dcfreight"]));
				}
				comma=",";
			}
			if(selectedDCs!=""){
				var salesgrid=screenObjects.getScreenObject("salesgrid_data");
				var l=new FlexUI.Ajax();
				var v=l.callAjax("GET","/tekknow/service/ajax","ic=0&ro=true&id=dcdata&dccodes="+selectedDCs);
				salesgrid.clear();
				salesgrid.setObjectData(v.data);
				salesgrid.generateSerialNo();
				screenObjects.getScreenObject("lorrynos").setValue(lorrynos);
				screenObjects.getScreenObject("lrnos").setValue(lrnos);
				screenObjects.getScreenObject("freight").setValue(roundOff(totalFreight,2));
			}else{
				salesgrid.clear();
			} 	
			cancelDCDlg();   
	    }
	    function editSales(id,me){
			domesticinvoice.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"saleslist",scrollEnabled:true,searchFromList:false,dsi:3,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
		function onEditClose(e,args){	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600031","code="+args.result[3]);
			clearInnerScreen();
			domesticinvoice.loadObjectData(r);
			domesticinvoice.setOperation("MOD");			
			//calculateTotal();
			hideLoader();
		}
		function onEscClose(){	
			clearInnerScreen();
		}
	</script>
</body>
</html>