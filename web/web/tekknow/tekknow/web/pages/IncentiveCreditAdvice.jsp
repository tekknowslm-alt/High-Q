<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Incentive Credit Advice</title>
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
    		Incentive Credit Advice
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
					<div class="col-md-4"><label>Payment Ref. No</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="advice_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="advice_date"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Bank A/c:</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="bank_ledger_name"><input type="hidden" class="form-control" id="bank_ledger_code"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Customer</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="ledger_name"><input type="hidden" class="form-control" id="ledger_code"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
			<div class="form-group mbotto">
				<div class="col-md-2"><label>Exp. Invoice No. </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="slip_no"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>FOB Value</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="convr"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-18 col-sm-18 mpZero">
				<div class="form-group mbotto">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="col-md-4"><label>Incentive</label></div>
				<div class="col-md-4"><input type="text" class="form-control" id="incentive"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-4"><label>Incentive Recd.</label></div>
				<div class="col-md-4"><input type="text" class="form-control" id="incentive_inr"></div>
				</div>
				</div>
				<div class="form-group mbotto">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="col-md-4"><label>Incentive Diff.</label></div>
				<div class="col-md-4"><input type="text" class="form-control" id="incentive_diff"></div>
			</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Currency</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="curr_name"><input type="hidden" class="form-control" id="curr_code"></div>
				</div>
			</div>			
			
		<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Debit Bank A/c:</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="debit_bank_ledger_name"><input type="hidden" class="form-control" id="debit_bank_ledger_code"></div>
				</div>
			</div>
		
		 </div>
		</div>
		<div class="clearfix"></div>	
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="incentiveadvicegrid" style="height:350px">
			<span>GIR Grid<span/>
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
  	fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
  	{name:"advice_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"girdate"},
  	{name:"advice_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"bank_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"bank_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"bank_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"bank_ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"bank_ledger_code",tt:false,id:"ledger_code"}
    	]}},
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
  		{name:"slip_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"slip_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exp_inv_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"slip_no",tt:false,id:"slip_no"},
  	{tgt:"slip_no",tt:true,id:"slip_no"},
  	{tgt:"slip_code",tt:false,id:"slip_code"}
    	]}},
  		{name:"curr_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"curr_name"},  	
  	{name:"curr_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"curr_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"curr_name",tt:false,id:"curr_name"},
  	{tgt:"curr_name",tt:true,id:"curr_name"},
  	{tgt:"curr_code",tt:false,id:"curr_code"}
    	]}},
 	{name:"convr",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"incentive",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"incentive_inr",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"incentive_diff",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"debit_bank_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"suppliername"},  	
  	{name:"debit_bank_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"debit_bank_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"debit_bank_ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"debit_bank_ledger_code",tt:false,id:"ledger_code"}
    	]}},
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"incentiveadvicegrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "sub_ledger_code", name: "Subledgercode", field: "sub_ledger_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "sub_ledger_name", name: "Sub Ledger", field: "sub_ledger_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"sub_ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"incentiveadvicegrid_data",tt:false,row:"cr",id:"sub_ledger_code",col:"sub_ledger_code"},
  	{tgt:"incentiveadvicegrid_data",tt:false,row:"cr",id:"sub_ledger_name",col:"sub_ledger_name"},
  	{tgt:"incentiveadvicegrid_data",tt:true,row:"cr",id:"sub_ledger_name",col:"sub_ledger_name"}	  	  	  	  	
  	]}},
  	{order:"3",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false},
    ]
    }}]};
	var gir=new FlexUI.Screen("gir",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("incentiveadvicegrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("incentiveadvicegrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveGIR(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    		gir.setOperation("ADD");
    		gir.setScreenCode("600010");
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
				alert(r.message+" [No:"+r.girno+"]");
				clearInnerScreen();
				return r.code;			
			}else{
				gir.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function onGirTypeChange(id,me){
        	//var gt=screenObjects.getScreenObject("girtype").getValue();
        //	screenObjects.getScreenObject("girprefix").setValue("H"+gt);
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
        }
        
        function onRateQuantityChange(id,me){
			//var t=me.getParent();
			//calculateTotal();
			return true;
		}
		function calculateTotal(){
			/*var total=0;
			var t=screenObjects.getScreenObject("incentiveadvicegrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				total+=toNumber(t.getText(i,cols.amount));
			}
			screenObjects.getScreenObject("totalamt").setValue(roundOff(total,2));
			screenObjects.getScreenObject("netamount").setValue(roundOff(total,2));
			$("#netAmt").html("Net Amount   "+roundOff(total,2));*/
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveGIR();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadGIRData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
	</script>
</body>
</html>