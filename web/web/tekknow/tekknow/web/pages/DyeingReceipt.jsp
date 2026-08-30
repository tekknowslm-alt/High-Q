<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Yarn Dyeing Receipt</title>
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
			Dyed Yarn Receipt
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
					<div class="col-md-6"><input type="text" class="form-control" id="rece_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Challan No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="challan_no"></div>
				</div>
				</div>	
			</div>
	</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Dyeing Party</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Vehicle No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="vehicle_no"></div>
				</div>
				</div>	
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
			<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Issue No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="issue_no"></div>
				</div>
				</div>		
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Remarks</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>	
			</div>
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="dyeingreceiptgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveDyeingReceipt()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editDyeingReceipt()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelDyeingReceipt()">Cancel</div>
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
  	{name:"rece_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"challan_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
    {name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
  	{name:"issue_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"issue_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",validation:"getSetYarnDetails",lovOptions:{url:"/tekknow/service/ajax",ajax:"dyeingisslist_ret",scrollEnabled:true,searchFromList:false,dsi:0,
  	params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"issue_no",tt:false,id:"issue_no"},
  	{tgt:"issue_no",tt:true,id:"issue_no"},
  	{tgt:"issue_code",tt:false,id:"issue_code"}
  		]}},	
	{name:"vehicle_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},

  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"dyeingreceiptgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"count_code",optional:false,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "count_code", name: "count_code", field: "count_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "count_name", name: "Count ", field: "count_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"dyeingreceiptgrid_data",tt:false,row:"cr",id:"count_code",col:"count_code"},
  	{tgt:"dyeingreceiptgrid_data",tt:false,row:"cr",id:"count_name",col:"count_name"},
  	{tgt:"dyeingreceiptgrid_data",tt:true,row:"cr",id:"count_name",col:"count_name"}	
  	]}},
  	{order:"3",id: "mill_code", name: "mill_code", field: "mill_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "mill_name", name: "Mill", field: "mill_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"dyeingreceiptgrid_data",tt:false,row:"cr",id:"mill_code",col:"mill_code"},
  	{tgt:"dyeingreceiptgrid_data",tt:false,row:"cr",id:"mill_name",col:"mill_name"},
  	{tgt:"dyeingreceiptgrid_data",tt:true,row:"cr",id:"mill_name",col:"mill_name"}	
  	]}},  	
 	{order:"5",id: "color_code", name: "color_code", field: "color_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"6",id: "color_name", name: "FinalColor", field: "color_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_color_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"dyeingreceiptgrid_data",tt:false,row:"cr",id:"color_code",col:"color_code"},
  	{tgt:"dyeingreceiptgrid_data",tt:false,row:"cr",id:"color_name",col:"color_name"},
  	{tgt:"dyeingreceiptgrid_data",tt:true,row:"cr",id:"color_name",col:"color_name"}	
  	]}},  	
  	{order:"7",id: "kgs_issued", name: "Issued Kgs", field: "kgs_issued",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,align:"right","decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"8",id: "kgs_received", name: "Received Kgs", field: "kgs_received",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,align:"right","decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"9",id: "excess_shortage", name: "Shortage Kgs", field: "excess_shortage",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,align:"right","decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    ]
    }}]};
    var gir=new FlexUI.Screen("yarndyeingreceipt",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("dyeingreceiptgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("dyeingreceiptgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveDyeingReceipt(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
	    		var code=screenObjects.getScreenObject("code").getValue();
	        	if(code=="" || code=="0"){ 
	    			gir.setOperation("ADD");
	    		} 
    		gir.setScreenCode("600047");
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
			var t=screenObjects.getScreenObject("dyeingreceiptgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
			//total+=toNumber(t.getText(i,cols.amount));
			//total_cones=toNumber(t.getText(i,cols.bags))* toNumber(t.getText(i,cols.cones_bag));
			
			
		//	t.setText(i, cols.cones,total_cones);
			t.setText(i,cols.excess_shortage,toNumber(t.getText(i,cols.kgs_issued)) - toNumber(t.getText(i,cols.kgs_received)) );
			//total+=toNumber(t.getText(i,cols.amount));
			//screenObjects.getScreenObject("total").setValue(total);
			//screenObjects.getScreenObject("vat_amt").setValue(toNumber(screenObjects.getScreenObject("total").getValue())*toNumber(screenObjects.getScreenObject("vat_per").getValue())/100);
			//net_amount=total+toNumber(screenObjects.getScreenObject("vat_amt").getValue())+toNumber(screenObjects.getScreenObject("loading_charges").getValue())+toNumber(screenObjects.getScreenObject("freight").getValue());
			//screenObjects.getScreenObject("net_amount").setValue(net_amount);
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
				saveWeftIssue();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadDyeingReceiptData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			calculateTotal();
			hideLoader();
		}
		function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600047","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			calculateTotal();
			hideLoader();
		}
		
		function editDyeingReceipt(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"dyeingreceipt_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
			}
				function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600047","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelDyeingReceipt(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"dyeingreceipt_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
				function getSetYarnDetails(id,me){
		   if(!gir.getSaveInProgress()){
		   		var s=new FlexUI.Ajax();		   
				var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=dyeingissdet&issue_code="+screenObjects.getScreenObject("issue_code").getValue());
				var dg=screenObjects.getScreenObject("dyeingreceiptgrid_data");
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
	</script>
</body>
</html>