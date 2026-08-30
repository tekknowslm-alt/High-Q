<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Salary/Wages Payment</title>
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
			Salary/Wages Payment
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
					<div class="col-md-3"><label>Date</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="pay_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Voucher No.</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="pay_no"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Cash / Bank</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
			</div>			
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Balance</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="balance" disabled></div>
				</div>
					</div>		
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
			    <div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Narration</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="notes"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Amount</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="amount" disabled></div>
				</div>
			    </div>		
			 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="salarygrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onClick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onClick="saveReceipts()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onClick="editReceipts()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onClick="cancelSizingInv()">Delete</div>	
				</span>
			</div>
    	</div>
	<script>
	var sProps={js:"",screen:[
    {name:"group1",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"companycode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
    {name:"pay_no",inputType:0,type:"int",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"pay_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"amount",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"credt_ledger_code"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",validation:"",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_cash",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"companycode",ft:false,src:"companycode"}],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
	]},validation:"getBalance"},
	{name:"balance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,align:"right","chkTag":false,nf:"mode",font:{weight:"700",size:"17px",style:"bold",color:"#424242"},background:"#ffdd99"},
	{name:"act_balance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,align:"right","chkTag":false,nf:"mode"},
	{name:"amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true	,align:"right","chkTag":false,nf:"mode",font:{weight:"800",size:"20px",style:"bold",color:"#000099"},background:"#cc8800"},
	{name:"notes",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,align:"left","chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
	]},
	{name:"salarygrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"emp_det_code",optional:false,enableColumnTotal:true,columns:[
	{order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
	{order:"1",id: "emp_det_code", name: "emp_det_code", field: "emp_det_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
	{order:"2",id: "emp_name", name: "Employee", field: "emp_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"emp_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"companycode",ft:false,src:"companycode"}],results:[
		{tgt:"salarygrid_data",tt:false,row:"cr",id:"emp_det_code",col:"emp_det_code"},
		{tgt:"salarygrid_data",tt:false,row:"cr",id:"emp_name",col:"emp_name"},
      	{tgt:"salarygrid_data",tt:true,row:"cr",id:"emp_name",col:"emp_name"},
      	{tgt:"salarygrid_data",tt:false,row:"cr",id:"balance",col:"balance"},
      	{tgt:"salarygrid_data",tt:true,row:"cr",id:"balance",col:"balance"},  			
      	{tgt:"salarygrid_data",tt:false,row:"cr",id:"salary",col:"salary"},
      	{tgt:"salarygrid_data",tt:true,row:"cr",id:"salary",col:"salary"},  			      	
      	]}},
	{order:"3",id: "balance", name: "Adv.Balance", field: "balance",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
	{order:"4",id: "salary", name: "Salary", field: "salary",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
	{order:"5",id: "advance", name: "Advance", field: "advance",defaultValue:"0","inputType":0,"type":"NEGDECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
  	{order:"6",id: "beta", name: "Beta", field: "beta",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
  	{order:"7",id: "bonus", name: "Bonus", field: "bonus",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
  	{order:"8",id: "incentive", name: "Incentive", field: "incentive",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},  
	{order:"9",id: "total", name: "Total", field: "total",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},  ] 
		
    }}]};
	var gir=new FlexUI.Screen("warpbreaks",sProps);
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
			screenObjects.getScreenObject("companycode").setValue($('#company').val());
            screenObjects.getScreenObject("salarygrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("salarygrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            var grid=screenObjects.getScreenObject("salarygrid_data").onBeforeDeleteRow.subscribe(onRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
	      	loadInvNo();
      	    screenObjects.getScreenObject("amount").setEnabled(false);
      	  screenObjects.getScreenObject("balance").setEnabled(false);
        
      	  });
      	  function prntInvoice(invno){
      	  	window.open("/tekknow/service/invoice/invoiceprint?invoiceno="+invno,"_blank");
      	  }
      	  function saveReceipts(){
      		if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var cnt;
			var a=new FlexUI.Ajax();
			var r=a.callAjax("GET","/tekknow/service/ajax?id=fincheck&ro=false&ic=0&tdate="+screenObjects.getScreenObject("pay_date").getValue());
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
	        var r=null;
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
    		gir.setScreenCode("600056");
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
        	    screenObjects.getScreenObject("amount").setEnabled(false);
            	  screenObjects.getScreenObject("balance").setEnabled(false);
            	  
              	  
        }
         function loadInvNo(){
			  var a=new FlexUI.Ajax();
	 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=salary_pay_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue());
 		  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("pay_no").setValue(r.data[0][0]);	
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
	  		var t=screenObjects.getScreenObject("salarygrid_data");
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
		//	calculateTotal();
			return true;
		}
		function onAmountChange(id,me){
			var t=me.getParent();
			var total=0;
			var tot=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("salarygrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				tot=toNumber(t.getText(i,cols.salary))+toNumber(t.getText(i,cols.advance))+toNumber(t.getText(i,cols.bonus))+toNumber(t.getText(i,cols.incentive)) +toNumber(t.getText(i,cols.beta));
					t.setText(i,cols.total,tot);			 
				total+=toNumber(t.getText(i,cols.salary))+toNumber(t.getText(i,cols.advance))+toNumber(t.getText(i,cols.bonus))+toNumber(t.getText(i,cols.incentive)) +toNumber(t.getText(i,cols.beta));
				
				screenObjects.getScreenObject("amount").setValue(roundOff(total,2));		      	  
				screenObjects.getScreenObject("balance").setValue(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-toNumber(roundOff(screenObjects.getScreenObject("amount").getValue(),2)));
				
			}
			return true;
		}
		function calculateTotal(){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("salarygrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
			total+=toNumber(t.getText(i,cols.total));
			}
			screenObjects.getScreenObject("amount").setValue(roundOff(total,2));
			screenObjects.getScreenObject("balance").setValue(roundOff(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-total,2));
			
	 
			
			//$("#netAmt").html("Net Amount   "+roundOff(total,2));*/
		}

		function getBalance(id,me){
	    	  if(!gir.getSaveInProgress()){
			  var a=new FlexUI.Ajax();
	 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=getbalance&ro=false&ic=0&ledger_code="+screenObjects.getScreenObject("ledger_code").getValue()+"&companycode="+screenObjects.getScreenObject("companycode").getValue()+"&dt="+screenObjects.getScreenObject("pay_date").getValue());
	 		  if(r!=null){
		 			if(r.data){
		 			screenObjects.getScreenObject("balance").setValue(r.data[0][0]);
		 			screenObjects.getScreenObject("act_balance").setValue(r.data[0][0]);
		 			}
			    }	
	    	  }
	    	 return true;
		}		
		function getBalance1(id,me){
	    	  if(!gir.getSaveInProgress()){
			   var t=screenObjects.getScreenObject("salarygrid_data");
		 				var cols=t.getCols();
		 				var s=t.getSize();
		 				for(var i=0;i<s;i++){
		 				if(t.getCurrentRow()==i )
		 				{	 
	 					  var a=new FlexUI.Ajax();
	 					
	 			 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=getbalance&ro=false&ic=0&ledger_code="+t.getText(i,cols.credit_ledger_code)+"&companycode="+screenObjects.getScreenObject("companycode").getValue()+"&dt="+screenObjects.getScreenObject("pay_date").getValue());
	 			 		  
	 					  if(r!=null){
	 				 			if(r.data){
	 				 				 	 				 				
		 					t.setText(i,cols.balance1,r.data[0][0]);
		 				}			 				
		 			}
		 				
			    }	
			  }
	    	  }
	    	 return true;
		}

		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveReceipts();
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
		function editReceipts(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"salary_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600056","code="+args.result[4]);
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600056","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelSizingInv(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"salary_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
		function getSetBeamDetails(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=warpbeamlist&warping_code="+screenObjects.getScreenObject("warping_code").getValue());
				var dg=screenObjects.getScreenObject("salarygrid_data");
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
			calculateTotal();
			  	//
			 // 	return false;
		}
	</script>
</body>
</html>