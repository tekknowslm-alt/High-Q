<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Purchase/Sales</title>
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
			Purchase/Sales
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>No.</label></div>
					<div class="col-md-3"><input type="text" class="form-control" id="vou_no"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Transaction Type</label></div>
					<div class="col-md-4"><select class="form-control" id="tran_type"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="isgir"></div>
				</div>
				</div>	
			</div>
			 <div class="clearfix"></div>
			 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="receiptsgrid" style="height:350px">
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
	<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveReceipts()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editReceipts()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelSizingInv()">Delete</div>	
				</span>
			</div>
    	</div>
    var sProps={js:"",screen:[
	<script>
    {name:"group1",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"companycode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"vou_no",inputType:0,type:"int",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
	{name:"tran_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"T","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername",values:"P~S~D~C",keys:"Purchase~Sales~Purchase Return~Sales Return"},
  	{name:"tran_type",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"amount"},
 	{name:"exp_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"credt_ledger_code"},  	
  	{name:"exp_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_expenses",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"exp_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"exp_ledger_name",tt:true,id:"ledger_name"},
   {tgt:"exp_ledger_code",tt:false,id:"ledger_code"}
	]},},
	  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
	]},
	{name:"purcsalegrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",optional:false,enableColumnTotal:true,rowEmptyCheckColumn:"bill_date",columns:[
	{order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "bill_date", name: "Bill Date", field: "bill_date",defaultValue:"0","inputType":0,"type":"TDATE","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"left","chkTag":false,onchange:""},
  	{order:"2",id: "bill_no", name: "Bill No.", field: "bill_no",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:65,"chkTag":false,onchange:""},
  	{order:"3",id: "ledger_code", name: "ledger_code", field: "ledger_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "ledger_name", name: "Party", field: "ledger_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_both",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
 	{tgt:"purcsalegrid_data",tt:false,row:"cr",id:"ledger_code",col:"ledger_code"},
 	{tgt:"purcsalegrid_data",tt:false,row:"cr",id:"ledger_name",col:"ledger_name"},
  	{tgt:"purcsalegrid_data",tt:true,row:"cr",id:"ledger_name",col:"ledger_name"},  	
  	{tgt:"purcsalegrid_data",tt:false,row:"cr",id:"local_interstate",col:"local_interstate"},
  	{tgt:"purcsalegrid_data",tt:true,row:"cr",id:"local_interstate",col:"local_interstate"},  
  	  	{tgt:"purcsalegrid_data",tt:false,row:"cr",id:"gst_per",col:"gst_per"},
  	{tgt:"purcsalegrid_data",tt:true,row:"cr",id:"gst_per",col:"gst_per"},  		
  	]}},
  	{order:"5",id: "hsn_code", name: "HSN", field: "hsn_code",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:65,align:"center","chkTag":false},
  	{order:"6",id: "qty", name: "Qty", field: "qty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:65,align:"right","chkTag":false,onchange:"onAmountChange"},
  	{order:"7",id: "local_interstate", name: "Type", field: "local_interstate",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":false,width:0,align:"right","chkTag":false},
  	{order:"8",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
    {order:"9",id: "gst_per", name: "GST %", field: "gst_per",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:65,align:"right","chkTag":false,onchange:"onGSTPerChange"},
 	{order:"10",id: "freight", name: "Freight", field: "freight",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:"onFreightChange"},
 	{order:"11",id: "cgst_amount", name: "CGST", field: "cgst_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:"OnCGSTChange"},
  	{order:"12",id: "sgst_amount", name: "SGST", field: "sgst_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:"OnSGSTChange"},
  	{order:"13",id: "igst_amount", name: "IGST", field: "igst_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:"OnIGSTChange"},
  	{order:"14",id: "round_off", name: "Round", field: "round_off",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:"OnRoundoffChange"},
  	{order:"15",id: "net_amount", name: "Net Amount", field: "net_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	  ]
    }}]};
    var gir=new FlexUI.Screen("warpbreaks",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
			screenObjects.getScreenObject("companycode").setValue($('#company').val());
            screenObjects.getScreenObject("purcsalegrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("purcsalegrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            var grid=screenObjects.getScreenObject("purcsalegrid_data").onBeforeDeleteRow.subscribe(onRowDelete);
            screenObjects.getScreenObject("tran_type").focus();
      	loadInvNo();
      	  });
      	  function prntInvoice(invno){
      	  	window.open("/tekknow/service/invoice/invoiceprint?invoiceno="+invno,"_blank");
      	  }
        function saveReceipts(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
        	var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		}    
    		//alert(gir.getOperation());
    		gir.setScreenCode("600002");
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
				alert(r.message+" [No:"+code+"]");
				//prntInvoice(code);
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
        function clearInnerScreen(){
        	gir.clearScreen();
        	gir.setSaveInProgress(false);
        	screenObjects.getScreenObject("companycode").setValue($('#company').val());
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
         function loadInvNo(){
			  var a=new FlexUI.Ajax();
	 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=purc_sale_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue());
 		  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("vou_no").setValue(r.data[0][0]);	
    						}
					    }	
			  }
			     function ClearColumnsLedgerCode(id,me){
			        if(!gir.getSaveInProgress()){
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
	  function SetWeightRow(id,me){
	  	if(!gir.getSaveInProgress()){
	  		var t=screenObjects.getScreenObject("purcsalegrid_data");
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
			//calculateTotal();
			return true;
		}
		function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
		 
		function onFreightChange(id,me){
			var t=me.getParent();
				var total=0;
			var total_cones=0;
			var gst_perc=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				if(t.getCurrentRow()==i ){
			t.setText(i,cols.cgst_amount, 0);
			t.setText(i,cols.sgst_amount, 0);
			t.setText(i,cols.igst_amount, 0);
			gst_per=toNumber(t.getText(i,cols.gst_per));
				/*if( gst_per==0 && toNumber( t.getText(i,cols.cgst_amount))==0 && toNumber( t.getText(i,cols.igst_amount) )==0)
				{
				gst_per=5;
				t.setText(i,cols.gst_per,gst_per);
			
			}*/
			if(t.getText(i,cols.local_interstate)=="L"){
				t.setText(i,cols.cgst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per/2)/100 ,2));
				t.setText(i,cols.sgst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per/2)/100,2));
			 }
			 else
			 {
			 if(t.getText(i,cols.local_interstate)=="I"){
				t.setText(i,cols.igst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per)/100 ,2));
				}
				else
				{
					t.setText(i,cols.igst_amount, 0);
					t.setText(i,cols.sgst_amount, 0);
					t.setText(i,cols.igst_amount, 0);
				}
			}
			}
			}
			calculateTotal();
			return true;
		}	
		function OnRoundoffChange(id,me){
			var t=me.getParent();
				var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			calculateTotal();
			return true;
		}			
		function onCGSTChange(id,me){
			var t=me.getParent();
				var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			calculateTotal();
			return true;
		}		
		function onSGSTChange(id,me){
			var t=me.getParent();
				var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			calculateTotal();
			return true;
		}		
		function onIGSTChange(id,me){
			var t=me.getParent();
				var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			calculateTotal();
			return true;
		}		
			function onGSTPerChange(id,me){
				var total=0;
			var total_cones=0;
			var gst_per=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
		if(t.getCurrentRow()==i ){
			t.setText(i,cols.cgst_amount, 0);
			t.setText(i,cols.sgst_amount, 0);
			t.setText(i,cols.igst_amount, 0);
			gst_per=toNumber(t.getText(i,cols.gst_per));
			if(t.getText(i,cols.local_interstate)=="L"){
				t.setText(i,cols.cgst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per/2)/100 ,2));
				t.setText(i,cols.sgst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per/2)/100,2));
			 }
			 else
			 {
			 if(t.getText(i,cols.local_interstate)=="I"){
				t.setText(i,cols.igst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per)/100 ,2));
				}
				else
				{
					t.setText(i,cols.igst_amount, 0);
					t.setText(i,cols.sgst_amount, 0);
					t.setText(i,cols.igst_amount, 0);
				}
			}}
			}
			calculateTotal();
				return true;
		}
		function onAmountChange(id,me){
				var total=0;
			var total_cones=0;
			var gst_per=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
		if(t.getCurrentRow()==i ){
			t.setText(i,cols.cgst_amount, 0);
			t.setText(i,cols.sgst_amount, 0);
			t.setText(i,cols.igst_amount, 0);
			gst_per=toNumber(t.getText(i,cols.gst_per));
			
			/*	if( gst_per==0 && toNumber( t.getText(i,cols.cgst_amount))==0 && toNumber( t.getText(i,cols.igst_amount) )==0 )
				{
	  			gst_per=5;
			 	t.setText(i,cols.gst_per,gst_per);
			
			}
					 */
			if(t.getText(i,cols.local_interstate)=="L"){
				t.setText(i,cols.cgst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per/2)/100 ,2));
				t.setText(i,cols.sgst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per/2)/100,2));
			 }
			 else
			 {
			 if(t.getText(i,cols.local_interstate)=="I"){
				t.setText(i,cols.igst_amount, roundOff((toNumber( t.getText(i,cols.amount)) +toNumber( t.getText(i,cols.freight))) *(gst_per)/100 ,2));
				}
				else
				{
					t.setText(i,cols.igst_amount, 0);
					t.setText(i,cols.sgst_amount, 0);
					t.setText(i,cols.igst_amount, 0);
				}
			}}
			}
			calculateTotal();
				return true;
		}
		
		function calculateTotal(){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("purcsalegrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){	 
				if(t.getCurrentRow()==i )
				{
				t.setText(i,cols.net_amount,roundOff(toNumber(t.getText(i,cols.amount)) +toNumber(t.getText(i,cols.freight)) + toNumber(t.getText(i,cols.cgst_amount)) + toNumber(t.getText(i,cols.sgst_amount))+ toNumber(t.getText(i,cols.igst_amount)) +toNumber(t.getText(i,cols.round_off)),2));
		}
			 }
			//$("#netAmt").html("Net Amount   "+roundOff(total,2));*/
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveReceipts();
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
			//calculateTotal();			
		  	hideLoader();
		}
		function editReceipts(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"purc_sale_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function cancelSizingInv(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"purc_sale_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600002","code="+args.result[2]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			hideLoader();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600002","code="+args.result[2]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
	
		function getSetBeamDetails(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=warpbeamlist&warping_code="+screenObjects.getScreenObject("warping_code").getValue());
				var dg=screenObjects.getScreenObject("purcsalegrid_data");
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
		function onRowDelete(e,args){
			  	var grid=screenObjects.getScreenObject("purcsalegrid_data");
			  	//
			 // 	return false;
		}
	</script>
</body>
</html>