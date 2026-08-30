<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Advance</title>
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
			Advance
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
					<div class="col-md-3"><label>Advance Ref No.</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="advance_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Date</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="advance_date"></div>
				</div>
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
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Party A/c</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="party_ledger_name"></div>
				</div>
				</div>	
					<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Branch</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="branch" disabled></div>
				</div>
				</div>
			</div>
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
					<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Amount</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="amount"></div>
				</div>
				</div>	<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Balance</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="balance1" disabled></div>
				</div>
				</div>	
			
			</div>
			
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				
					<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Cheque No.</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="cheque_no"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Cheque Date</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="cheque_date"></div>
				</div>
				</div>					 
			</div>
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Advance Type</label></div>
					<div class="col-md-9"><select class="form-control" id="advance_type"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="isgir"></div>
					</div>
				</div>	
				 
					<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Narration</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="narration"></div>
				</div>
				</div>
			 
				<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			 <div class="col-md-12 col-sm-12 mpZero" id="warpingdetgrid" style="height:350px">
			<span><span/>
				
		
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveWarping()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editWarping()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelWarping()">Delete</div>	</span>
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
  	  {name:"companycode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
   {name:"advance_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"ledger_name",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"advance_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"ledger_name",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	 {name:"advance_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"T","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername",values:"I~R",keys:"Issue~Receipt"},
   	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"credt_ledger_code"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",validation:"",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_cash",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"companycode",ft:false,src:"companycode"}],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},  	
  	{tgt:"ledger_code",tt:false,id:"ledger_code"},  	

	]},validation:"getBalance"},
	
  	{name:"party_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"order_no"},  	
 	{name:"party_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"order_no",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_both",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"party_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"party_ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"branch",tt:false,id:"branch"},
  	{tgt:"branch",tt:true,id:"branch"},
  	{tgt:"party_ledger_code",tt:false,id:"ledger_code"}
    	]},validation:"getBalance1"},
    	
    	{name:"branch",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"count_name",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#c2c2d6"},
    	{name:"balance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,align:"right","readOnly":true,"chkTag":false,nf:"count_name",font:{weight:"700",size:"17px",style:"bold",color:"#424242"},background:"#c2c2d6"},
    	{name:"balance1",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,align:"right","readOnly":true,"chkTag":false,nf:"count_name",font:{weight:"800",size:"20px",style:"bold",color:"#ffcc66"},background:"#666699"},
         
  	{name:"amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"count_name",font:{weight:"600",size:"15px",style:"bold",color:"#424242"},background:"#ffffff"},
     {name:"cheque_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"cheque_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"narration",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
     
  	]}]};
  	/*
  	,
  	{name:"warpingdetgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"ends",optional:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true}
    ]
    }}
    */
    var gir=new FlexUI.Screen("warping",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            //screenObjects.getScreenObject("warpingdetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            //screenObjects.getScreenObject("warpingdetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
            			screenObjects.getScreenObject("companycode").setValue($('#company').val());
	      	  screenObjects.getScreenObject("balance").setEnabled(false);
	      	  screenObjects.getScreenObject("balance1").setEnabled(false);
	      	  screenObjects.getScreenObject("branch").setEnabled(false);



      loadSetNo();
        });
        function saveWarping(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
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


    		gir.setScreenCode("600052");
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
				alert(r.message+" [No:"+r.code+"]");
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
        	      screenObjects.getScreenObject("companycode").setValue($('#company').val());
        	   	  screenObjects.getScreenObject("balance").setEnabled(false);
    	      	  screenObjects.getScreenObject("balance1").setEnabled(false);
    	      	  screenObjects.getScreenObject("branch").setEnabled(false);
    loadSetNo();
        }
          function loadSetNo(){
			  var a=new FlexUI.Ajax();
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=advance_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue(),"");
 	 	  if(r!=null){
   	 			if(r.data){
   	 				screenObjects.getScreenObject("advance_no").setValue(r.data[0][0]);	
    						}
					    }	
			  }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			//calculateTotal();
			return true;
		}
		function ClearColumnsOrderCode(id,me){
			if(!gir.getSaveInProgress()){
			  screenObjects.getScreenObject("count_name").setValue("");
			  screenObjects.getScreenObject("count_name").setTag("");
		      screenObjects.getScreenObject("mill_name").setValue("");
			  screenObjects.getScreenObject("mill_name").setTag("");
			 }
			  return true;
	 	}
		function ClearColumnsLedgerCode(id,me){
		if(!gir.getSaveInProgress()){
		 	 screenObjects.getScreenObject("order_no").setValue("");
			screenObjects.getScreenObject("order_no").setTag("");
			screenObjects.getScreenObject("count_name").setValue("");
			screenObjects.getScreenObject("count_name").setTag("");
		    screenObjects.getScreenObject("count_code").setValue(0);
			screenObjects.getScreenObject("count_code").setTag("");
			screenObjects.getScreenObject("mill_name").setValue("");
			screenObjects.getScreenObject("mill_name").setTag("");
			screenObjects.getScreenObject("mill_code").setValue(0);
			screenObjects.getScreenObject("mill_code").setTag("");	
		}
	 	return true;
	 	}
		function calculateTotal(){
		 	var total=0;
		 	var total_cones=0;
		 	var t=screenObjects.getScreenObject("warpingdetgrid_data");
		 	var cols=t.getCols();
		 	var s=t.getSize();
		//	var net_amount=0;
			 for(var i=0;i<s;i++){
				t.setText(i,cols.net_weight,toNumber(t.getText(i,cols.gross_weight))- toNumber(t.getText(i,cols.tare_weight)));
			}
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveWarping();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadWarpingData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600052","code="+args.result[6]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function editWarping(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"advance_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600052","code="+args.result[6]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
			function getBalance(id,me){	     
				  var a=new FlexUI.Ajax();
		 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=getbalance&ro=false&ic=0&ledger_code="+screenObjects.getScreenObject("ledger_code").getValue()+"&companycode="+screenObjects.getScreenObject("companycode").getValue()+"&dt="+screenObjects.getScreenObject("advance_date").getValue());
				  if(r!=null){
			 			if(r.data){
			 			screenObjects.getScreenObject("balance").setValue(r.data[0][0]);
			 			}
				    }	
		    	 return true;
			}		
			function getBalance1(id,me){	     
				  var a=new FlexUI.Ajax();
		 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=getbalance&ro=false&ic=0&ledger_code="+screenObjects.getScreenObject("party_ledger_code").getValue()+"&companycode="+screenObjects.getScreenObject("companycode").getValue()+"&dt="+screenObjects.getScreenObject("advance_date").getValue());
				  if(r!=null){
			 			if(r.data){
			 			screenObjects.getScreenObject("balance1").setValue(r.data[0][0]);
			 			}
				    }	
		    	 return true;
			}
			 
		function cancelWarping(id,me){
			gir.setOperation("CAN");	
				var l={url:"/tekknow/service/ajax",ajax:"advance_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
		var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	
	</script>
</body>
</html>