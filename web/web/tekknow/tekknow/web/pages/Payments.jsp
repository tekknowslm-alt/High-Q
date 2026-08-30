<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Payments</title>
</head>
<%@page import="com.core.servlet.InitProjectServlet"%>
<%
   String mode=request.getParameter("mode");
   String code=request.getParameter("code");
   String userId=(String)session.getAttribute("LOGIN_ID");
   String screenCode=request.getParameter("screencode");
%>
<body>
	<input type="hidden" id="prevreportid" value=""/>
    <div class="col-sm-12 col-md-12 col-lg-12 mpZero  marTp" id="heading">
    	<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			Payments
			<span class="pull-right"><button class="btn btn-sm" onclick="backToMainReport();" id="repback" style="display:none"><i class="fa fa-arrow-up"></i></span></div>
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
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="pay_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Voucher No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="pay_no"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cash / Bank / Adjustment</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>			
			<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cash / Bank Balance</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="balance" disabled></div>
				</div>
				</div>			
			</div>		
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Vendor Name</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="party_name"></div>
				</div>
				</div>			
			<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Vendor Balance</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="party_balance" disabled></div>
				</div>
				</div>			
			</div>				
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cheque / DD / NEFT / RTGS No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="cheque_no"></div>
				</div>
				</div>			
			<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Branch</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="branch" disabled></div>
				</div>
				</div>			
			</div>		
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-18 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Narration</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="narration"></div>
				</div>
				</div>			
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="amount" disabled></div>
				</div>
				</div>			
			</div>	
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-18 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Expenses A/c</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="exp_ledger_name"></div>
				</div>
				</div>			
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Exp.Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="exp_amount"</div>
				</div>
				</div>			
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-18 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Expenses A/c</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="exp2_ledger_name"></div>
				</div>
				</div>			
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Exp.Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="exp2_amount"</div>
				</div>
				</div>			
			</div>					
			 <div class="clearfix"></div>
			 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="paymentsgrid" style="height:300px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="PrintReceipt()">Print</div>	
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
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",validation:"",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_rc_py",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"companycode",ft:false,src:"companycode"}],results:[
  	 {tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"},
   
	]},validation:"getBalance"},
	{name:"balance",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,align:"right","visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"700",size:"17px",style:"bold",color:"#424242"},background:"#cce6ff"},
	{name:"act_balance",inputType:0,type:"DECI",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
	{name:"party_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"credt_ledger_code"},  	
  	{name:"party_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",font:{weight:"800",size:"16px",style:"italic",color:"#424242"},background:"#ffffff",validation:"getPendingBills",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_both",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"party_name",tt:false,id:"ledger_name"},
  	{tgt:"party_name",tt:true,id:"ledger_name"},
   	{tgt:"branch",tt:false,id:"branch"},
  	{tgt:"branch",tt:true,id:"branch"},
  	{tgt:"party_code",tt:false,id:"ledger_code"}
	]},validation:"getsetPendingBills"},
	{name:"branch",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"15px",style:"italic",color:"#424242"},background:"#cce6ff"},
	{name:"cheque_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
	{name:"party_balance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,align:"right","visible":true,"readOnly":true,"chkTag":false,nf:"mode",font:{weight:"700",size:"17px",style:"bold",color:"#424242"},background:"#cce6ff"},
	{name:"party_act_balance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
	{name:"narration",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
 	{name:"amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,align:"right","visible":true,"readOnly":false,"chkTag":false,nf:"mode",font:{weight:"800",size:"20px",style:"bold",color:"#ffcc66"},background:"#0077e6"},
	{name:"exp_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"credt_ledger_code"},  	
	{name:"exp_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_ie",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"exp_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"exp_ledger_name",tt:true,id:"ledger_name"},
    {tgt:"exp_ledger_code",tt:false,id:"ledger_code"}
	]},},
	{name:"exp_amount",inputType:0,type:"NEGDEC",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,align:"right","chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"bold",color:"#424242"},background:"#ffffff",onchange:"onAmountChange"},
  	{name:"exp2_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"credt_ledger_code"},  	
	{name:"exp2_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_list_ie",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"exp2_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"exp2_ledger_name",tt:true,id:"ledger_name"},
    {tgt:"exp2_ledger_code",tt:false,id:"ledger_code"}
	]},},
	{name:"exp2_amount",inputType:0,type:"NEGDEC",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,align:"right","chkTag":false,nf:"mode",font:{weight:"600",size:"14px",style:"bold",color:"#424242"},background:"#ffffff",onchange:"onAmountChange"},
	
	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
	]},
	{name:"paymentsgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"bill_date",optional:false,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "bill_date", name: "Bill Date", field: "bill_date",defaultValue:"0","inputType":0,"type":"DATE","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,"chkTag":false},    
  	{order:"2",id: "bill_no", name: "Bill No.", field: "bill_no",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,"chkTag":false},    
  	{order:"3",id: "tran_type", name: "Type", field: "tran_type",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},    
  	{order:"4",id: "tran_type_name", name: "Type", field: "tran_type_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,"chkTag":false},    
  	{order:"5",id: "sales_amount", name: "Purchase Value", field: "sales_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"6",id: "cgst_amount", name: "CGST", field: "cgst_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"7",id: "sgst_amount", name: "SGST", field: "sgst_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"8",id: "igst_amount", name: "IGST", field: "igst_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"9",id: "net_amount", name: "Net Value", field: "net_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"10",id: "already_paid_amount", name: "Al. Paid", field: "already_paid_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"11",id: "balance", name: "Balance", field: "balance",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:""},
  	{order:"12",id: "is_paid", name: "Tick", field: "is_paid",defaultValue:"0","inputType":2,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"center","chkTag":false,cTotal:true,onclick:"onIsPaidChange"},
  	{order:"13",id: "discount", name: "Adjustment", field: "discount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0,align:"right","chkTag":false,cTotal:true,onchange:"calculateTotal"},
  	{order:"14",id: "paid_amount", name: "Paid", field: "paid_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:70,align:"right","chkTag":false,cTotal:true,onchange:"onAmountChange"},
  	]
	}}]};
	<%@ include file = "drilldown.jsp" %>
	var gir=new FlexUI.Screen("warpbreaks",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
			screenObjects.getScreenObject("companycode").setValue($('#company').val());
            screenObjects.getScreenObject("paymentsgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("paymentsgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            screenObjects.getScreenObject("paymentsgrid_data").onCellClicked.subscribe(onIsPaidChange);
            var grid=screenObjects.getScreenObject("paymentsgrid_data").onBeforeDeleteRow.subscribe(onRowDelete);
            	screenObjects.getScreenObject("amount").setEnabled(false);
            	screenObjects.getScreenObject("branch").setEnabled(false);
            	screenObjects.getScreenObject("balance").setEnabled(false);
        		screenObjects.getScreenObject("party_balance").setEnabled(false);
        		
            //screenObjects.getScreenObject("girtype").focus();
      	loadInvNo();
  	 	if("<%=code%>"!="" && "<%=code%>"!="null"){
       		debugger
			onEditClose(undefined,undefined,<%=code%>)
		}	       

      	  });
      	  function prntInvoice(invno){
      	  	window.open("/tekknow/service/invoice/invoiceprint?invoiceno="+invno,"_blank");
      	  }
        function saveReceipts(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
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
    		gir.setScreenCode("600043");
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
        		screenObjects.getScreenObject("amount").setEnabled(false);
        		screenObjects.getScreenObject("branch").setEnabled(false);
        		screenObjects.getScreenObject("balance").setEnabled(false);
        		screenObjects.getScreenObject("party_balance").setEnabled(false);
        		
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
	 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=pay_no&ro=false&ic=0&companycode="+screenObjects.getScreenObject("companycode").getValue());
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
	  		var t=screenObjects.getScreenObject("paymentsgrid_data");
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
		function getPendingBills(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=pay_pending&ledger_code="+screenObjects.getScreenObject("party_code").getValue()+"&companycode="+screenObjects.getScreenObject("companycode").getValue());
				var dg=screenObjects.getScreenObject("paymentsgrid");
				dg.clear();
				dg.setObjectData(r.data);		
				}	 
			return true;
		}
		function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
	 
		function onAmountChange(id,me){
			var t=me.getParent();
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("paymentsgrid_data");
			var cols=t.getCols();
			var s=t.getSize();

			for(var i=0;i<s;i++){		
				total+=toNumber(t.getText(i,cols.paid_amount));

		    }
			screenObjects.getScreenObject("amount").setValue(roundOff(total+toNumber(screenObjects.getScreenObject("exp_amount").getValue())+toNumber(screenObjects.getScreenObject("exp2_amount").getValue()),2));
			screenObjects.getScreenObject("balance").setValue(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-toNumber(roundOff(screenObjects.getScreenObject("amount").getValue(),2)));
			
			//			screenObjects.getScreenObject("balance").setValue(roundOff(screenObjects.getScreenObject("act_balance").getValue()+total,2));
			screenObjects.getScreenObject("party_balance").setValue(roundOff(toNumber(screenObjects.getScreenObject("party_act_balance").getValue())-total,2));
				
	        return true; 
		}
		function onIsPaidChange(e,args){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("paymentsgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			console.log(" row "+args.row);
			//alert(row);
			for(var i=0;i<s;i++){		 
			if(t.getCurrentRow()==i )
			{					 

				if(t.getText(i,cols.is_paid)=="true")
				 {
				
					 t.setText(i,cols.paid_amount,roundOff(toNumber(t.getText(i,cols.balance)) - toNumber(t.getText(i,cols.discount)),2) ); 		 
				}
				else
				{
					 t.setText(i,cols.paid_amount,0); 		 
				
				}				 
			}				
			total+=toNumber(t.getText(i,cols.paid_amount));
			screenObjects.getScreenObject("amount").setValue(roundOff(total+toNumber(screenObjects.getScreenObject("exp_amount").getValue())+toNumber(screenObjects.getScreenObject("exp2_amount").getValue()),2));
    }
			screenObjects.getScreenObject("balance").setValue(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-toNumber(roundOff(screenObjects.getScreenObject("amount").getValue(),2)));
			screenObjects.getScreenObject("party_balance").setValue(roundOff(toNumber(screenObjects.getScreenObject("party_act_balance").getValue())+total,2));
						return true;
		}

		function calculateTotal(){
	 	var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("paymentsgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
			if(t.getCurrentRow()==i )
			{	
			if(toNumber(t.getText(i,cols.discount))>0 || toNumber(t.getText(i,cols.balance))>0)
			{
				 t.setText(i,cols.paid_amount,toNumber(t.getText(i,cols.balance)) - toNumber(t.getText(i,cols.discount)) );			 
			}
			}				
			total+=toNumber(t.getText(i,cols.paid_amount));
			screenObjects.getScreenObject("amount").setValue(roundOff(total+toNumber(screenObjects.getScreenObject("exp_amount").getValue())+toNumber(screenObjects.getScreenObject("exp2_amount").getValue()),2));
    }
			screenObjects.getScreenObject("balance").setValue(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-toNumber(roundOff(screenObjects.getScreenObject("amount").getValue(),2)));
			
			screenObjects.getScreenObject("party_balance").setValue(roundOff(toNumber(screenObjects.getScreenObject("party_act_balance").getValue())+total,2));
					
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
			var l={url:"/tekknow/service/ajax",ajax:"pay_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
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
					rcode=args.result[6];
				}
				
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600043","code="+rcode);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			hideLoader();
			getBalance();			
			getPartyBalance();
			screenObjects.getScreenObject("balance").setValue(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-toNumber(roundOff(screenObjects.getScreenObject("amount").getValue(),2)));
			screenObjects.getScreenObject("party_balance").setValue(roundOff(toNumber(screenObjects.getScreenObject("party_act_balance").getValue()),2));
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600043","code="+args.result[6]);
				clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
			getBalance();
			getPartyBalance();
			screenObjects.getScreenObject("balance").setValue(toNumber(roundOff(screenObjects.getScreenObject("act_balance").getValue(),2))-toNumber(roundOff(screenObjects.getScreenObject("amount").getValue(),2)));
			screenObjects.getScreenObject("party_balance").setValue(roundOff(toNumber(screenObjects.getScreenObject("party_act_balance").getValue()),2));
		}
		function cancelSizingInv(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"pay_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[{n:"companycode",ft:false,src:"companycode"}],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
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
		 		}}
	    	 return true;
		  }
		   function getPartyBalance(){	  
		    	  if(!gir.getSaveInProgress()){
		    	  var a=new FlexUI.Ajax();
		 		  var r=a.callAjax("GET","/tekknow/service/ajax?id=getbalance&ro=false&ic=0&ledger_code="+screenObjects.getScreenObject("party_code").getValue()+"&companycode="+screenObjects.getScreenObject("companycode").getValue()+"&dt="+screenObjects.getScreenObject("pay_date").getValue());
				  if(r!=null){
			 			if(r.data){
			 			screenObjects.getScreenObject("party_balance").setValue(r.data[0][0]);
			 			screenObjects.getScreenObject("party_act_balance").setValue(r.data[0][0]);
			 			}
					}	
				  }
				  return true;
				}
	 function getsetPendingBills(id,me){
			getPartyBalance();
			if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=pay_pending&ledger_code="+screenObjects.getScreenObject("party_code").getValue()+"&companycode="+screenObjects.getScreenObject("companycode").getValue()+"&billdt="+screenObjects.getScreenObject("pay_date").getValue());
				var dg=screenObjects.getScreenObject("paymentsgrid_data");
				dg.clear();
				dg.setObjectData(r.data);
			
			}
			return true;
		}	 
		function onRowDelete(e,args){
			  	var grid=screenObjects.getScreenObject("paymentsgrid_data");
			  	//
			 // 	return false;
		}
	</script>
</body>
</html>