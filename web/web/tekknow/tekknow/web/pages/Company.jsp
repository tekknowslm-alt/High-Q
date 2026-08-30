<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Company</title>
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
			Company
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
					<div class="col-md-3"><label>Company Name</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="comp_name"></div>
				</div>
				</div>	
			</div> 
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Address</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="address"></div>					
				</div>
				</div>	
			</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Phone</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="phone"></div>
				</div>
				</div>	
			</div>				
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Mobile</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="mobile"></div>
				</div>
				</div>	
			</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>E-Mail ID</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="email_id"></div>
				</div>
				</div>	
			</div>
			
 			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>GSTIN</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="gstin_no"></div>
				</div>
				</div>	
			</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>PAN</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="pan_no"></div>
				</div>
				</div>	
			<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			</div>
					

			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Bank Name</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="bank_name"></div>
				</div>
				</div>	
			</div>

			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Bank Account No.</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="bank_act_no"></div>
				</div>
				</div>	
			</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>IFSC</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="ifsc"></div>
				</div>
				</div>	
			</div>
			
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Branch</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="branch"></div>
				</div>
				</div>	

		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			</div>
					

			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Stock effect when sales</label></div>
												
					<div class="col-md-9"><select class="form-control" id="reduce_stock"></select></div>
				</div>
				</div>	
			</div>

			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Disable Company</label></div>
					<div class="col-md-9"><select class="form-control" id="disable"></select></div>
				</div>
				</div>	
			</div>
			
			 
			 <div class="col-md-12 col-sm-12 mpZero" id="warpingdetgrid" style="height:70px">
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
    {name:"company",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
	{name:"companycode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
	{name:"comp_name",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"address"},
	{name:"address",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"phone"},
	{name:"phone",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mobile"},
  	{name:"mobile",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"email_id"},
  	{name:"email_id",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"gstin_no"},
  	{name:"gstin_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"pan_no"},
  	{name:"pan_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"bank_name"},
  	{name:"bank_name",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"bank_act_no"},
  	{name:"bank_act_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"ifsc"},
  	{name:"ifsc",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"branch"},
  	{name:"branch",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"address"},
    {name:"reduce_stock",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"Y","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"suppliername",values:"Y~N",keys:"Reduce Stk~Don't Reduce Stk"},
    {name:"disable",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"suppliername",values:"Y~N",keys:"Yes~No"},
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
    var cmps=new FlexUI.Screen("warping",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            //screenObjects.getScreenObject("warpingdetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            //screenObjects.getScreenObject("warpingdetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
            			screenObjects.getScreenObject("companycode").setValue($('#company').val());
	      


      //loadSetNo();
        });
        function saveWarping(){
        	if('<%=mode%>'=="View") return;
        	if(cmps.getSaveInProgress()) return;
        	var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
    		if(code=="" || code=="0"){ 
    			cmps.setOperation("ADD");
        	}
        	else
        		{
        		var txt;
				if(cmps.getOperation()=="MOD")
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


    		cmps.setScreenCode("600081");
    		var d=cmps.processDataToSave();
    		cmps.setSaveInProgress(true);    		
			if("FAILED"!=d){
				var s=new FlexUI.Ajax();
				showLoader();
				r=s.callAjax("POST","/tekknow/service/screen/save",d);
				hideLoader();
		 	}else{
		 		alert("Please correct the validation errors and continue...");
		 		cmps.setSaveInProgress(false);		 		
		 		return;
		 	}		 
		 	if(r.result=="Success"){
				alert(r.message+" [No:"+r.code+"]");
				clearInnerScreen();
				return r.code;			
			}else{
				cmps.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function onGirTypeChange(id,me){
        	//var gt=screenObjects.getScreenObject("girtype").getValue();
        	//screenObjects.getScreenObject("girprefix").setValue("H"+gt);
        	return true;
        }
        function clearInnerScreen(){
        	cmps.clearScreen();
        	cmps.setSaveInProgress(false);
        	onGirTypeChange();
        	if("<%=mode%>"=="View"){
        		$('.ui-dialog').children().remove();
				$('.ui-dialog').remove();
				$("#bodyContainer").children().remove();
				$("#bodyContainer").html("");
				$("#bodyContainer").load("/tekknow/billPrintRequest.do?id=11&title=Bills");
        	}
        	      screenObjects.getScreenObject("companycode").setValue($('#company').val());
        	   	 //    loadSetNo();
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
			if(!cmps.getSaveInProgress()){
			  screenObjects.getScreenObject("count_name").setValue("");
			  screenObjects.getScreenObject("count_name").setTag("");
		      screenObjects.getScreenObject("mill_name").setValue("");
			  screenObjects.getScreenObject("mill_name").setTag("");
			 }
			  return true;
	 	}
		function ClearColumnsLedgerCode(id,me){
		if(!cmps.getSaveInProgress()){
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
			cmps.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
			function onEditClose(e,args)
		{
				var a=new FlexUI.Ajax();
				showLoader();
				var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600081","code="+args.result[1]);
				clearInnerScreen();
				clearInterval();
				cmps.setOperation("MOD");
				cmps.loadObjectData(r);
				hideLoader();
			
		}
		function editWarping(id,me){
			cmps.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"company_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onCancelClose(e,args)
		{
			//screenObjects.getScreenObject(cmps.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600081","code="+args.result[1]);			
			clearInnerScreen();
			cmps.setOperation("CAN");
			cmps.loadObjectData(r);
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
			cmps.setOperation("CAN");	
				var l={url:"/tekknow/service/ajax",ajax:"company",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
		var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	
	</script>
</body>
</html>