<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Chemical Consumption</title>
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
			Chemical Consumption
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
					<div class="col-md-6"><input type="text" class="form-control" id="cons_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Consumption No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="cons_no"></div>
				</div>
				</div>
			</div>
			<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Mixing No.</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="mixing_no"></div>
				</div>
	</div>
			
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Remarks</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>	
			</div>
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="chemicalconsgrid" style="height:350px">
			<span>Warping Grid<span/>
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveChemicalCons()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editChemicalCons()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelChemicalCons()">Cancel</div>	
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
  	{name:"cons_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"cons_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girdate"},
  	{name:"issue_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ledger_name"},
  	{name:"mixing_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"total_ends",validation:"OnMixingNoChange",lovOptions:{url:"/tekknow/service/ajax",ajax:"chemicalissue_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"mixing_no",tt:false,id:"mixing_no"},
  	{tgt:"mixing_no",tt:true,id:"mixing_no"},
  	{tgt:"issue_code",tt:false,id:"issue_code"},
  		]}},
 	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},

  	{name:"btn ",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},	
  	{name:"chemicalconsgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"product_code",optional:false,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "product_code", name: "item", field: "product_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	{order:"2",id: "product_name", name: "Item", field: "product_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"chemicalconsgrid_data",tt:false,row:"cr",id:"product_code",col:"product_code"},
  	{tgt:"chemicalconsgrid_data",tt:false,row:"cr",id:"product_name",col:"product_name"},
  	{tgt:"chemicalconsgrid_data",tt:true,row:"cr",id:"product_name",col:"product_name"},
  	{tgt:"chemicalconsgrid_data",tt:false,row:"cr",id:"stk",col:"stk"},
  		]}},
    {order:"3",id: "qty_issued", name: "Qty Issued", field: "qty_issued",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"4",id: "qty_consumed", name: "Qty Consumed", field: "qty_consumed",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    {order:"5",id: "qty_balance", name: "Qty Balance", field: "qty_balance",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    ]
    }}]};
    var gir=new FlexUI.Screen("gir",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
            screenObjects.getScreenObject("chemicalconsgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("chemicalconsgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
            loadMixingNo();
        });
        function saveChemicalCons(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
         	var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		} 
    		gir.setScreenCode("600053");
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
         function OnMixingNoChange(){
			//var t=me.getParent();
	  		if(!gir.getSaveInProgress())
	  		{
	  		var s=new FlexUI.Ajax();		   
			var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=chemicalissuedet&issue_code="+screenObjects.getScreenObject("issue_code").getValue());
			var dg=screenObjects.getScreenObject("chemicalconsgrid_data");
			dg.clear();
			dg.setObjectData(r.data);
			}
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
        	loadMixingNo();
			   }
		  function loadMixingNo(){
	 	  var a=new FlexUI.Ajax();
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=cons_no&ro=false&ic=0","");
 	 	  if(r!=null){
   	 			if(r.data){
   	 				screenObjects.getScreenObject("cons_no").setValue(r.data[0][0]);	
    						}
					    }	
		 	  }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
		function calculateTotal(){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("chemicalconsgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
		 	for(var i=0;i<s;i++){			 
			 	t.setText(i,cols.qty_balance,toNumber(t.getText(i,cols.qty_issued)) - toNumber(t.getText(i,cols.qty_consumed)) );
			}
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveChemicalCons();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadChemicalConsData(url,code,did){
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600053","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		
		function editChemicalCons(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"ChemicalCons_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
				function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600053","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelChemicalCons(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"ChemicalCons_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	</script>
</body>
</html>