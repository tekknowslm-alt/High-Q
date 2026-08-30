<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Sizing Invoice</title>
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
			Sizing Invoice
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Date</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="inv_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Invoice No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="inv_no"></div>
				</div>
				</div>
			
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Party</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>	<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Set No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="set_no"></div>
				</div>
				</div>	
			
			</div>			
						
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Count</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="count_name"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Mill</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="mill_name"></div>
				</div>
				</div>
				</div>			
							
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Ends</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="ends"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Mtrs</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="mtrs"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>DC Qty</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="dc_qty"></div>
				</div>
				</div>
			</div>
		
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Total Amount</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="total_amount"></div>
				</div>
				</div>	<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Remarks</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-6"><label>Sizing Rate</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="sizing_rate"></div>
				</div>
			</div>
	 		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="sizinginvgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveSizingDelivery()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editSizingInv()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelSizingInv()">Cancel</div>	
				</span>
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
	    		<%--div style="background:#fedc34; display:inline-block; width:100%; padding:5px 10px">
		    		<div class="netAm" id="netAmt">Net Amount 0.00</div>
		    		<div class="col-md-4 colBg2 mpZero"><div class="col-md-6">Disc</div><div class="col-md-6" id="disc">0.00</div></div>
		    		<div class="col-md-4 colBg2 mpZero"><div class="col-md-6">VAT</div><div class="col-md-6" id="vat">0.00</div></div>
		    		<div class="col-md-4 colBg2 mpZero"><div class="col-md-6">Total</div><div class="col-md-6" id="totamt">0.00</div></div>
	    		</div--%>
    		</div>
    	</div>
	<script>
	var sProps={js:"",screen:[
    {name:"group1",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"inv_no",inputType:0,type:"int",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"inv_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"warping_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
 	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",validation:"ClearColumnsLedgerCode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
    {name:"set_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",validation:"SetWeightRow",lovOptions:{url:"/tekknow/service/ajax",ajax:"set_no_list",scrollEnabled:true,searchFromList:false,dsi:0,
  	params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"set_no",tt:false,id:"set_no"},
  	{tgt:"set_no",tt:true,id:"set_no"},
  	{tgt:"warping_code",tt:false,id:"warping_code"},
  	 {tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"},
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"},
  	{tgt:"ends",tt:false,id:"total_ends"},
  	{tgt:"mtrs",tt:false,id:"set_length"},
  	{tgt:"dc_qty",tt:false,id:"dc_qty"},
  	{tgt:"sizing_rate",tt:false,id:"sizing_rate"},
  		]}},
  	{name:"count_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"count_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"}
    	]}},
 	{name:"mill_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"mill_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"}
    	]}},
    {name:"sizing_rate",inputType:0,type:"deci",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"dc_qty",inputType:0,type:"deci",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
	{name:"ends",inputType:0,type:"int",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
	{name:"mtrs",inputType:0,type:"deci",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
	{name:"total_amount",inputType:0,type:"deci",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
 
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]}, 	
  	{name:"sizinginvgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"descr_code",optional:false,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "descr_code", name: "descr_code", field: "descr_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "description", name: "Description ", field: "description",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"sizinginvdescr_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"sizinginvgrid_data",tt:false,row:"cr",id:"descr_code",col:"descr_code"},
  	{tgt:"sizinginvgrid_data",tt:false,row:"cr",id:"description",col:"description"},
  	{tgt:"sizinginvgrid_data",tt:true,row:"cr",id:"description",col:"description"}	
  	]}},
  	{order:"3",id: "qty", name: "Qty", field: "qty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"4",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"5",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	  ]
    }}]};
var gir=new FlexUI.Screen("warpbreaks",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
            screenObjects.getScreenObject("sizinginvgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("sizinginvgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            var grid=screenObjects.getScreenObject("sizinginvgrid_data").onBeforeDeleteRow.subscribe(onRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
      	loadInvNo();
      	  });
      	  function prntInvoice(invno){
      	  	window.open("/tekknow/service/invoice/invoiceprint?invoiceno="+invno,"_blank");
      	  }
        function saveSizingDelivery(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
        	var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		}    
    		//alert(gir.getOperation());
    		gir.setScreenCode("600049");
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
				prntInvoice(code);
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
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=sizing_inv_no&ro=false&ic=0","");
 	 	  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("inv_no").setValue(r.data[0][0]);	
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
	  		var t=screenObjects.getScreenObject("sizinginvgrid_data");
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
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("sizinginvgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
			t.setText(i,cols.amount,toNumber(t.getText(i,cols.qty)) * toNumber(t.getText(i,cols.rate)) );			 
			total+=toNumber(t.getText(i,cols.amount));
			screenObjects.getScreenObject("total_amount").setValue(total);
	        }
		
			//$("#netAmt").html("Net Amount   "+roundOff(total,2));*/
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveSizingDelivery();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadSizingInvData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
		function editSizingInv(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"sizinginv_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
		var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600049","code="+args.result[4]);
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600049","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelSizingInv(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"sizinginv_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
		function getSetBeamDetails(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=warpbeamlist&warping_code="+screenObjects.getScreenObject("warping_code").getValue());
				var dg=screenObjects.getScreenObject("sizinginvgrid_data");
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
			  	var grid=screenObjects.getScreenObject("sizinginvgrid_data");
			  	//
			 // 	return false;
		}
	</script>
</body>
</html>