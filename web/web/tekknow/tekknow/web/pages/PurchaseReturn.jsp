<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Purchase Return</title>
</head>
<%@page import="com.core.servlet.InitProjectServlet"%>
<%
   String mode=request.getParameter("mode");
   String code=request.getParameter("code");
   String userId=(String)session.getAttribute("LOGIN_ID");
   String branch=request.getParameter("branch");
   String screenCode=request.getParameter("screencode");
   System.out.println(System.getProperty("catalina.home")+" "+InitProjectServlet.context);
%>
<body>
    <div class="col-sm-12 col-md-12 col-lg-12 mpZero  marTp" id="heading">
    	<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
    	    		Purchase Return
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero " style="margin-bottom:60px">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
			<div class="clearfix"></div>`
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="inv_date"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Debit Note No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="inv_no"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-8 mpZero">		
					<div class="form-group mbotto">
					<div class="col-md-3"><label>Disc %</label></div>
					<div class="col-md-4"><select class="form-control" id="disc_text"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="disc_text"></div>
					<div class="col-md-4"><input type="text" class="form-control" id="disc_per"></div>
				
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Vendor</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Price-List</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>	
				 	<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="tot" disabled></div>
				</div>
				</div>	
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address1</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="address1" disabled></div>
				</div>
				</div>				 
				<div  class="col-md-4 col-sm-8 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Original Inv No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="invoice_no"></div>
				</div>
				</div>	
		<div  class="col-md-4 col-sm-8 mpZero">		 	
			<div class="form-group mbotto">
					<div class="col-md-3"><label>CGST %</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="cgst_per"  disabled></div>
					<div class="col-md-4"><input type="text" class="form-control" id="cgst_amount"  disabled></div>
				</div> 
			</div>			
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address2</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="address2"></div>
				</div>
				</div>
			<div  class="col-md-4 col-sm-8 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Original Inv. Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="invoice_date" disabled></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>SGST %</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="sgst_per"  disabled></div>
					<div class="col-md-4"><input type="text" class="form-control" id="sgst_amount"  disabled></div>
			</div>
							</div>		
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address3</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="address3"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-8 mpZero">
							<div class="form-group mbotto">
					<div class="col-md-3"><label>Party Ref. No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="party_ref_no"></div>
				 
				</div>
			</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
			<div class="form-group mbotto">
					<div class="col-md-3"><label>IGST %</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="igst_per"  disabled></div>
					<div class="col-md-4"><input type="text" class="form-control" id="igst_amount"  disabled></div>
			</div>
				</div>	
			</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">			
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address4</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="address4"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-8 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Party Ref. Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="party_ref_date"></div>		
				</div>
			</div>
			<div  class="col-md-4 col-sm-4 mpZero">		
					<div class="form-group mbotto">
					<div class="col-md-3"><label>Freight</label></div>
			 			<div class="col-md-8"><input type="text" class="form-control" id="courier_charges"></div>
		</div>				
				</div>	
				
			</div>
			 
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				 
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>GSTIN</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="gstin_no"></div>
				</div>
				</div>				
				<div  class="col-md-4 col-sm-8 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-3"><label>Notes</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="notes"></div>
					</div>
				</div>		
				<div  class="col-md-4 col-sm-8 mpZero">		
			<div class="form-group mbotto">
					<div class="col-md-3"><label>Total Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="total_amount" disabled></div>
				</div>
				
				</div>	
				
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="purcretgrid" style="height:260px">
			<span>Sizing Grid<span/>
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
	</div>
		<div class="clearfix"></div>
	 	<div style="position:fixed; bottom:0; width:94.5%; background:#fff; z-index:1000;">
			<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-1 col-md-1 col-lg-1 adCl" onClick="clearInnerScreen()">Clear</div>
					<div class="col-sm-1 col-md-1 col-lg-1 adCl saVbN" onClick="saveInvoice()">Save</div>
					<div class="col-sm-1 col-md-1 col-lg-1 adCl printbN" onClick="PrintInvoice()">Print</div>

					<div class="col-sm-1 col-md-1 col-lg-1 adCl" onClick="editInvoice()">Edit</div>
					<div class="col-sm-1 col-md-1 col-lg-1 adCl" onClick="cancelInvoice()">Delete</div>
				</span>
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
				<div class="col-sm-12 col-md-12" style="background:#fedc34; display:inline-block;height:39px;text-align:center;padding-top:0px" >
	    		<input type="hidden" id="detamount" value="0"/><input type="hidden" id="billamount" value="0"/>
    			<div class="netAm"><span id="netAmt">0.00</span></div>
    			</div>
    		</div
    	></div> 
	<script>
	var sProps={js:"",screen:[
    {name:"group1",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"companycode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"inv_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
 	{name:"inv_no",inputType:0,type:"int",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
 	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ordered_by"},  	
 	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"ordered_by",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_both",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"address1",tt:false,id:"addr1"},
  	{tgt:"address2",tt:false,id:"addr2"},
  	{tgt:"address3",tt:false,id:"addr3"},
  	{tgt:"address4",tt:false,id:"place"},
  	{tgt:"remarks",tt:false,id:"note"},
  	{tgt:"gstin_no",tt:false,id:"gstin_no"},
  	{tgt:"disc_per",tt:false,id:"bill_disc_per"},
  	{tgt:"bill_disc_per",tt:false,id:"bill_disc_per"},
	{tgt:"aadi_disc_per",tt:false,id:"aadi_disc_per"},
	{tgt:"spl_disc_per",tt:false,id:"spl_disc_per"},
	{tgt:"ordered_by",tt:false,id:"order_by"},  	
  	{tgt:"gstin_no",tt:false,id:"gstin_no"},  	
  	{tgt:"transport_code",tt:false,id:"transport_code"},  	
  	{tgt:"transport_name",tt:false,id:"transport_name"},  	
  	{tgt:"local_interstate",tt:false,id:"local_interstate"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    ]},validation:"onLedgerCodeChange"}, 	
  	{name:"address1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address4",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"gstin_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode"},
    {name:"against_invoice_code",inputType:0,type:"INT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"paid_to_pay"},  	
    {name:"invoice_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"purc_inv_list_party",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"companycode",ft:false,src:"companycode"},{n:"ledger_code",ft:false,src:"ledger_code"}],results:[
    {tgt:"invoice_no",tt:false,id:"inv_no"},
    {tgt:"invoice_no",tt:true,id:"inv_no"},
    {tgt:"invoice_date",tt:false,id:"inv_date"},
    {tgt:"invoice_date",tt:true,id:"inv_date"},
    {tgt:"against_invoice_code",tt:false,id:"inv_code"}
    ]}},
    {name:"invoice_date",inputType:0,type:"DATE",caption:"Original Inv. Date",mandatory:false,defaultValue:"L","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"local_interstate",inputType:0,type:"TEXT",caption:"LocalInterstate",mandatory:false,defaultValue:"L","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"party_ref_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"party_ref_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
    {name:"notes",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
    {name:"disc_text",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"Discount","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,onchange:"onDiscChanged","chkTag":false,nf:"suppliername",values:"Discount~Aadi-Discount",keys:"Discount~Aadi-Discount~Spl-Discount"},
    {name:"disc_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"bill_disc_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"aadi_disc_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"spl_disc_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"courier_charges",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
	{name:"discount",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":0,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
    {name:"tot",inputType:0,type:"DECI",caption:"Amount",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"700",size:"17px",style:"bold",color:"#ffcc66"},background:"#666699"},
    {name:"cgst_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
    {name:"cgst_amount",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
    {name:"sgst_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
    {name:"sgst_amount",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
	{name:"igst_per",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
    {name:"igst_amount",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#c2c2d6"},
    {name:"total_amount",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"800",size:"20px",style:"bold",color:"#ffcc66"},background:"#666699"},
    {name:"round_off",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode",align:"right"},
       
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	
  	{name:"purcretgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"product_code",optional:false,enableColumnTotal:true,columns:[
 	{order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
	{order:"1",id: "product_code", name: "Product Code", field: "product_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
	{order:"2",id: "product_name", name: "Product", field: "product_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
	{tgt:"purcretgrid_data",tt:false,row:"cr",id:"product_code",col:"product_code"},
 	{tgt:"purcretgrid_data",tt:false,row:"cr",id:"product_name",col:"product_name"},
  	{tgt:"purcretgrid_data",tt:true,row:"cr",id:"product_name",col:"product_name"},
  	{tgt:"purcretgrid_data",tt:false,row:"cr",id:"hsn_code",col:"hsn_code"},
  	{tgt:"purcretgrid_data",tt:true,row:"cr",id:"hsn_code",col:"hsn_code"},  			
  	{tgt:"purcretgrid_data",tt:false,row:"cr",id:"unit_code",col:"unit_code"},
  	{tgt:"purcretgrid_data",tt:true,row:"cr",id:"unit_code",col:"unit_code"},  
	{tgt:"purcretgrid_data",tt:false,row:"cr",id:"unit_name",col:"unit_name"},
  	{tgt:"purcretgrid_data",tt:true,row:"cr",id:"unit_name",col:"unit_name"},   				
  	]}},
  	{order:"3",id: "hsn_code", name: "HSN Code", field: "hsn_code",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:75,align:"left","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"4",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"5",id: "qty", name: "Qty", field: "qty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:75,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"6",id: "mtrs", name: "Mtrs", field: "mtrs",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":false,"mandatory":false,width:0,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"7",id: "unit_code", name: "UnitCode", field: "unit_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":true,width:0,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
    {order:"8",id: "unit_name", name: "Unit", field: "unit_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:50,align:"center","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
	{order:"9",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
	{order:"10",id: "spl_disc", name: "Disc%", field: "spl_disc",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":5,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:false,onchange:"onRateQuantityChange"},
	{order:"11",id: "disc_amt", name: "Disc. Amt", field: "disc_amt",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
	{order:"12",id: "taxable_amt", name: "Taxable Amount", field: "taxable_amt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
	{order:"13",id: "freight_amt", name: "Freight Amount", field: "freight_amt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
	{order:"14",id: "rate1", name: "rate1", field: "rate1",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
   ]
    }}]};

var gir=new FlexUI.Screen("warpbreaks",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
			screenObjects.getScreenObject("address1").setEnabled(false);
			screenObjects.getScreenObject("address2").setEnabled(false);
			screenObjects.getScreenObject("address3").setEnabled(false);
			screenObjects.getScreenObject("address4").setEnabled(false);
			screenObjects.getScreenObject("gstin_no").setEnabled(false);
			screenObjects.getScreenObject("discount").setEnabled(false);
			screenObjects.getScreenObject("remarks").setEnabled(false);
			screenObjects.getScreenObject("tot").setEnabled(false);
			
			screenObjects.getScreenObject("cgst_per").setEnabled(false);
			screenObjects.getScreenObject("cgst_amount").setEnabled(false);
			screenObjects.getScreenObject("sgst_per").setEnabled(false);
			screenObjects.getScreenObject("sgst_amount").setEnabled(false);
			screenObjects.getScreenObject("igst_per").setEnabled(false);
			screenObjects.getScreenObject("igst_amount").setEnabled(false);
			screenObjects.getScreenObject("total_amount").setEnabled(false);
			
			screenObjects.getScreenObject("companycode").setValue($('#company').val());
			screenObjects.getScreenObject("disc_text").setValue("Discount");
			screenObjects.getScreenObject("disc_per").setValue(0);
			
			screenObjects.getScreenObject("purcretgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("purcretgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            var grid=screenObjects.getScreenObject("purcretgrid_data").onBeforeDeleteRow.subscribe(onRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
      		loadInvNo();

	       
		    setInterval(getScannedItem,3000);        
      	  });
      	  function prntInvoice(invno){
      	  	window.open("/tekknow/service/invoice/purcretprint?invoiceno="+invno,"_blank");      	  	
      	  }
        function prntPacking(invno){
      	  	window.open("/tekknow/service/invoice/invoicelabelprint?invoiceno="+invno,"_blank");
      	  }
      	  
        function prntLorryInvoice(invno){
      	  	window.open("/tekknow/service/invoice/lorryinvoice?invoiceno="+invno,"_blank");
      	  }
        
        function PackingSlip(){
	     saveInvoice("pack");     
 		  }
      
		function PrintInvoice(){
			saveInvoice("inv");     	  
 		}
	     function saveInvoice(print){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
        	var cnt;
			var a=new FlexUI.Ajax();
	       	var r=a.callAjax("GET","/tekknow/service/ajax?id=fincheck&ro=false&ic=0&tdate="+screenObjects.getScreenObject("inv_date").getValue());	    
	       	if(r!=null){
	   	 			if(r.data){
	   	 				cnt=r.data[0][0];	
									if(cnt==0)
										{
										alert("Please Check Finance Period...");
										return;
										}
	    						}
						    
				  }
        	var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
        	}
        	else
        		{
        		var txt;
				if(gir.getOperation()=="MOD")
				{
				txt="Confirm to Modify";		
				}
				else
				{
				txt="Confirm to Delete";
				}
        		var r = confirm(txt);
        		if (r != true) {
        		  return;        		  
        		}         		
        		}
    		//alert(gir.getOperation());
    		gir.setScreenCode("600010");
    		var d=gir.processDataToSave();
    		gir.setSaveInProgress(true);
    		    		
			if("FAILED"!=d){
				var s=new FlexUI.Ajax();
				showLoader();
				r=s.callAjax("POST","/tekknow/service/screen/save",d);
				hideLoader();
			
		 	}else{
		 		alert("Please correct the validation errors and continue...");
		 		gir.setSaveInProgress(false);		 		
		 		return;
		 	}		 
		 	
		 	if(r.result=="Success"){
				if(code=="" || code=="0"){
					  var a=new FlexUI.Ajax();
				  var xy=a.callAjax("GET","/tekknow/service/ajax?id=purcret_code_list&ro=false&ic=0");
 			 	  if(xy!=null){
   	 			if(xy.data){
    				code=xy.data[0][0];	
    						}
					    }	
 				}
				alert(r.message+" [No:"+code+"]");
				if(print=="inv"){
					prntInvoice(code);
				}else if(print=="pack"){
					prntPacking(code);
				}
				clearInnerScreen();
				return r.code;			
			}else{
				gir.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function onGirTypeChange(id,me){
        	//var gt=screenObjects.getScreenObject("girtype").getValue();
        	//screenObjects.getScreenObject("girprefix").setValue("H"+gt);
        	return true;
        }
 		function onDiscChanged(id,me){
			if(screenObjects.getScreenObject("disc_text").getValue()=="Discount")
			{

		    	screenObjects.getScreenObject("disc_per").setValue(screenObjects.getScreenObject("bill_disc_per").getValue());
	}
			else if (screenObjects.getScreenObject("disc_text").getValue()=="Aadi-Discount")
				{
			  	screenObjects.getScreenObject("disc_per").setValue(screenObjects.getScreenObject("aadi_disc_per").getValue());				
				}
      	 else
			{

				  	screenObjects.getScreenObject("disc_per").setValue(screenObjects.getScreenObject("spl_disc_per").getValue());				
			}
			calculateTotal();
			
        	return true;
        } 

        function onLedgerCodeChange(){
	        	/*screenObjects.getScreenObject("cgst_per").setValue(0);
	        	screenObjects.getScreenObject("sgst_per").setValue(0);
	        	screenObjects.getScreenObject("igst_per").setValue(0);
	        if(screenObjects.getScreenObject("local_interstate").getValue()=="L")
	        {
	        	screenObjects.getScreenObject("cgst_per").setValue(2.5);
	        	screenObjects.getScreenObject("sgst_per").setValue(2.5);
	        }
	        else
	        {
	        	screenObjects.getScreenObject("igst_per").setValue(5);
	        }*/
	        return true;
	}
        function clearInnerScreen(){
            clearInterval();
        	setInterval(getScannedItem,3000);        
        	gir.clearScreen();
        	gir.setSaveInProgress(false);
			screenObjects.getScreenObject("address1").setEnabled(false);
			screenObjects.getScreenObject("address2").setEnabled(false);
			screenObjects.getScreenObject("address3").setEnabled(false);
			screenObjects.getScreenObject("address4").setEnabled(false);
			screenObjects.getScreenObject("gstin_no").setEnabled(false);
			screenObjects.getScreenObject("discount").setEnabled(false);
			screenObjects.getScreenObject("remarks").setEnabled(false);
			screenObjects.getScreenObject("tot").setEnabled(false);
			
			screenObjects.getScreenObject("cgst_per").setEnabled(false);
			screenObjects.getScreenObject("cgst_amount").setEnabled(false);
			screenObjects.getScreenObject("sgst_per").setEnabled(false);
			screenObjects.getScreenObject("sgst_amount").setEnabled(false);
			screenObjects.getScreenObject("igst_per").setEnabled(false);
			screenObjects.getScreenObject("igst_amount").setEnabled(false);
			screenObjects.getScreenObject("total_amount").setEnabled(false);
		
	        screenObjects.getScreenObject("companycode").setValue($('#company').val());
        	screenObjects.getScreenObject("disc_text").setValue("DISCOUNT");
        	
        	onGirTypeChange();
        	if("<%=mode%>"=="View"){
        		$('.ui-dialog').children().remove();
				$('.ui-dialog').remove();
				$("#bodyContainer").children().remove();
				$("#bodyContainer").html("");
				$("#bodyContainer").load("/tekknow/billPrintRequest.do?id=11&title=Bills");
        	}
        	loadInvNo();
        }
        function getScannedItem(){
			var a=new FlexUI.Ajax();
	 	    var r=a.callAjax("GET","/tekknow/service/invoice/scanneditem?type=1","");
        	if(r!=null){
   	 			if(r.result=="Found"){
    				console.log(r.productcode);
    				//get product information and load in the grid
    				//r=a.callAjax("GET","/tekknow/service/ajax?id=scanproduct&ro=true&cs=0&F1=&ic=1&productcode="+r.productcode,"");
    				//if(r!=null){
    					//if(r.data && r.data.length>0){
							var t=screenObjects.getScreenObject("purcretgrid_data");
							var row=t.getSize()-1;
							var cols=t.getCols();
							t.setText(row,cols.product_code,r.productcode);
							t.checkAndMove("Next",true);
    					//}    				
    				//}	
    			}else if(r.result=="Not Found"){
    				console.log(r.message);
    			}else if(r.result=="Error"){
    				console.log(r.message);    			
    			}
			}	
        
        }
         function loadInvNo(){
			  var a=new FlexUI.Ajax();
			  var r=a.callAjax("GET","/tekknow/service/ajax?id=purc_ret_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue());
 	 	  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("inv_no").setValue(r.data[0][0]);	
    						}
					    }	
			  }
			     function ClearColumnsLedgerCode(id,me){
			        if(!gir.getSaveInProgress()	){
			   		screenObjects.getScreenObject("set_no").setValue("");
					screenObjects.getScreenObject("set_no").setTag("");
					screenObjects.getScreenObject("count_name").setValue("");
					screenObjects.getScreenObject("count_name").setTag("");
				    screenObjects.getScreenObject("count_code").setValue(0);
					screenObjects.getScreenObject("count_code").setTag("");
					screenObjects.getScreenObject("mill_name").setValue("");
					screenObjects.getScreenObject("mill_name").setTag("");
					screenObjects.getScreenObject("mill_code").setValue(0);
					screenObjects.getScreenObject("mill_code").setTag("");	
					screenObjects.getScreenObject("ends").setValue("");
					screenObjects.getScreenObject("mtrs").setValue("");
					}
				 	return true;   
				}
	  function onStickerQty(id,me,row,col){
	    if(!gir.getSaveInProgress()){
	  		var t=screenObjects.getScreenObject("purcretgrid_data");
	  		var cols=t.getCols();
	  		var pcode=t.getText(row,cols.product_code);
	  		var stkqty=t.getText(row,cols.sticker_qty);
	  		var sno=t.getText(row,cols.sno);
	  		var mtrs=t.getText(row,cols.mtrs);
	  		var ucode=t.getText(row,cols.unit_code);
	  		var l=new FlexUI.Ajax();
	  		var v=l.callAjax("GET","/tekknow/service/invoice/labelprint?productcode="+pcode+"&stickers="+stkqty+"&slno="+sno+"&mtrs="+mtrs+"&ucode="+ucode,"");
	  	//	var v=l.callAjax("GET","/tekknow/service/invoice/barcodetoprint?productcode="+pcode+"&stickers="+stkqty,"");
	  	}
	  		return true;
	  }
	  		function onProductCodeChange(id,me){
			    var a=new FlexUI.Ajax();
           		var productcode;
             	var t=screenObjects.getScreenObject("purcretgrid_data");
				var cols=t.getCols();
				var s=t.getSize();
				var net_amount=0;
			for(var i=0;i<s;i++){
			 	if(t.getCurrentRow()==i )
			  {
			  productcode=t.getText(i,cols.product_code);	
			  				 var r=a.callAjax("GET","/tekknow/service/ajax?id=barcodesearch&ro=false&ic=0&productcode="+productcode);
			if(r!=null){
 				if(r.data){		 
					t.setText(i,cols.prod_code,r.data[0][0]);
					t.setText(i,cols.product_name,r.data[0][1]);
					t.setText(i,cols.unit_code,r.data[0][2]);
					t.setText(i,cols.unit_name,r.data[0][3]);
					t.setText(i,cols.hsn_code,r.data[0][4]);
				
					if(i==0)
						{					 
						screenObjects.getScreenObject("cgst_per").setValue(0);
			        	screenObjects.getScreenObject("sgst_per").setValue(0);
			        	screenObjects.getScreenObject("igst_per").setValue(0);
			        if(screenObjects.getScreenObject("local_interstate").getValue()=="L")
			        {
			        	screenObjects.getScreenObject("cgst_per").setValue((r.data[0][5]) / 2);
			        	screenObjects.getScreenObject("sgst_per").setValue((r.data[0][5]) / 2);
			        }
			        else
			        {
			        	screenObjects.getScreenObject("igst_per").setValue((r.data[0][5]));
			        }
						}
					getSalesRate();
					
				}
 				
			}	
			  		
			  }	
					 
			} 
			return true;
		}
	  function SetWeightRow(id,me){
	  	if(!gir.getSaveInProgress()){
	  		var t=screenObjects.getScreenObject("purcretgrid_data");
	  		var dc_qty=screenObjects.getScreenObject("dc_qty").getValue();
	  		var sizing_rate=screenObjects.getScreenObject("sizing_rate").getValue();
	  		var rowData={descr_code:"1",description:"Warp Weight",qty:dc_qty,rate:sizing_rate};
	  		var rows=[];
	     	t.clear();
			var newRow = jQuery.extend(true, {}, rowData);
			rows.push(newRow);
				newRow.dc_qty=dc_qty;
	  		t.setObjectData(rows);
			
			}
			calculateTotal();
			return true;
		}
	  function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
				function calculateTotal(){
			var total=0,rndoff=0;			
			var total_cones=0,net_amt=0,disc_amt=0,amt=0,taxable_amt=0;
	        var rd_total=0,discount=0,cgst_amount=0,sgst_amount=0,igst_amount=0,courier=0,gross_amt=0;
			
			var t=screenObjects.getScreenObject("purcretgrid_data");
		var cols=t.getCols();
			
			var s=t.getSize();
			
			for(var i=0;i<s;i++){

			 if(i==0)
			{ 
		
			//t.setText(i,cols.freight_amt,screenObjects.getScreenObject("courier_charges").getValue());
				} 
					
			t.setText(i,cols.amount,roundOff(toNumber(t.getText(i,cols.qty)) * toNumber(t.getText(i,cols.rate)),2) );
		 
			t.setText(i,cols.disc_amt,roundOff(toNumber(t.getText(i,cols.amount))*toNumber(t.getText(i,cols.spl_disc))/100,2));
			
			amt=toNumber(t.getText(i,cols.amount) ) ;
			disc_amt=roundOff(toNumber(t.getText(i,cols.amount))*toNumber(t.getText(i,cols.spl_disc))/100,2) ;			
			taxable_amt=amt-disc_amt;
		 
			t.setText(i,cols.taxable_amt,roundOff(taxable_amt,2));

			
			total+=toNumber(t.getText(i,cols.amount));
			discount+=toNumber(t.getText(i,cols.disc_amt));
		       }
			screenObjects.getScreenObject("tot").setValue(total);
			 //discount=roundOff((total*screenObjects.getScreenObject("disc_per").getValue())/100,2);
		    courier=screenObjects.getScreenObject("courier_charges").getValue();
			console.log(total);		   
			
			//cgst_amount=roundOff(((toNumber(total+"")-toNumber(discount+"")+toNumber(courier+""))*toNumber(screenObjects.getScreenObject("cgst_per").getValue()))/100,2);
			//sgst_amount=roundOff(((toNumber(total+"")-toNumber(discount+"")+toNumber(courier+""))*toNumber(screenObjects.getScreenObject("sgst_per").getValue()))/100,2);
			//igst_amount=roundOff(((toNumber(total+"")-toNumber(discount+"")+toNumber(courier+""))*toNumber(screenObjects.getScreenObject("igst_per").getValue()))/100,2);
			cgst_amount=roundOff(((toNumber(total+"")-toNumber(discount+""))*toNumber(screenObjects.getScreenObject("cgst_per").getValue()))/100,2);
			sgst_amount=roundOff(((toNumber(total+"")-toNumber(discount+""))*toNumber(screenObjects.getScreenObject("sgst_per").getValue()))/100,2);
			igst_amount=roundOff(((toNumber(total+"")-toNumber(discount+""))*toNumber(screenObjects.getScreenObject("igst_per").getValue()))/100,2);
		 	   
			screenObjects.getScreenObject("discount").setValue(discount) ;
			screenObjects.getScreenObject("cgst_amount").setValue(cgst_amount) ;
			screenObjects.getScreenObject("sgst_amount").setValue(sgst_amount) ;
			screenObjects.getScreenObject("igst_amount").setValue(igst_amount) ;
			
			//screenObjects.getScreenObject("total_amount").setValue(total);
			
			//net_amt=total+ toNumber(screenObjects.getScreenObject("packing_charges").getValue()) + toNumber(screenObjects.getScreenObject("transport_charges").getValue())+toNumber(screenObjects.getScreenObject("f_charges").getValue())+toNumber(screenObjects.getScreenObject("add_less").getValue())+toNumber(screenObjects.getScreenObject("forwarding_charges").getValue())- toNumber(screenObjects.getScreenObject("rd_total").getValue());
	
	
			net_amt=total-discount+toNumber(screenObjects.getScreenObject("cgst_amount").getValue())+toNumber(screenObjects.getScreenObject("sgst_amount").getValue())+toNumber(screenObjects.getScreenObject("igst_amount").getValue())+toNumber(screenObjects.getScreenObject("courier_charges").getValue());
			rndoff=Math.round(net_amt)-net_amt;			
			screenObjects.getScreenObject("round_off").setValue(rndoff);
		    
			net_amt=Math.round(net_amt);
			//+ toNumber(screenObjects.getScreenObject("packing_charges").getValue()) + toNumber(screenObjects.getScreenObject("transport_charges").getValue())- toNumber(screenObjects.getScreenObject("rd_total").getValue());
			screenObjects.getScreenObject("total_amount").setValue(roundOff(net_amt,2));
	    
			$("#netAmt").html("Rs. "+roundOffWithFormat(net_amt,2));  
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveInvoice();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadSizingInvData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}
		function editInvoice(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"purc_ret_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		
		
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600010","code="+args.result[3]);
			clearInnerScreen();
			clearInterval();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			hideLoader();
			calculateTotal();
			var net_amt=0;
	       	net_amt=screenObjects.getscreenObject("total_amount").getValue();
	       	$("#netAmt").html( "Net Amount "+net_amt);
	   
			//calculateTotal();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600010","code="+args.result[3]);
			clearInnerScreen();
			clearInterval();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelInvoice(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"purc_ret_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
		function getSetBeamDetails(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=warpbeamlist&warping_code="+screenObjects.getScreenObject("warping_code").getValue());
				var dg=screenObjects.getScreenObject("purcretgrid_data");
				dg.clear();
				dg.setObjectData(r.data);
				/*
			var cols=dg.getCols();
  			if(grid.getText(dg.getCurrentRow(),cols.dischargedtime)==""){
  				grid.setText(row,cols.roomcode,r.data[0].roomcode);
  				grid.setText(row,cols.roomname,"");
  				grid.setText(row,cols.wardcode,"");
  				grid.setText(row,cols.wardname,"");  				
  				return false;
  			}
  			grid.setText(row,cols.admissiondate,grid.getText(row-1,cols.dischargedtime));
  			}
  				*/
			}
			return true;
		}
		
		function getSalesRate(){
			var prod_code;
	 	 
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();	
		   		var t=screenObjects.getScreenObject("purcretgrid_data");
				var cols=t.getCols();
				var s=t.getSize();
			
				for(var i=0;i<s;i++){
			   	if(t.getCurrentRow()==i )
			   		{
			   		prod_code=toNumber(t.getText(i,cols.product_code));
			   	    var a=new FlexUI.Ajax();
			   	     var r=a.callAjax("GET","/tekknow/service/ajax?id=getpurcrate&ro=false&ic=0&ledger_code="+screenObjects.getScreenObject("ledger_code").getValue()+"&product_code="+prod_code );
			   			if(r!=null){
			   					if(r.data){		
			   						t.setText(i,cols.rate,r.data[0][0]);	
    							}
				    	}	
			  
			   		}
			    }
			}
			
			return true;
		}
		function onRowDelete(e,args){
			  	var grid=screenObjects.getScreenObject("purcretgrid_data");
			  	calculateTotal();
		
			  	//
			 // 	return false;
		}
	</script>
</body>
</html>