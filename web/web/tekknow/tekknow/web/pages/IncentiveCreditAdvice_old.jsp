<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Goods Inward Receipt</title>
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
			Goods Inward Receipt 
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Type</label></div>
					<div class="col-md-8"><select class="form-control" id="girtype"></select><input type="hidden" class="form-control" id="code"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>GIR No</label></div>
					<div class="col-md-2"><input type="text" class="form-control" id="girprefix" disabled></div>
					<div class="col-md-6"><input type="text" class="form-control" id="girno" disabled></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="girdate"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Received Goods From M/s.</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="suppliername"><input type="hidden" class="form-control" id="suppliercode"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Address </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="address1"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label> </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="address2"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label> </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="address3"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero" style="display:none">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Cash Party</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="cashparty"></div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Mode</label></div>
					<div class="col-md-8"><select class="form-control" id="mode"></select></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Bill Type</label></div>
					<div class="col-md-8"><select class="form-control" id="billtype"></select></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Invoice No</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="invno"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Invoice Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="invdate"></div>
				</div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero" style="display:none">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Despatched To</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="despatchedto"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Vide  </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="vide"></div>
				</div>
			</div>
		
		 </div>
		</div>
		<div class="clearfix"></div>	
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="girgrid" style="height:350px">
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
  	{name:"girtype",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"R","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girdate",values:"R~C~O~A~S",keys:"Raw Materials~Consumables~Others~Assets~Spares",onchange:"onGirTypeChange",validation:"onGirTypeChange"},
  	{name:"girprefix",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":2,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girdate"},
  	{name:"girno",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girdate"},
  	{name:"girdate",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"suppliercode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"suppliername",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"suppliers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"suppliername",tt:false,id:"ledger_name"},
  	{tgt:"suppliername",tt:true,id:"ledger_name"},
  	{tgt:"suppliercode",tt:false,id:"ledger_code"},
  	{tgt:"address1",tt:false,id:"addr1"},
  	{tgt:"address2",tt:false,id:"addr2"},
  	{tgt:"address3",tt:false,id:"addr3"}
  	]}},
  	{name:"address1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
  	{name:"address2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
  	{name:"address3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
  	{name:"cashparty",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"mode",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"I","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"billtype",values:"I~D~O",keys:"By Invoice~By DC~By Others"},
  	{name:"billtype",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"invno",values:"N~Y",keys:"Normal~Bill will not be receivable"},
  	{name:"invno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":20,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"invdate"},
  	{name:"invdate",inputType:0,type:"DATE",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"vide"},
  	{name:"despatchedto",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"vide"},
  	{name:"vide",inputType:0,type:"TEXT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"girgrid_data"},
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"girgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "productcode", name: "ProductCode", field: "productcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "productname", name: "Product", field: "productname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"girgrid_data",tt:false,row:"cr",id:"product_code",col:"productcode"},
  	{tgt:"girgrid_data",tt:false,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"girgrid_data",tt:true,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"girgrid_data",tt:false,row:"cr",id:"unit_code",col:"unitcode"},
  	{tgt:"girgrid_data",tt:false,row:"cr",id:"unit_name",col:"unitname"},
  	{tgt:"girgrid_data",tt:true,row:"cr",id:"unit_name",col:"unitname"}  	  	  	  	  	
  	]}},
  	{order:"3",id: "vehicleno", name: "Vehicle No", field: "vehicleno",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false},
    {order:"4",id: "recdqty", name: "Qty Recd", field: "recdqty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"5",id: "billqty", name: "Bill Qty", field: "billqty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"6",id: "unitcode", name: "UnitCode", field: "unitcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
    {order:"7",id: "unitname", name: "Unit", field: "unitname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:100,"chkTag":false},
  	{order:"8",id: "godowncode", name: "GodownCode", field: "godowncode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"9",id: "godownname", name: "Godown", field: "godownname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:150,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"godowns",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
    {tgt:"girgrid_data",tt:false,row:"cr",id:"godown_code",col:"godowncode"},
  	{tgt:"girgrid_data",tt:false,row:"cr",id:"godown_name",col:"godownname"},
  	{tgt:"girgrid_data",tt:true,row:"cr",id:"godown_name",col:"godownname"}  	  	
  	]}},
  	{order:"10",id: "indentcode", name: "IndentCode", field: "indentcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"11",id: "indentno", name: "Indent No", field: "indentno",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"indents",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
    {tgt:"girgrid_data",tt:false,row:"cr",id:"indent_code",col:"indentcode"},
  	{tgt:"girgrid_data",tt:false,row:"cr",id:"indent_no",col:"indentno"},
  	{tgt:"girgrid_data",tt:true,row:"cr",id:"indent_no",col:"indentno"}  	  	
  	]}},
    {order:"12",id: "remarks", name: "Remarks", field: "remarks",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:200},
    ]
    }}]};
	var gir=new FlexUI.Screen("gir",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("girgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("girgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            screenObjects.getScreenObject("girtype").focus();
        });
        function saveGIR(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    		gir.setOperation("ADD");
    		gir.setScreenCode("600001");
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
        	var gt=screenObjects.getScreenObject("girtype").getValue();
        	screenObjects.getScreenObject("girprefix").setValue("H"+gt);
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
			var t=screenObjects.getScreenObject("girgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				total+=toNumber(t.getText(i,cols.amount));
			}
			screenObjects.getScreenObject("totalamt").setValue(roundOff(total,2));
			screenObjects.getScreenObject("netamount").setValue(roundOff(total,2));
			$("#netAmt").html("Net Amount   "+roundOff(total,2));
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveGIR();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadGIRData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}
	</script>
</body>
</html>