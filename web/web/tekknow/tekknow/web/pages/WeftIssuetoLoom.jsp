<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Weft Issue to Loom</title>
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
			Weft Issue to Loom
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
      		 <div class="col-md-12 col-sm-12 mpZero" id="WeftIssuetoLoomgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveWeftIssuetoLoom()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editWeftIssuetoLoom()">Edit</div>
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
  	
  	{name:"WeftIssuetoLoomgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"order_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "order_code", name: "order_code", field: "order_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "order_no", name: "Order No.", field: "order_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"fabric_order_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"order_code",col:"order_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"order_no",col:"order_no"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"order_no",col:"order_no"}	
  	]}},
  	{order:"3",id: "article_code", name: "article_code", field: "article_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "article_no", name: "Article No.", field: "article_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"article_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"article_code",col:"article_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"article_no",col:"article_no"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"article_no",col:"article_no"}	
  	]}},
  	{order:"5",id: "loom_code", name: "loom_code", field: "loom_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	{order:"6",id: "loom_no", name: "Loom No.", field: "loom_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:75,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"loom_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"loom_code",col:"loom_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"loom_no",col:"loom_no"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"loom_no",col:"loom_no"}	
  	]}},
     {order:"7",id: "count_code", name: "count_code", field: "count_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"8",id: "count_name", name: "Count ", field: "count_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"count_code",col:"count_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"count_name",col:"count_name"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"count_name",col:"count_name"}	
  	]}},
  	{order:"9",id: "mill_code", name: "mill_code", field: "mill_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"10",id: "mill_name", name: "Mill", field: "mill_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"mill_code",col:"mill_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"mill_name",col:"mill_name"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"mill_name",col:"mill_name"}	
  	]}},  	
  	{order:"11",id: "color_code", name: "color_code", field: "color_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"12",id: "color_name", name: "Color", field: "color_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:75,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_color_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"color_code",col:"color_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"color_name",col:"color_name"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"color_name",col:"color_name"}	
  	]}},
  
  	 {order:"13",id: "cone_weight_code", name: "cone_weight_code", field: "cone_weight_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	 {order:"14",id: "cone_weight", name: "Cone Weight", field: "cone_weight",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:75,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"cone_weight_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"cone_weight_code",col:"cone_weight_code"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:false,row:"cr",id:"cone_weight",col:"cone_weight"},
  	{tgt:"WeftIssuetoLoomgrid_data",tt:true,row:"cr",id:"cone_weight",col:"cone_weight"}	
  	]}},
  
  	{order:"15",id: "no_of_bags", name: "Bags", field: "no_of_bags",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"16",id: "cones", name: "Cones", field: "cones",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"17",id: "kgs", name: "Kgs", field: "kgs",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:50,"chkTag":false,onchange:"onRateQuantityChange"},
  	]    
    }}]};
  	
  	var gir=new FlexUI.Screen("WeftIssuetoLoom",sProps);
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
            screenObjects.getScreenObject("WeftIssuetoLoomgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("WeftIssuetoLoomgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveWeftIssuetoLoom(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    			var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		} 
    	gir.setScreenCode("600063");
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
			var t=screenObjects.getScreenObject("WeftIssuetoLoomgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
				t.setText(i,cols.kgs,toNumber(t.getText(i,cols.cones)) * toNumber(t.getText(i,cols.cone_weight)) );
			}
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveWeftIssuetoLoom();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadWeftIssuetoLoomData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}	
		function editWeftIssuetoLoom(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"weftissuetoloom_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
		 	lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600063","code="+args.result[2]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			calculateTotal();
			hideLoader();
		}
	</script>
</body>
</html>