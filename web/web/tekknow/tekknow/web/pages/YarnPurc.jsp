<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Yarn Purchase</title>
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
			Yarn Purchase
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
					<div class="col-md-4"><label>Bill No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="bill_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="bill_date"></div>
				</div>
				</div>
			</div>
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Supplier</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>PO No.</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="po_no"></div>
				</div>
				</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="total"></div>
				</div>
				</div>	
				
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>VAT%</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="vat_per"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>VAT Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="vat_amt"></div>
				</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Loading Charges</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="loading_charges"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Freight</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="freight"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Rouded Off</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="round_off"></div>
				</div>
				</div>
			</div>
			
		<div class="clearfix"></div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Net Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="net_amount"></div>
				</div>
				</div>
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="yarnpurcgrid" style="height:350px">
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
		<div style="position:fixed; bottom:0; width:94.5%; background:#fff; z-index:1000;">
			<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveYarnPurc()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editYarnPurc()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelYarnPurc()">Cancel</div>
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
  	{name:"bill_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"girdate"},
  	{name:"bill_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"po_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"po_no",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_po_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"po_no",tt:false,id:"po_no"},
  	{tgt:"po_no",tt:true,id:"po_no"},
  	{tgt:"po_code",tt:false,id:"po_code"}
  		]}},
 	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
 	{name:"total",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"vat_per",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode",onchange:"onRateQuantityChange"},
 	{name:"vat_amt",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
 	{name:"loading_charges",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode",onchange:"onRateQuantityChange"},
 	{name:"freight",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode",onchange:"onRateQuantityChange"},
 	{name:"round_off",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode",onchange:"onRateQuantityChange"},
 	{name:"net_amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},

  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"yarnpurcgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"count_code",optional:false,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
	{order:"1",id: "cone_type_code", name: "cone_type_code", field: "cone_type_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
	{order:"2",id: "cone_type", name: "Cone Type", field: "cone_type",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"cone_type_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"cone_type_code",col:"cone_type_code"},
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"cone_type",col:"cone_type"},
  	{tgt:"yarnpurcgrid_data",tt:true,row:"cr",id:"cone_type",col:"cone_type"}	
  	]}},
      {order:"3",id: "count_code", name: "count_code", field: "count_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "count_name", name: "Count ", field: "count_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"count_code",col:"count_code"},
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"count_name",col:"count_name"},
  	{tgt:"yarnpurcgrid_data",tt:true,row:"cr",id:"count_name",col:"count_name"}	
  	]}},
  	{order:"5",id: "mill_code", name: "mill_code", field: "mill_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"6",id: "mill_name", name: "Mill", field: "mill_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"mill_code",col:"mill_code"},
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"mill_name",col:"mill_name"},
  	{tgt:"yarnpurcgrid_data",tt:true,row:"cr",id:"mill_name",col:"mill_name"}	
  	]}},  	
  	{order:"7",id: "color_code", name: "color_code", field: "color_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"8",id: "color_name", name: "Color", field: "color_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_color_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"color_code",col:"color_code"},
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"color_name",col:"color_name"},
  	{tgt:"yarnpurcgrid_data",tt:true,row:"cr",id:"color_name",col:"color_name"}	
  	]}},
  	 {order:"9",id: "cone_weight_code", name: "cone_weight_code", field: "cone_weight_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	 {order:"10",id: "cone_weight", name: "Cone Weight", field: "cone_weight",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"cone_weight_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"cone_weight_code",col:"cone_weight_code"},
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"cone_weight",col:"cone_weight"},
  	{tgt:"yarnpurcgrid_data",tt:true,row:"cr",id:"cone_weight",col:"cone_weight"}	
  	]}},
  	{order:"11",id: "Bags", name: "Bags", field: "bags",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"12",id: "cones_bag", name: "Cones/Bag", field: "cones_bag",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"13",id: "cones", name: "Cones", field: "cones",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"14",id: "kgs", name: "Kgs", field: "kgs",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"15",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"16",id: "unit_code", name: "Unit", field: "unit_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	{order:"17",id: "unit_name", name: "Unit", field: "unit_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":	10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_po_unit",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"unit_code",col:"unit_code"},
  	{tgt:"yarnpurcgrid_data",tt:false,row:"cr",id:"unit_name",col:"unit_name"},
  	{tgt:"yarnpurcgrid_data",tt:true,row:"cr",id:"unit_name",col:"unit_name"}	
  	]}},
  	{order:"18",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"right",cTotal:true,"chkTag":false},
    ]
    }}]};
    var gir=new FlexUI.Screen("yarnpurc",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("yarnpurcgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("yarnpurcgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveYarnPurc(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
	    		var code=screenObjects.getScreenObject("code").getValue();
	        	if(code=="" || code=="0"){ 
	    			gir.setOperation("ADD");
	    		} 
    		gir.setScreenCode("600033");
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
        }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
		function calculateTotal(){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("yarnpurcgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
			//total+=toNumber(t.getText(i,cols.amount));
		//	total_cones=toNumber(t.getText(i,cols.bags))* toNumber(t.getText(i,cols.cones_bag));
		//	t.setText(i, cols.cones,total_cones);
		//	t.setText(i,cols.kgs,toNumber(t.getText(i,cols.cones))*toNumber(t.getText(i,cols.cone_weight)));
		
			if(t.getText(i,cols.unit_code)==1)
			{
				t.setText(i,cols.amount,toNumber(t.getText(i,cols.bags)) * toNumber(t.getText(i,cols.rate)) );
			}
			else
			{
				t.setText(i,cols.amount,toNumber(t.getText(i,cols.kgs)) * toNumber(t.getText(i,cols.rate)) );
			}
			total+=toNumber(t.getText(i,cols.amount));
			screenObjects.getScreenObject("total").setValue(total);
			screenObjects.getScreenObject("vat_amt").setValue(toNumber(screenObjects.getScreenObject("total").getValue())*toNumber(screenObjects.getScreenObject("vat_per").getValue())/100);
			net_amount=total+toNumber(screenObjects.getScreenObject("vat_amt").getValue())+toNumber(screenObjects.getScreenObject("loading_charges").getValue())+toNumber(screenObjects.getScreenObject("freight").getValue());
			screenObjects.getScreenObject("net_amount").setValue(net_amount);
			}
			//	screenObjects.getScreenObject("vat_amt").setValue(toNumber(screenObjects.getScreenObject("total").getValue())*toNumber(screenObjects.getScreenObject("vat_per").getValue())/100);

			/*screenObjects.getScreenObject("totalamt").setValue(roundOff(total,2));
			//screenObjects.getScreenObject("vat_amt").setValue(toNumber(screenObjects.getScreenObject("total").getValue())*toNumber(screenObjects.getScreenObject("vat_per").getValue())/100);
        //	screenObjects.getScreenObject("netamount").setValue(roundOff(total,2));
        	  
			//$("#netAmt").html("Net Amount   "+roundOff(total,2));*/
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveYarnPurc();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadYarnPurcData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
		function editYarnPurc(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"yarn_purc_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
		function onEditClose(e,args){	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600033","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600033","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelYarnPurc(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"yarn_purc_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}
		</script>
</body>
</html>