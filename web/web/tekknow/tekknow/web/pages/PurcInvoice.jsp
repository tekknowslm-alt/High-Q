<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Purchase Invoice</title>
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
	<input type="hidden" id="prevreportid" value=""/>

    <div class="col-sm-12 col-md-12 col-lg-12 mpZero  marTp" id="heading">
    	<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
    	    		Purchase Invoice
    	    		<span class="pull-right"><button class="btn btn-sm" onclick="backToMainReport();" id="repback" style="display:none"><i class="fa fa-arrow-up"></i></span></div>
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero " style="margin-bottom:60px">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			 <div class="col-md-12 col-sm-12 mpZero">
			<div class="clearfix"></div>`
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
					<div class="form-group mbotto">
					<div class="col-md-2"><label>Tran. Type</label></div>
					<div class="col-md-4"><select class="form-control" id="transaction_type"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="transaction_type"></div>
					<div class="col-md-1"><label>Date</label></div>
					<div class="col-md-2"><input type="text" class="form-control" id="inv_date"></div>
					<div class="col-md-1"><label>No.</label></div>
					<div class="col-md-2"><input type="text" class="form-control" id="inv_no"></div>
				</div>				
			</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
					<div class="form-group mbotto">
					<div class="col-md-2"><label>Disc %</label></div>
					<div class="col-md-4"><select class="form-control" id="disc_text"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="disc_text"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="disc_per"></div>
				
				</div>				
				</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Vendor</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>	
					  	<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Amount</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="tot" disabled></div>
				</div>
					</div>	 
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Address1</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="address1" disabled></div>
				</div>
				</div>				 
				<div  class="col-md-6 col-sm-6 mpZero">		 	
			<div class="form-group mbotto">
					<div class="col-md-2"><label>CGST %</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="cgst_per"  disabled></div>
						<div class="col-md-6"><input type="text" class="form-control" id="cgst_amount"  disabled></div>
				</div> 
			</div>			
			</div>
		
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Address2</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="address2" disablled></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		 	
			<div class="form-group mbotto">
					<div class="col-md-2"><label>SGST %</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="sgst_per"  disabled></div>
						<div class="col-md-6"><input type="text" class="form-control" id="sgst_amount"  disabled></div>
				</div> 
			</div>			
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Address3</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="address3" disablled></div>
				</div>
				</div>
			<div  class="col-md-6 col-sm-6 mpZero">		 	
			<div class="form-group mbotto">
					<div class="col-md-2"><label>IGST %</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="igst_per"  disabled></div>
						<div class="col-md-6"><input type="text" class="form-control" id="igst_amount"  disabled></div>
				</div> 
			</div>			
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Address4</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="address4" disablled></div>
				</div>
				</div>
			<div  class="col-md-6 col-sm-6 mpZero">		
			<div class="form-group mbotto">
					<div class="col-md-2"><label>Total Amount</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="total_amount" disabled></div>
				</div>
			</div>	
			
				
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>GSTIN</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="gstin_no"></div>
				</div>
				</div>				
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Notes</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="notes"></div>
					</div>
				</div>	
					<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-3 col-sm-3 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Party Inv. Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="party_inv_date"></div>
				</div>
				</div>
				<div  class="col-md-3 col-sm-3 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Party Inv. No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="party_inv_no"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>DC Details</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="dc_detail" disabled></div>
					</div>
				</div>	
							 
			<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="purcinvdetgrid" style="height:260px">
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
					<div class="col-sm-1 col-md-1 col-lg-1 adCl" onClick="showDC()">DC</div>
				</span>
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
				<div class="col-sm-12 col-md-12" style="background:#fedc34; display:inline-block;height:39px;text-align:center;padding-top:0px" >
	    		<input type="hidden" id="detamount" value="0"/><input type="hidden" id="billamount" value="0"/>
    			<div class="netAm"><span id="netAmt">0.00</span></div>
    			</div>
    		</div
    	></div>
    <div style="display:none">
		<div id='dcdlg' class='pop_lov_box'>
			<div id='dctitle' class='pop_lov_hed_box'>
			<div class='pop_lov_clos'>
				<a href='#'>
					<span class='fa fa-times-circle'>
					</span>
				</a>
			</div>
			<div class='pop_lov_hed_txt' id="h1">Select DC</div>
			</div>
			<div id='dcbdy' class='pop_lov_inp_box'>
			   <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 	<div class="col-md-12 col-sm-12 mpZero" id="bnselectgrid" style="height:350px">
		      	</div>
		      	</div>		
				<div class="clearfix"></div>
				<div id="actButton" class="col-md-12 text-right">
                	<button id="btnSave1" class="btn btn-primary priBut" type="button" onclick="saveDC()">OK</button>
	                <button id="btnClear1" class="btn btn-default" type="button" onclick="cancelDCDlg()">Cancel</button>
            	</div>							
			</div>
		</div>
	</div>
	<script>
	var sProps={js:"",screen:[
    {name:"group1",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"companycode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"transaction_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"Discount","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,onchange:"onTranTypeChanged","chkTag":false,nf:"suppliername",values:"I~B",keys:"Purchase Invoice~Bought Note"},
    {name:"inv_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"12px",style:"italic",color:"#424242"},background:"#ffffff"},
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
  	{tgt:"gstin_no",tt:false,id:"gstin_no"},  	
  	{tgt:"local_interstate",tt:false,id:"local_interstate"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    ]},validation:"onLedgerCodeChange"}, 	
  	{name:"address1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address4",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"gstin_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"party_inv_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
    {name:"party_inv_no",inputType:0,type:"int",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
    {name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
    
    {name:"invoice_date",inputType:0,type:"DATE",caption:"Original Inv. Date",mandatory:false,defaultValue:"L","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"local_interstate",inputType:0,type:"TEXT",caption:"LocalInterstate",mandatory:false,defaultValue:"L","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"disc_text",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"Discount","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,onchange:"onDiscChanged","chkTag":false,nf:"suppliername",values:"Discount~Aadi-Discount",keys:"Discount~Aadi-Discount~Spl-Discount"},
    {name:"disc_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"bill_disc_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"aadi_disc_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"spl_disc_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"discount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":0,onchange:"onRateQuantityChange","decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
    {name:"tot",inputType:0,type:"DECIMAL",caption:"Taxable Amount",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"700",size:"17px",style:"bold",color:"#000099"},background:"#cc8800"},
    {name:"cgst_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffdd99"},
    {name:"cgst_amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffdd99"},
    {name:"sgst_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffdd99"},
    {name:"sgst_amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffdd99"},
	{name:"igst_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffdd99"},
    {name:"igst_amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",align:"right",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffdd99"},
    {name:"total_amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":2,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",align:"right",font:{weight:"800",size:"20px",style:"bold",color:"#000099"},background:"#cc8800"},
    {name:"round_off",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode",align:"right"},
    {name:"notes",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,onchange:"onRateQuantityChange","decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
    {name:"dc_detail",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
    
      
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"purcinvdetgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"product_code",optional:false,enableColumnTotal:true,columns:[
   	{order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
	{order:"1",id: "product_code", name: "Product Code", field: "product_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
	{order:"2",id: "product_name", name: "Product", field: "product_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
	{tgt:"purcinvdetgrid_data",tt:false,row:"cr",id:"product_code",col:"product_code"},
 	{tgt:"purcinvdetgrid_data",tt:false,row:"cr",id:"product_name",col:"product_name"},
  	{tgt:"purcinvdetgrid_data",tt:true,row:"cr",id:"product_name",col:"product_name"},
  	{tgt:"purcinvdetgrid_data",tt:false,row:"cr",id:"hsn_code",col:"hsn_code"},
  	{tgt:"purcinvdetgrid_data",tt:true,row:"cr",id:"hsn_code",col:"hsn_code"},  			
  	{tgt:"purcinvdetgrid_data",tt:false,row:"cr",id:"unit_code",col:"unit_code"},
  	{tgt:"purcinvdetgrid_data",tt:true,row:"cr",id:"unit_code",col:"unit_code"},  
	{tgt:"purcinvdetgrid_data",tt:false,row:"cr",id:"unit_name",col:"unit_name"},
  	{tgt:"purcinvdetgrid_data",tt:true,row:"cr",id:"unit_name",col:"unit_name"},   				
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
	{order:"14",id: "bn_code", name: "bncode", field: "bn_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
	  ]
    }},
    {name:"bnselectgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"bn_code",optional:true,enableColumnTotal:true,columns:[
	{order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:0,sno:true},
    {order:"1",id: "bn_no", name: "BN.No.", field: "bn_no",defaultValue:"0","inputType":0,"type":"int","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"center","chkTag":false,onchange:"onProductCodeChange"},
    {order:"2",id: "bn_date", name: "Date", field: "bn_date",defaultValue:"0","inputType":0,"type":"DATE","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"center","chkTag":false,onchange:"onRateQuantityChange"},
 	{order:"3",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"deci","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
	{order:"4",id: "no_of_items", name: "No.of Lines", field: "no_of_items",defaultValue:"0","inputType":0,"type":"int","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:75,align:"center","chkTag":false,onchange:"onRateQuantityChange"},
    {order:"5",id: "hsn_code", name: "HSN", field: "hsn_code",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"center","chkTag":false,onchange:"onRateQuantityChange"},
    {order:"6",id: "note", name: "Note", field: "note",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"center","chkTag":false,onchange:"onRateQuantityChange"},        
 	{order:"7",id: "is_select", name: "Tick", field: "is_select",defaultValue:"0","inputType":2,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"center","chkTag":false,cTotal:true,onclick:"onIsPaidChange"},
  	{order:"8",id: "bn_code", name: "BNCode", field: "bn_code",defaultValue:"0","inputType":0,"type":"int","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,align:"center","chkTag":false,onchange:"onProductCodeChange"},
	          ]
    }}]};
	<%@ include file = "drilldown.jsp" %>
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

			screenObjects.getScreenObject("invoice_date").setValue("");

			screenObjects.getScreenObject("purcinvdetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("purcinvdetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            var grid=screenObjects.getScreenObject("purcinvdetgrid_data").onBeforeDeleteRow.subscribe(onRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
      		loadInvNo();
	       	if("<%=code%>"!="" && "<%=code%>"!="null"){
	       		//debugger
				onEditClose(undefined,undefined,<%=code%>)
			}	       
	       
		    //setInterval(getScannedItem,3000);        
      	  });
      	  function prntInvoice(invno){
      	  	window.open("/tekknow/service/invoice/purcinvprint?invoiceno="+invno,"_blank");
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
    		gir.setScreenCode("600053");
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
				  var xy=a.callAjax("GET","/tekknow/service/ajax?id=purc_inv_code_list&ro=false&ic=0");
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
		function onTranTypeChanged(id,me)
		{
			  var a=new FlexUI.Ajax();
			  var r=a.callAjax("GET","/tekknow/service/ajax?id=purc_inv_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue()+ "&trantype="+screenObjects.getScreenObject("transaction_type").getValue()) ;
			  if(r!=null){
	 			if(r.data){
	 				screenObjects.getScreenObject("inv_no").setValue(r.data[0][0]);
		   	 				}
					    }	
			return true;
		}
        function onLedgerCodeChange(){
	        	 screenObjects.getScreenObject("cgst_per").setValue(0);
	        	screenObjects.getScreenObject("sgst_per").setValue(0);
	        	screenObjects.getScreenObject("igst_per").setValue(0);
	        if(screenObjects.getScreenObject("local_interstate").getValue()=="L")
	        {
	        	screenObjects.getScreenObject("cgst_per").setValue(9);
	        	screenObjects.getScreenObject("sgst_per").setValue(9);
				screenObjects.getScreenObject("igst_per").setValue(0);
	        		        }
	        else
	        {
	        	  if(screenObjects.getScreenObject("local_interstate").getValue()=="I")
	        		{
	  	        		screenObjects.getScreenObject("igst_per").setValue(18);
	  	        		screenObjects.getScreenObject("cgst_per").setValue(0);
	  		        	screenObjects.getScreenObject("sgst_per").setValue(0);
        			}
	        	  else
	        	  {
	 	        	 screenObjects.getScreenObject("cgst_per").setValue(0);
	 	        	screenObjects.getScreenObject("sgst_per").setValue(0);
	 	        	screenObjects.getScreenObject("igst_per").setValue(0);
	        	  }
	        		     
	        }
	        return true;
	}
        function clearInnerScreen(){
            clearInterval();
        	//setInterval(getScannedItem,3000);        
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
							var t=screenObjects.getScreenObject("purcinvdetgrid_data");
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
			  var r=a.callAjax("GET","/tekknow/service/ajax?id=purc_inv_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue()+ "&trantype=I") ;
 	 	  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("inv_no").setValue(r.data[0][0]);	
    						}
					    }	
			  }
			     function ClearColumnsLedgerCode(id,me){
			        if(!gir.getSaveInProgress()	){
			   		/*screenObjects.getScreenObject("set_no").setValue("");
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
					screenObjects.getScreenObject("mtrs").setValue("");*/
					}
				 	return true;   
				}
	  function onStickerQty(id,me,row,col){
	    if(!gir.getSaveInProgress()){
	  		var t=screenObjects.getScreenObject("purcinvdetgrid_data");
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
             	var t=screenObjects.getScreenObject("purcinvdetgrid_data");
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
					//getSalesRate();
					
				}
 				
			}	
			  		
			  }	
					 
			} 
			return true;
		}
	  function SetWeightRow(id,me){
	  	if(!gir.getSaveInProgress()){
	  		var t=screenObjects.getScreenObject("purcinvdetgrid_data");
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
			
			var t=screenObjects.getScreenObject("purcinvdetgrid_data");
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
			var l={url:"/tekknow/service/ajax",ajax:"purc_inv_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		
		}
			function onEditClose(e,args,rcode)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader(); 
			if(!rcode){
				rcode=args.result[3];
			}
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600053","code="+rcode);
			clearInnerScreen();
			clearInterval();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			hideLoader();
			calculateTotal();
			/*var net_amt=0;
	       	net_amt=screenObjects.getscreenObject("total_amount").getValue();
	       	$("#netAmt").html( "Net Amount "+net_amt);
	   */
			//calculateTotal();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600053","code="+args.result[3]);
			clearInnerScreen();
			clearInterval();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelInvoice(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"purc_inv_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
		function getSetBeamDetails(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=warpbeamlist&warping_code="+screenObjects.getScreenObject("warping_code").getValue());
				var dg=screenObjects.getScreenObject("purcinvdetgrid_data");
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
		   		var t=screenObjects.getScreenObject("purcinvdetgrid_data");
				var cols=t.getCols();
				var s=t.getSize();
			
				for(var i=0;i<s;i++){
			   	if(t.getCurrentRow()==i )
			   		{
			   		prod_code=toNumber(t.getText(i,cols.product_code));
			   	    var a=new FlexUI.Ajax();
			   	    var r=a.callAjax("GET","/tekknow/service/ajax?id=getsalesrate&ro=false&ic=0&ledger_code="+screenObjects.getScreenObject("ledger_code").getValue()+"&product_code="+prod_code );
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
			  	var grid=screenObjects.getScreenObject("purcinvdetgrid_data");
			  	calculateTotal();
		
			  	//
			 // 	return false;
		}
		function showDC(){
			$('#dcdlg').dialog({autoOpen:false,modal:true,height:'auto',minHeight:600,minWidth:1300,position:'center'});
			$('#dcdlg').dialog('open');
			$('#h1').text('Select DC');
			getsetDCs();
				}
		function getsetDCs(id,me){
			//getPartyBalance();
			if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		 
		   		var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=dcselectlist&ledgercode="+screenObjects.getScreenObject("ledger_code").getValue());
				var dg=screenObjects.getScreenObject("bnselectgrid_data");
				dg.clear();
				dg.setObjectData(r.data);
			}
			return true;
		}
		function cancelDCDlg(){			
			$('#dcdlg').dialog('close');
			$('#dcdlg').dialog('destroy');
		}
		function saveDC(){ 
			if(!gir.getSaveInProgress()){
				//var noOfBeams=screenObjects.getScreenObject("no_of_sized_beam").getValue();
				//var calcEnds=screenObjects.getScreenObject("total_ends").getValue()/noOfBeams;
				//var setlength=screenObjects.getScreenObject("set_length").getValue()/noOfBeams;
				
				var rd_total=0,discount=0,cgst_amount=0,sgst_amount=0,igst_amount=0,courier=0,gross_amt=0,dc_detail="";
				var t1=screenObjects.getScreenObject("bnselectgrid_data");
				var cols=t1.getCols();
				var s=t1.getSize();
				var is_select="N",bncode="0,";
			
				for(var i=0;i<s;i++){				
					isselect=t1.getText(i,cols.is_select);
					
					if(isselect=="true")
						{
						bncode= bncode.concat(t1.getText(i,cols.bn_code));
						bncode= bncode.concat(",");
					 						
					}
				} 
				bncode= bncode.concat("0");
				
				

				   var a=new FlexUI.Ajax();
					  var r=a.callAjax("GET","/tekknow/service/ajax?id=dcnolist&ro=false&ic=0&bncode=("+bncode+")");
					 
				if(r!=null){	
						if(r.data){						
						var rows=[];
				 	for(var j=0;j<r.data.length;j++)
					 		{
				 			dc_detail=dc_detail+ r.data[j][0] + " / " + r.data[j][1];
							if((j+1)!=r.data.length)
								{dc_detail=dc_detail+ ", ";	
								}
					 		}
				 		}
					}		 
				
				
				  var a=new FlexUI.Ajax();
		 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=dcdetlist&ro=false&ic=0&bncode=("+bncode+")");
		 		  if(r!=null){	
					if(r.data){						
//	   	 			var rowData={product_code:"30",prod_code:"PSPJC6036",product_name:"PURE SILK PJ CREAM 60K 3.60M",hsn_code:"5027",rate:"2500",mtrs:"0",unit_code:"1",unit_name:"pcs",freight_amt:"0"};
					
					//var rowData={product_code:"30",prod_code:"PSPJC6036",product_name:"PURE SILK PJ CREAM 60K 3.60M",hsn_code:"5027",rate:"2500",mtrs:"0",unit_code:1,unit_name="Pcs",freight_amt:"0"};
					var rows=[];
					//ClearColumnsOrderCode();
					//gir.loadObjectData(v);
				
					var t=screenObjects.getScreenObject("purcinvdetgrid_data");
					
					t.clear();
					 	for(var j=0;j<r.data.length;j++)
	    				{
						var productcode=r.data[j][0];
						var prodcode=r.data[j][1];
						var prodname=r.data[j][2];
						var hsncode=r.data[j][3];
						var rate=r.data[j][4];
						var qty=r.data[j][5];
						var mtrs=r.data[j][6];
						var amount=r.data[j][7];
						var unitcode=r.data[j][8];
						var unitname=r.data[j][9];
						var bncode=r.data[j][10];
						
						
						var rowData={product_code:productcode,prod_code:prodcode,product_name:prodname,hsn_code:hsncode,rate:rate,qty:qty,mtrs:mtrs,amount:amount,unit_code:unitcode,unit_name:unitname,bn_code:bncode};
						
	   	 				var newRow = jQuery.extend(true, {}, rowData);
	   	 				rows.push(newRow);
	    				//screenObjects.getScreenObject("rece_no").setValue(r.data[0][0]);	
	    	    		}
	   	 				t.setObjectData(rows);
	   	 			screenObjects.getScreenObject("dc_detail").setValue("DC No. / Date: " +dc_detail);
	   	 			}
	   	 			
	 			  }
		 		 
		 		  calculateTotal();	 			 	 			 
	 			 cancelDCDlg();	 			
			}
			
		}
	</script>
</body>
</html>