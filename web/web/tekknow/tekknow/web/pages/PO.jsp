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
    	<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			Purchase Order 
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-1"><label>Type</label></div>
					<div class="col-md-10"><select class="form-control" id="po_type"></select><input type="hidden" class="form-control" id="code"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>PO No</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="po_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="po_date"></div>
				</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Recd. Date</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="recd_date"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Recd. By</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="verbal_received_by"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Contact Person</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="contact_person"></div>
				</div>
				</div>
			</div>
				
			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Customer</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="customer_name"><input type="hidden" class="form-control" id="customer_code"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Derlivery Address </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="deli_address_name"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Transporter</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="transporter_name"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Inco Terms </label></div>
				<div class="col-md-10"><select class="form-control" id="freight_type"/></div>
				</div>
			</div>
			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Proforma inv. No.</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="proforma_invoice_code"></div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Port of Loading</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="port_of_loading_name"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Port of Discharge</label></div>
					<div class="col-md-8"><input type="text"  class="form-control" id="port_of_discharge_name"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Final Destination</label></div>
					<div class="col-md-8"><input type="text"  class="form-control" id="final_destination"></div>
				</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Freight Terms</label></div>
				<div class="col-md-10"><Select class="form-control" id="freight_terms"/></div>
				</div>
			</div>
			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Payment Terms</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="payment_terms_name"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Insurance</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="insurance"></div>
				</div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero" >
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Credit Days</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="credit_days"></div>
			</div>
			</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
			<div class="form-group mbotto">
				<div class="col-md-2"><label>Remarks</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="Remarks"></div>
				</div>
			
			</div>
			
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
			</div>
		
		 </div>
		</div>
		<div class="clearfix"></div>	
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="pogrid" style="height:350px">
			<span>po Grid<span/>
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
  	fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"po_type"},
  	{name:"po_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"E","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"po_date",values:"E~D",keys:"Export~Domestic",onchange:"onpoTypeChange",validation:"onpoTypeChange"},
  	{name:"po_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"po_date"},
  	{name:"po_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"recd_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"recd_by",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"contact_person",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"customer_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"customer_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"customer_name",tt:false,id:"ledger_name"},
  	{tgt:"customer_name",tt:true,id:"ledger_name"},
  	{tgt:"customer_code",tt:false,id:"ledger_code"}
  	]}},

  	{name:"deli_address_code",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"deli_address_name"},
  	{name:"deli_address_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"deli_address_name",tt:false,id:"ledger_name"},
  	{tgt:"deli_address_name",tt:true,id:"ledger_name"},
  	{tgt:"deli_address_code",tt:false,id:"ledger_code"}
  	]}},  
  	{name:"freight_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"P","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"po_date",values:"F~C~I~D~U~A",keys:"FOB~C&F~CIF~DES~DDU~FCA"},
  		{name:"transporter_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"transporter_name"},  	
  	{name:"transporter_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"transporter",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"transporter_name",tt:false,id:"ledger_name"},
  	{tgt:"transporter_name",tt:true,id:"ledger_name"},
  	{tgt:"transporter_code",tt:false,id:"ledger_code"}
  	]}},
  		{name:"port_of_loading",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"port_of_loading_name"},  	
  	{name:"port_of_loading_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"portmast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"port_of_loading_name",tt:false,id:"port_name"},
  	{tgt:"port_of_loading_name",tt:true,id:"port_name"},
  	{tgt:"port_of_loading",tt:false,id:"port_code"}
  	]}},
  		{name:"port_of_discharge",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"port_of_discharge_name"},  	
  	{name:"port_of_discharge_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"portmast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"port_of_discharge_name",tt:false,id:"port_name"},
  	{tgt:"port_of_discharge_name",tt:true,id:"port_name"},
  	{tgt:"port_of_discharge",tt:false,id:"port_code"}
  	]}},
  	{name:"final_destination",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"vide"},
  	{name:"freight_terms",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"P","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"po_date",values:"P~T~S~I",keys:"Paid~To-Pay~Sharing~Included"},
  	{name:"payment_terms_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"payment_terms_name"},  	
  	{name:"payment_terms_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"payment_terms",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"payment_terms_name",tt:false,id:"payment_terms"},
  	{tgt:"payment_terms_name",tt:true,id:"payment_terms"},
  	{tgt:"payment_terms_code",tt:false,id:"payment_terms_code"}
  	]}},
  	{name:"credit_days",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"insurance",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"btnSave",inputType:3,caption:"",visible:true},
    {name:"btnClear",inputType:3,caption:"",visible:true}
  	]},
  	{name:"pogrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "pi_code", name: "PI No.", field: "pi_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:0,"chkTag":false},    
    {order:"2",id: "productcode", name: "ProductCode", field: "productcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"3",id: "productname", name: "Material Description", field: "productname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"pogrid_data",tt:false,row:"cr",id:"product_code",col:"productcode"},
  	{tgt:"pogrid_data",tt:false,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"pogrid_data",tt:true,row:"cr",id:"product_name",col:"productname"}
  	]}},
  	{order:"4",id: "material_description", name: "Buyer Material Description", field: "material_description",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false},
    {order:"5",id: "qty", name: "Qty", field: "qty",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"6",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"7",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"8",id: "schedule_no", name: "Schedule No.", field: "schedule_no",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false},
  	{order:"9",id: "delivery_date", name: "Delivery Date", field: "delivery_date",defaultValue:"0","inputType":0,"type":"DATE","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false},
  ]
    }}]};
	var po=new FlexUI.Screen("po",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("pogrid_data").getInputField().onTextKeyDown.subscribe(tableTextPOKeyDown);
            screenObjects.getScreenObject("pogrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            screenObjects.getScreenObject("po_type").focus();
        });
        function savepo(){
        	if('<%=mode%>'=="View") return;
        	if(po.getSaveInProgress()) return;
        	var r=null;
    		po.setOperation("ADD");
    		po.setScreenCode("600003");
    		var d=po.processDataToSave();
    		po.setSaveInProgress(true);    		
			if("FAILED"!=d){
				var s=new FlexUI.Ajax();
				showLoader();
				r=s.callAjax("POST","/tekknow/service/screen/save",d);
				hideLoader();
		 	}else{
		 		alert("Please correct the validation errors and continue...");
		 		po.setSaveInProgress(false);		 		
		 		return;
		 	}		 
		 	if(r.result=="Success"){
				alert(r.message+" [No:"+r.po_no+"]");
				clearInnerScreen();
				return r.code;			
			}else{
				po.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function onpoTypeChange(id,me){
        	/*var gt=screenObjects.getScreenObject("po_type").getValue();
        	screenObjects.getScreenObject("poprefix").setValue("H"+gt);*/
        	return true;
        }
        function clearInnerScreen(){
        	po.clearScreen();
        	po.setSaveInProgress(false);
        	onpoTypeChange();
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
			calculateAmount(t.getCurrentRow());
			
			return true;
		}
		function calculateAmount(row){
			var t=screenObjects.getScreenObject("pogrid_data");
			var cols=t.getCols();	
			var baseqty=0;
			baseqty=toNumber(t.getText(row,cols.qty));
			var amt=roundOff(toNumber(t.getText(row,cols.rate))*baseqty,2);
			t.setText(row,cols.amount,roundOff(amt,2));
		}
		
		function calculateTotal(){
			/*var total=0;
			var t=screenObjects.getScreenObject("pogrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				total+=toNumber(t.getText(i,cols.amount));
			}
			screenObjects.getScreenObject("totalamt").setValue(roundOff(total,2));
			screenObjects.getScreenObject("netamount").setValue(roundOff(total,2));
			$("#netAmt").html("Net Amount   "+roundOff(total,2));*/
		}
		function tableTextPOKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				savepo();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadpoData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			po.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}
	</script>
</body>
</html>