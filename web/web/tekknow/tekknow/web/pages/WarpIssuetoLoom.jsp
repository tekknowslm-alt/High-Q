<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Warp Issue to Loom</title>
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
			Warp Issue to Loom
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
					<div class="col-md-6"><input type="text" class="form-control" id="issue_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Shift</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="shift_name"></div>
				</div>
				</div>
			</div>
	
	 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="warpissuetoloomgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveWarpIssuetoLoom()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editWarpIssuetoLoom()">Edit</div>
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
  	{name:"issue_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"shift_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"shift_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"shift_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"shift_name",tt:false,id:"shift_name"},
  	{tgt:"shift_name",tt:true,id:"shift_name"},
  	{tgt:"shift_code",tt:false,id:"shift_code"}
    	]}},

  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	
  	{name:"warpissuetoloomgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"order_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "order_code", name: "order_code", field: "order_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "order_no", name: "Order No.", field: "order_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"fabric_order_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"order_code",col:"order_code"},
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"order_no",col:"order_no"},
  	{tgt:"warpissuetoloomgrid_data",tt:true,row:"cr",id:"order_no",col:"order_no"}	
  	]}},
  	{order:"3",id: "article_code", name: "article_code", field: "article_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "article_no", name: "Article No.", field: "article_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"article_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"article_code",col:"article_code"	,
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"article_no",col:"article_no"},
  	{tgt:"warpissuetoloomgrid_data",tt:true,row:"cr",id:"article_no",col:"article_no"}	
  	]}},
  	{order:"5",id: "loom_code", name: "loom_code", field: "loom_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	{order:"6",id: "loom_no", name: "Loom No.", field: "loom_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"loom_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"loom_code",col:"loom_code"},
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"loom_no",col:"loom_no"},
  	{tgt:"warpissuetoloomgrid_data",tt:true,row:"cr",id:"loom_no",col:"loom_no"}	
  	]}},
  	{order:"7",id: "beam_no", name: "Beam No.", field: "beam_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"beam_stock_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"beam_no",col:"beam_no"},
  	{tgt:"warpissuetoloomgrid_data",tt:true,row:"cr",id:"beam_no",col:"beam_no"},
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"set_no",col:"set_no"},
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"ends",col:"ends"},
  	{tgt:"warpissuetoloomgrid_data",tt:false,row:"cr",id:"sized_mtr",col:"mtrs"},
  		]}},
    	{order:"8",id: "set_no", name: "SetNo.", field: "set_no",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"9",id: "mtrs", name: "Mtrs", field: "mtrs",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"10",id: "ends", name: "Ends", field: "ends",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	]    
    }}]};
  	
  	var gir=new FlexUI.Screen("warpissuetoloom",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
            screenObjects.getScreenObject("warpissuetoloomgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("warpissuetoloomgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveWarpIssuetoLoom(){
		 	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		} 
    				gir.setScreenCode("600062");
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
			//calculateTotal();
			return true;
		}
		function calculateTotal(){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("warpissuetoloomgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
			//total+=toNumber(t.getText(i,cols.amount));
			total_cones=toNumber(t.getText(i,cols.bags))* toNumber(t.getText(i,cols.cones_bag));
			t.setText(i, cols.cones,total_cones);
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
				saveWarpIssuetoLoom();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadWarpIssuetoLoomData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
			function editWarpIssuetoLoom(id,me){
		 	gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"warpissuetoloom_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600062","code="+args.result[2]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
	</script>
</body>
</html>