<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Purchase Order</title>
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
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">Purchase Order</div>
	</div>
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
			<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
				<div class="col-md-12 col-sm-12 mpZero">
					<div class="clearfix"></div>
					<div class="col-md-12 col-sm-12 mpZero">
						<div class="col-md-6 col-sm-6 mpZero">
							<div class="form-group mbotto">
								<div class="col-md-4">
									<label>Date</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="order_date">
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 mpZero">
							<div class="form-group mbotto">
								<div class="col-md-4">
									<label>No.</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="order_no">
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-sm-12 mpZero">
						<div class="col-md-6 col-sm-6 mpZero">
							<div class="form-group mbotto">
								<div class="col-md-4">
									<label>Party</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="ledger_name">
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 mpZero">
							<div class="form-group mbotto">
								<div class="col-md-4">
									<label>Branch</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="branch">
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>

				<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
					<div class="col-md-12 col-sm-12 mpZero" id="purcordergrid"
						style="height: 350px">
						<span>Warping Grid<span /> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br> </br>
					</div>
				</div>
				
			</div>
			<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-2 col-md-2 col-lg-2 adCl"
						onclick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN"
						onclick="saveRewindingIssue()">Save</div>
				<div class="col-sm-2 col-md-2 col-lg-2 adCl printbN" onClick="Printpurcorder()">Print</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl"
						onclick="editRewindingIssue()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl"
						onclick="cancelRewindingIssue()">Delete</div>
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
	{name:"order_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"order_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ordered_by"},  	
 	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"ordered_by",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_both",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"branch",tt:false,id:"branch"},
  	{tgt:"branch",tt:true,id:"branch"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    ]},validation:""}, 	
    {name:"branch",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
	  
	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"purcordergrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"product_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "product_code", name: "product_code", field: "product_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
    {order:"2",id: "prod_code", name: "Code", field: "prod_code",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
    	{tgt:"purcordergrid_data",tt:false,row:"cr",id:"product_code",col:"product_code"},
     	{tgt:"purcordergrid_data",tt:false,row:"cr",id:"prod_code",col:"prod_code"},
    	{tgt:"purcordergrid_data",tt:true,row:"cr",id:"prod_code",col:"prod_code"},
    	{tgt:"purcordergrid_data",tt:false,row:"cr",id:"product_name",col:"product_name"},
    	{tgt:"purcordergrid_data",tt:true,row:"cr",id:"product_name",col:"product_name"},	
    	{tgt:"purcordergrid_data",tt:false,row:"cr",id:"unit_code",col:"unit_code"},
    	{tgt:"purcordergrid_data",tt:true,row:"cr",id:"unit_code",col:"unit_code"},	
    	{tgt:"purcordergrid_data",tt:false,row:"cr",id:"unit_name",col:"unit_name"},
    	{tgt:"purcordergrid_data",tt:true,row:"cr",id:"unit_name",col:"unit_name"},	
    	]}},
	{order:"3",id: "product_name", name: "Product Name", field: "product_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:300,align:"left","chkTag":false,onchange:"onRateQuantityChange"},
	{order:"4",id: "unit_code", name: "UnitCode", field: "unit_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
    {order:"5",id: "unit_name", name: "Unit", field: "unit_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:50,align:"center","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"6",id: "qty", name: "Qty", field: "qty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:75,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"7",id: "mtrs", name: "Mtrs", field: "mtrs",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"8",id: "qty_balance", name: "Pending Qty", field: "qty_balance",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:75,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"9",id: "mtrs_balance", name: "Pending Mtrs", field: "mtrs_balance",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"10",id: "order_det_code", name: "OrderDetCode", field: "order_det_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":15,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,"chkTag":false,width:0,sno:true},
    ]
    }}]};
    var gir=new FlexUI.Screen("warpbreaks",sProps);
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("purcordergrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("purcordergrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
      loadInwardNo();
    
      
        });
    function prntpurcorder(invno){
  	  	window.open("/tekknow/service/invoice/purcorderprint?invoiceno="+invno,"_blank");
  	  }
	function Printpurcorder(){
		saveRewindingIssue("purcorder");     	  
		}

        function saveRewindingIssue(print){
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
			gir.setScreenCode("600072");
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
				  var xy=a.callAjax("GET","/tekknow/service/ajax?id=purc_order_code_list&ro=false&ic=0");
			 	  if(xy!=null){
 	 			if(xy.data){
  				code=xy.data[0][0];	
  						}
					    }	
				}
		 		
				alert(r.message+" [No:"+r.code+"]");
				if(print=="purcorder"){
					prntpurcorder(code);
				}
				clearInnerScreen();
				return r.code;			
			}else{
				gir.setSaveInProgress(false);
				alert(r.message);		
			}
        }
                 function loadInwardNo()
                 {
					  var a=new FlexUI.Ajax();
					  var r=a.callAjax("GET","/tekknow/service/ajax?id=purc_order_no&ro=false&ic=0");
 	 				 if(r!=null){
   	 						if(r.data){
   	 							screenObjects.getScreenObject("order_no").setValue(r.data[0][0]);	
    									}
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
//        	screenObjects.getScreenObject("order_date").focus();
	        loadInwardNo();
        }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
        function onProductCodeChange(id,me){
        	    var a=new FlexUI.Ajax();
           		var productcode;
             	var t=screenObjects.getScreenObject("purcordergrid_data");
				var cols=t.getCols();
				var s=t.getSize();
				var net_amount=0;
				for(var i=0;i<s;i++){
			 	if(t.getCurrentRow()==i )
			  {
			  productcode=t.getText(i,cols.product_code);
		 	 var r=a.callAjax("GET","/tekknow/service/ajax?id=purc_rate_list_b&ro=false&ic=0&productcode="+productcode+"&ledger="+screenObjects.getScreenObject("ledger_code").getValue());
		 
			if(r!=null){  
				if(r.data){		
					if(r.data[0][0]>0){
 					t.setText(i,cols.rate,r.data[0][0]);} 
				}
			}
			}
			} 
			return true;
		}
        
        function getOrderPending(id,me){
	    	  if(!gir.getSaveInProgress()){
				   var t=screenObjects.getScreenObject("purcordergrid_data");
			 				var cols=t.getCols();
			 				var s=t.getSize();
			 				for(var i=0;i<s;i++){
			 				if(t.getCurrentRow()==i )
			 				{	 
		 					  var a=new FlexUI.Ajax();
		 					
		 			 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=getorderpending&ro=false&ic=0&product="+t.getText(i,cols.product_code)+"&ledger="+screenObjects.getScreenObject("ledger_code").getValue());
		 			 		  
		 					  if(r!=null){
		 				 			if(r.data){
		 				 					t.setText(i,cols.qty_balance,r.data[0][0]);
		 				 					t.setText(i,cols.mtrs_balance,r.data[0][1]);
		 				 				
			 				}			 				
			 			}
			 				
				    }	
				  }
		    	  }
	    	 return true;
		}		

		function calculateTotal(){
			var total=0,amt=0,rate=0,amount=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("purcordergrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
				//total_cones=toNumber(t.getText(i,cols.bags))* toNumber(t.getText(i,cols.cones_bag));
				//t.setText(i, cols.cones,total_cones);
			qty=toNumber(t.getText(i,cols.qty));
			mtrs=toNumber(t.getText(i,cols.mtrs));
			rate=toNumber(t.getText(i,cols.rate));
			if(t.getText(i,cols.unit_code)=="1")
				{
				amount=qty*rate;
				}
			else
				{
				amount=mtrs*rate;
				}
		    	t.setText(i,cols.amount,amount);
			}
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveRewindingIssue();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadRewindingIssue(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			calculateTotal();
			hideLoader();
		}
		function onEditClose(e,args)
		{	
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600072","code="+args.result[4]);
			clearInnerScreen();
			clearInterval();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			hideLoader();
			calculateTotal();
		}
		function editRewindingIssue(id,me){
			gir.setOperation("MOD");
			var l={url:"/tekknow/service/ajax",ajax:"purc_order_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
			}
		function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600072","code="+args.result[4]);
			clearInnerScreen();
			clearInterval();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			hideLoader();
			calculateTotal();
		}
		function cancelRewindingIssue(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"purc_order_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	</script>
</body>
</html>