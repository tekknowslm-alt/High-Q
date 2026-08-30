<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Proforma Invoice</title>
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
			Proforma Invoice 
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Proforma Invoice No</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="pi_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="pi_date"></div>
				</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Buyer</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="buyer_name"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Consignee</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="consignee_name"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Deli. Address</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="deli_address_name"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Order Reference</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="order_reference"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Pre-Carriage By</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="pre_carriage_by"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Place of Receipt</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="place_of_receipt"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Port of Loading</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="port_of_loading_name"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Port of Discharge</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="port_of_discharge_name"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Origin</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="origin"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Destination</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="destination"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Final Destination</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="final_destination"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Final Location</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="final_location"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Transporter</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="transporter_name"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Inco Terms </label></div>
				<div class="col-md-10"><select class="form-control" id="freight_type"/></div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Freight Terms</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="freight_terms"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Freight/Kg</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="freight_kg"></div>
				</div>
				
			</div>			
			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Payment Terms</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="payment_terms_name"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Insurance</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="insurance"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero" >
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Credit Days</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="credit_days"></div>
			</div>
			</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
			<div class="form-group mbotto">
				<div class="col-md-2"><label>Document Thru.</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="docs_through"></div>
				</div>
			
			</div>
			
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Buyer Order No</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="buyer_order_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Buyer Order Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="buyer_order_date"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms1" value="PRODUCT"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms1_det"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms2" value="PRICE"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms2_det"></div>
				</div>
				</div>
			</div>
		<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms3" value="SHIPMENT"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms3_det"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms4" value="PAYMENT"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms4_det"></div>
				</div>
				</div>
			</div>
		<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms5" value="PACKING"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms5_det"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms6" value="DELI &PAY TERMS"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms6_det"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms7" value="VALIDITY"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms7_det"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms8" value="REMARKS"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms8_det"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms9"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms9_det"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><input type="text" class="form-control" id="terms10"></div>
					<div class="col-md-6"><input type="text" class="form-control" id="terms10_det"></div>
				</div>
				</div>
			</div>
		
		 </div>
		</div>
		<div class="clearfix"></div>	
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="pigrid" style="height:350px">
			<span>po Grid<span/>
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
	<script>
    var sProps={js:"",screen:[
  	{name:"group1",predesigned:true,contentType:"Fields",
  	fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"potype"},
  	{name:"pi_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"pi_date"},  	
  	{name:"pi_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"buyer_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"buyer_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"buyer_name",tt:false,id:"ledger_name"},
  	{tgt:"buyer_name",tt:true,id:"ledger_name"},
  	{tgt:"buyer_code",tt:false,id:"ledger_code"}
  	]}},
		{name:"consignee_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  {name:"consignee_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"consignee_name",tt:false,id:"ledger_name"},
  	{tgt:"consignee_name",tt:true,id:"ledger_name"},
  	{tgt:"consignee_code",tt:false,id:"ledger_code"}
  	]}},
  	{name:"deli_address_code",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"deli_address_name"},
  	{name:"deli_address_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"deli_address_name",tt:false,id:"ledger_name"},
  	{tgt:"deli_address_name",tt:true,id:"ledger_name"},
  	{tgt:"deli_address_code",tt:false,id:"ledger_code"}
  	]}},
  	{name:"order_reference",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"pre_carriage_by",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"place_of_receipt",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  		{name:"port_of_loading",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"port_of_loading_name"},  	
  	{name:"port_of_loading_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"portmast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"port_of_loading_name",tt:false,id:"port_name"},
  	{tgt:"port_of_loading_name",tt:true,id:"port_name"},
  	{tgt:"port_of_loading",tt:false,id:"port_code"}
  	]}},
  		{name:"port_of_discharge",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"port_of_discharge_name"},  	
  	{name:"port_of_discharge_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"portmast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"port_of_discharge_name",tt:false,id:"port_name"},
  	{tgt:"port_of_discharge_name",tt:true,id:"port_name"},
  	{tgt:"port_of_discharge",tt:false,id:"port_code"}
  	]}},
  	{name:"origin",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"vide"},
  	{name:"destination",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"vide"},
  	{name:"final_destination",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"vide"},
  	{name:"final_location",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"vide"},
  		{name:"transporter_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"transporter_name"},  	
  	{name:"transporter_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"transporter",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"transporter_name",tt:false,id:"ledger_name"},
  	{tgt:"transporter_name",tt:true,id:"ledger_name"},
  	{tgt:"transporter_code",tt:false,id:"ledger_code"}
  	]}},
  	{name:"freight_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"P","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"podate",values:"F~C~I~D~U~A",keys:"FOB~C&F~CIF~DES~DDU~FCA"},
  	{name:"freight_terms",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"P","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"podate",values:"P~T~S~I",keys:"Paid~To Pay~Sharing~Included"},
  		{name:"payment_terms_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"payment_terms_name"},  	
  	{name:"payment_terms_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"payment_terms",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"payment_terms_name",tt:false,id:"payment_terms"},
  	{tgt:"payment_terms_name",tt:true,id:"payment_terms"},
  	{tgt:"payment_terms_code",tt:false,id:"payment_terms_code"}
  	]}},
  	{name:"freight_kg",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"credit_days",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"docs_through",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"insurance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"buyer_order_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"buyer_order_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"terms1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms1_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms2_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms3_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
   	{name:"terms4",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms4_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms5",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms5_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms6",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms6_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms7",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms7_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms8",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms8_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms9",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms9_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms10",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"terms10_det",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
 
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"pigrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "marks_nos", name: "Marks Nos.", field: "marks_nos",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false},
    {order:"2",id: "packingcode", name: "Packing", field: "packingcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"3",id: "packingvalue", name: "PackingValue", field: "packingvalue",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "packingname", name: "Packing Type", field: "packingname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"packing_type",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"packing_type_code",col:"packingcode"},
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"packing_type_name",col:"packingname"},
  	{tgt:"pigrid_data",tt:true,row:"cr",id:"packing_type_name",col:"packingname"},
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"packing_value",col:"packingvalue"}
  	]}},  
    {order:"5",id: "productcode", name: "ProductCode", field: "productcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"6",id: "productname", name: "Material Description", field: "productname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"product_code",col:"productcode"},
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"pigrid_data",tt:true,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"unit_code",col:"unitcode"},
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"unit_name",col:"unitname"},
  	{tgt:"pigrid_data",tt:true,row:"cr",id:"unit_name",col:"unitname"}  	  	  	  	  	
  	]}},
  	{order:"7",id: "material_description", name: "Buyer Material Description", field: "material_description",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false},
    {order:"8",id: "packs", name: "Packs", field: "packs",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"9",id: "pack_rate", name: "Pack-Rate", field: "pack_rate",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"10",id: "qty", name: "Qty", field: "qty",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"11",id: "pack", name: "Unit", field: "pack",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
     {order:"12",id: "curr_code", name: "CurrCode", field: "curr_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"13",id: "curr_name", name: "Currency", field: "curr_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"curr_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"curr_code",col:"curr_code"},
  	{tgt:"pigrid_data",tt:false,row:"cr",id:"curr_name",col:"curr_name"},
  	{tgt:"pigrid_data",tt:true,row:"cr",id:"curr_name",col:"curr_name"},
  	]}},
    {order:"14",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"15",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
  ]
    }}]};
	var proinv=new FlexUI.Screen("proinv",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("pigrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("pigrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("potype").focus();
        });
        function saveproinv(){
        	if('<%=mode%>'=="View") return;
        	if(proinv.getSaveInProgress()) return;
        	var r=null;
    		proinv.setOperation("ADD");
    		proinv.setScreenCode("600004");
    		var d=proinv.processDataToSave();
    		proinv.setSaveInProgress(true);    		
			if("FAILED"!=d){
				var s=new FlexUI.Ajax();
				showLoader();
				r=s.callAjax("POST","/tekknow/service/screen/save",d);
				hideLoader();
		 	}else{
		 		alert("Please correct the validation errors and continue...");
		 		proinv.setSaveInProgress(false);		 		
		 		return;
		 	}		 
		 	if(r.result=="Success"){
				alert(r.message+" [No:"+r.pono+"]");
				clearInnerScreen();
				return r.code;			
			}else{
				proinv.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function onpoTypeChange(id,me){
        	var gt=screenObjects.getScreenObject("potype").getValue();
        	screenObjects.getScreenObject("poprefix").setValue("H"+gt);
        	return true;
        }
        function clearInnerScreen(){
        	proinv.clearScreen();
        	proinv.setSaveInProgress(false);
        	onpoTypeChange();
        	if("<%=mode%>"=="View"){
        		$('.ui-dialog').children().remove();
				$('.ui-dialog').remove();
				$("#bodyContainer").children().remove();
				$("#bodyContainer").html("");
				$("#bodyContainer").load("/tekknow/billPrintRequest.do?id=11&title=Bills");
        	}
        }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			//calculateTotal();
			calculateAmount(t.getCurrentRow());
			//screenObjects.getScreenObject("qty").setValue(screenObjects.getScreenObject("packingvalue").getValue()*screenObjects.getScreenObject("packs").getValue());
			return true;
		}
		function calculateAmount(row){
			var t=screenObjects.getScreenObject("pigrid_data");
			var cols=t.getCols();	
			var baseqty=0;
		
			t.setText(row,cols.qty,toNumber(t.getText(row,cols.packingvalue))*toNumber(t.getText(row,cols.packs)));
			
			baseqty=toNumber(t.getText(row,cols.qty));
			var amt=roundOff(toNumber(t.getText(row,cols.rate))*baseqty,2);
			t.setText(row,cols.amount,roundOff(amt,2));
		}
		
		function calculateTotal(){
			var total=0;
			var t=screenObjects.getScreenObject("pigrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				total+=toNumber(t.getText(i,cols.amount));
			}
			screenObjects.getScreenObject("totalamt").setValue(roundOff(total,2));
			screenObjects.getScreenObject("netamount").setValue(roundOff(total,2));
			$("#netAmt").html("Net Amount   "+roundOff(total,2));
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveproinv();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadpoData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			proinv.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}
	</script>
</body>
</html>