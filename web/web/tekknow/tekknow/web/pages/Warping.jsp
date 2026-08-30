<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Warping Issue</title>
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
			Warping
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
					<div class="col-md-6"><input type="text" class="form-control" id="warping_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Party</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>
			</div>
			<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Order No.</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="order_no"></div>
				</div>
	</div>
			
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Set No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="set_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Count</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="count_name"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Color</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="color_name"></div>
				</div>
				</div>
				
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Mill</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="mill_name"></div>
				</div>
				</div>	
					<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cone Type</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="cone_type"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cone Weight</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="cone_weight"></div>
				</div>
				</div>	
			</div>
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				
					<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Stock in Kgs.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="stock_kgs"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Issued Kgs.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="issued_kgs"></div>
				</div>
				</div>	
				<div  class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Remarks</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>	
			</div>
				<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			 <div class="col-md-12 col-sm-12 mpZero" id="warpingdetgrid" style="height:350px">
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
			<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveWarping()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editWarping()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelWarping()">Cancel</div>	</span>
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
  	{name:"warping_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"ledger_name"},
  	
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"order_no"},  	
 	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"order_no",validation:"ClearColumnsLedgerCode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
    
    {name:"order_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"set_no"},
  	{name:"order_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"set_no",lovOptions:{url:"/tekknow/service/ajax",ajax:"sizingsetorderlistr",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"order_no",tt:false,id:"order_no"},
  	{tgt:"order_no",tt:true,id:"order_no"},
  	{tgt:"order_code",tt:false,id:"order_code"},
    {tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"},
  	 {tgt:"color_name",tt:false,id:"color_name"},
  	{tgt:"color_name",tt:true,id:"color_name"},
  	{tgt:"color_code",tt:false,id:"color_code"},
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"},  	
	{tgt:"stock_kgs",tt:false,id:"stock_kgs"}, 
	{tgt:"issued_kgs",tt:false,id:"tot_weight"}, 
   ]}},
  	{name:"set_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"count_name"},
 	
 	{name:"count_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mill_name"},  	
 	{name:"count_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"}
    	]}},
    {name:"color_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mill_name"},  	
 	{name:"color_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_color_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"color_name",tt:false,id:"color_name"},
  	{tgt:"color_name",tt:true,id:"color_name"},
  	{tgt:"color_code",tt:false,id:"color_code"}
    	]}},
    		
    {name:"mill_code",inputType:0,type:"INT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"issued_kgs"},  	
  	{name:"mill_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"count_name",lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"}
  		]}},
    {name:"cone_type_code",inputType:0,type:"INT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"issued_kgs"},  	
  	{name:"cone_type",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"count_name",lovOptions:{url:"/tekknow/service/ajax",ajax:"cone_type_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"cone_type",tt:false,id:"cone_type"},
  	{tgt:"cone_type",tt:true,id:"cone_type"},
  	{tgt:"cone_type_code",tt:false,id:"cone_type_code"}
  		]}},
    {name:"cone_weight_code",inputType:0,type:"INT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"issued_kgs"},  	
  	{name:"cone_weight",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"count_name",lovOptions:{url:"/tekknow/service/ajax",ajax:"cone_weight_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"cone_weight",tt:false,id:"cone_weight"},
  	{tgt:"cone_weight",tt:true,id:"cone_weight"},
  	{tgt:"cone_weight_code",tt:false,id:"cone_weight_code"}
  		]}},
    {name:"stock_kgs",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"issued_kgs",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
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
    		gir.setScreenCode("600036");
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
    loadSetNo();
        }
          function loadSetNo(){
			  var a=new FlexUI.Ajax();
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=set_no&ro=false&ic=0","");
 	 	  if(r!=null){
   	 			if(r.data){
   	 				screenObjects.getScreenObject("set_no").setValue(r.data[0][0]);	
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600036","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function editWarping(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"warping_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600036","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelWarping(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"warping_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	
	</script>
</body>
</html>