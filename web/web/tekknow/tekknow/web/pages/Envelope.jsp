<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Envelope</title>
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
			Envelope
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
			<div class="clearfix"></div>
	</div>
			
	 	<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Party</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address Type</label></div>
					<div class="col-md-9"><select class="form-control" id="address_type"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="isgir"></div>
					</div>
				</div>				
		<div class="clearfix"></div>
		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="address1"></div>
				</div>
				</div>	
			</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label></label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="address2"></div>
				</div>
				</div>	
			</div>
				<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label></label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="address3"></div>
				</div>
				</div>	
			</div>
		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label></label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="address4"></div>
				</div>
				</div>	
			</div>
	<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Ph. No.</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="ph_no"></div>
				</div>
				</div>	
			</div>
	 	<div class="clearfix"></div>
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl printbN" onClick="prntEnvelope()">Print</div>


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
 	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ordered_by"},  	
 	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"ordered_by",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_both",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"address1",tt:false,id:"s_addr1"},
  	{tgt:"address2",tt:false,id:"s_addr2"},
  	{tgt:"address3",tt:false,id:"s_addr3"},
  	{tgt:"address4",tt:false,id:"s_place"},
  	{tgt:"ph_no",tt:false,id:"s_ph_no"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}}, 	
    {name:"address_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"S","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername",values:"S~B",keys:"Shipping Address~Billing Address",onchange:"onAddressTypeChange"},
    	  	
    {name:"address1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"address4",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#f2f2f2"},
    {name:"ph_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
         
  	
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
    var gir=new FlexUI.Screen("envelope",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            //screenObjects.getScreenObject("warpingdetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            //screenObjects.getScreenObject("warpingdetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
            
			screenObjects.getScreenObject("address1").setEnabled(false);
			screenObjects.getScreenObject("address2").setEnabled(false);
			screenObjects.getScreenObject("address3").setEnabled(false);
			screenObjects.getScreenObject("address4").setEnabled(false);
			clearInnerScreen();
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


    		gir.setScreenCode("600012");
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
        	screenObjects.getScreenObject("address1").setEnabled(false);
			screenObjects.getScreenObject("address2").setEnabled(false);
			screenObjects.getScreenObject("address3").setEnabled(false);
			screenObjects.getScreenObject("address4").setEnabled(false);
			
        	onGirTypeChange();
        	if("<%=mode%>"=="View"){
        		$('.ui-dialog').children().remove();
				$('.ui-dialog').remove();
				$("#bodyContainer").children().remove();
				$("#bodyContainer").html("");
				$("#bodyContainer").load("/tekknow/billPrintRequest.do?id=11&title=Bills");
        	}
        	  
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
		function onAddressTypeChange(){
		 
			var a=new FlexUI.Ajax();
		
			if(screenObjects.getScreenObject("address_type").getValue()=="S")
				{
				var r=a.callAjax("GET","/tekknow/service/ajax?id=shipping_address&ro=false&ic=0&ledgercode="+screenObjects.getScreenObject("ledger_code").getValue());
				}
			else
				{var r=a.callAjax("GET","/tekknow/service/ajax?id=billing_address&ro=false&ic=0&ledgercode="+screenObjects.getScreenObject("ledger_code").getValue());}
			  
 		  if(r!=null){
 			  
   	 			if(r.data){
	   	 			screenObjects.getScreenObject("address1").setValue(r.data[0][0]);	
    				screenObjects.getScreenObject("address2").setValue(r.data[0][1]);
    				screenObjects.getScreenObject("address3").setValue(r.data[0][2]);
    				screenObjects.getScreenObject("address4").setValue(r.data[0][3]);
    				screenObjects.getScreenObject("ph_no").setValue(r.data[0][4]);
    				
    						}
			}	
	        return true;
	}
	   	  function prntEnvelope(invno){
	      	  	window.open("/tekknow/service/invoice/envelope?ledgercode="+screenObjects.getScreenObject("ledger_code").getValue()+"&addresstype="+screenObjects.getScreenObject("address_type").getValue(),"_blank");
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600012","code="+args.result[6]);
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600012","code="+args.result[6]);
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