<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Collection Advice</title>
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
				Collection Advice
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
		<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Short-Fall A/c:</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="short_fall_ledger_name"><input type="hidden" class="form-control" id="short_fall_ledger_code"></div>
				</div>
			</div>		
		 </div>
		</div>
		
		<div class="clearfix"></div>	
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="purgrid" style="height:250px">
			<span>Purchase Grid<span/>
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
		<div class="col-md-12 col-sm-12 mpZero">
			<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="totalamount" disabled/></div>
				</div>
			</div>
			<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Discount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="totaldiscount" disabled/></div>
				</div>
			</div>
			<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Net Total Amount</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="nettotalamount" disabled/></div>
				</div>
			</div>			
		</div>
		<div class="col-md-2 col-sm-2 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>	
			</div>
		</div>
		</div>
		<div class="col-md-4 col-sm-4 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
    	 <div class="col-md-12 col-sm-12 mpZero">
      		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-12"><label>Remarks</label></div>
					<div class="col-md-12"><textarea row=10 col=200 style="height:125px" class="form-control" id="remarks"></textarea></div>
				</div>
				</div>	
			</div>
		 </div>
		</div>
		</div>
		<div class="col-md-6 col-sm-6 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			<div class="col-md-12 col-sm-12 mpZero" id="taxgrid" style="height:200px">
			<span>Debit Grid<span/>
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
		<div class="col-sm-12 col-md-12 col-lg-12 mpRes">
    		<div class="col-sm-12 col-md-12" style="background:#fedc34; display:inline-block;height:84px;text-align:center;padding-top:20px" >
    		<input type="hidden" id="detamount" value="0"/><input type="hidden" id="billamount" value="0"/>
    		<div class="netAm">Net Amount <span id="netAmt">0.00</span></div>
    		</div>
    	</div>
    </div>
	</div>
	<div style="display:none">
		<div id='dlggir' class='pop_lov_box'>
			<div id='dlggirtitle' class='pop_lov_hed_box'>
			<div class='pop_lov_clos'>
				<a href='#'>
					<span class='fa fa-times-circle'>
					</span>
				</a>
			</div>
			<div class='pop_lov_hed_txt'>Select GIR</div>
			</div>
			<div id='girscont' class='pop_lov_inp_box'>
				<div class="col-md-12 col-sm-12 mpZero" id="girs" style="height:200px">
		  		</div>				
				<div class="clearfix"></div>
				<div id="actButton" class="col-md-12 text-right">
                	<button id="btnGIR" class="btn btn-primary priBut" type="button" onclick="selectGIR()">Ok</button>
	                <button id="btnCancelDlg" class="btn btn-default" type="button" onclick="cancelGIRDlg()">Cancel</button>
            	</div>							
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
  		{name:"curr_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"curr_name"},  	
  	{name:"curr_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"curr_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"curr_name",tt:false,id:"curr_name"},
  	{tgt:"curr_name",tt:true,id:"curr_name"},
  	{tgt:"curr_code",tt:false,id:"curr_code"}
    	]}},
  	{name:"debit_bank_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"suppliername"},  	
  	{name:"debit_bank_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"debit_bank_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"debit_bank_ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"debit_bank_ledger_code",tt:false,id:"ledger_code"}
    	]}},
  	{name:"short_fall_ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"suppliername"},  	
  	{name:"short_fall_ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"short_fall_ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"short_fall_ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"short_fall_ledger_code",tt:false,id:"ledger_code"}
    	]}},
  	
  	
  	
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"purgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "invoice_code", name: "InvoiceCode", field: "invoice_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "invoice_no", name: "Invoice No.", field: "invoice_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"invoice_code",col:"slip_code"},
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"invoice_no",col:"slip_no"},
  	{tgt:"purgrid_data",tt:true,row:"cr",id:"invoice_no",col:"slip_no"},
    	]}},
    {order:"3",id: "lodgement_advice_no", name: "Invoice No.", field: "invoice_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"lodgement_advice_code",col:"advice_code"},
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"lodgement_advice_no",col:"advice_no"},
  	{tgt:"purgrid_data",tt:true,row:"cr",id:"lodgement_invoice_no",col:"advice_no"},
    	]}},
    {order:"4",id: "maturity_date", name: "Maturity Date", field: "maturity_date",defaultValue:"0","inputType":0,"type":"DATE","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"5",id: "invoice_amount", name: "Invoice Amount", field: "invoice_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"6",id: "advance_amount", name: "Advance Amount", field: "advance_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:0,"chkTag":false},
    {order:"7",id: "loss_amount", name: "Loss Amount", field: "loss_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:0,"chkTag":false},
    {order:"8",id: "balance_amount", name: "Balance Amount", field: "balance_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"right"},
    {order:"9",id: "collection_amount", name: "Collection Amount", field: "collection_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right"},
    {order:"10",id: "realisation_amount", name: "Realisation Amount", field: "realisation_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right"},
    {order:"11",id: "realisation_loss_amount", name: "Realisation Loss Amount", field: "realisation_loss_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,onchange:"onRateQuantityChange",align:"right"},
    {order:"12",id: "others", name: "Others", field: "others",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right"},
    {order:"13",id: "others_inr", name: "Others (INR)", field: "others_inr",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right"},
    {order:"14",id: "convr", name: "Convr", field: "convr",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"center"},
    {order:"15",id: "convr_amount", name: "Convr. Amount", field: "convr_amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"center"},
    {order:"16",id: "value_date", name: "Value Date", field: "value_date",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"center"},
    ]
    }},
    {name:"group2",predesigned:true,contentType:"Fields",
  	fields:[
  	{name:"totalamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"totaldiscount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"nettotalamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"detamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"billamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"} 
  	]},
  	{name:"taxgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"",enableAddRow:true,rowEmptyCheckColumn:"ledger_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "sub_ledger_code", name: "Code", field: "sub_ledger_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "sub_ledger_name", name: "Sub Ledger", field: "sub_ledger_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:150,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"sub_ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"taxgrid_data",tt:false,row:"cr",id:"sub_ledger_code",col:"sub_ledger_code"},
  	{tgt:"taxgrid_data",tt:false,row:"cr",id:"sub_ledger_name",col:"sub_ledger_name"},
  	{tgt:"taxgrid_data",tt:true,row:"cr",id:"sub_ledger_name",col:"sub_ledger_name"}
  	]}},
    {order:"2",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:75,onchange:"onTaxDetailChange",align:"right"}
    ]
    }},
  	{name:"girs",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"gircode",optional:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "gircode", name: "GIRCode", field: "gircode",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "girno", name: "GIR No", field: "girno",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"girs",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"suppcode",src:"suppliercode",tt:false}],results:[
  	{tgt:"girs_data",tt:false,row:"cr",id:"gir_code",col:"gircode"},
  	{tgt:"girs_data",tt:false,row:"cr",id:"girno",col:"girno"},
  	{tgt:"girs_data",tt:true,row:"cr",id:"girno",col:"girno"}
  	]}}
    ]
    }}]};
	var purchase=new FlexUI.Screen("purchase",sProps);	

	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("purgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("purgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            screenObjects.getScreenObject("purtype").focus();
        });        
        function savePurchase(){
        	if('<%=mode%>'=="View") return;
        	if(purchase.getSaveInProgress()) return;
        	var r=null;
    		purchase.setOperation("ADD");
    		purchase.setScreenCode(600002);
    		var d=purchase.processDataToSave();
    		purchase.setSaveInProgress(true);    		
			if("FAILED"!=d){
				var s=new FlexUI.Ajax();
				showLoader();
				r=s.callAjax("POST","/tekknow/service/screen/save",d);
				hideLoader();
		 	}else{
		 		alert("Please correct the validation errors and continue...");
		 		purchase.setSaveInProgress(false);		 		
		 		return;
		 	}		 
		 	if(r.result=="Success"){
				alert(r.message+" [No:"+r.code+"]");
				clearInnerScreen();
				return r.key;			
			}else{
				purchase.setSaveInProgress(false);
				alert(r.message);		
			}
        }
        function clearInnerScreen(){
        	$('#overlapdiv').css('display','none');
        	purchase.clearScreen();
        	purchase.setSaveInProgress(false);
        	screenObjects.getScreenObject("purtype").focus();
        }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateAmount(t.getCurrentRow());
			calculateTotal();
			return true;
		}
		function onTaxDetailChange(id,me){
			var t=me.getParent();
			calculateTotal(true);
			return true;
		}
		function calculateTotal(fromTax){
			var total=0;
			var totalDisc=0;
			var netTotal=0;
			var billAmount=0;
			var taxes={};
			var t=screenObjects.getScreenObject("purgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			for(var i=0;i<s;i++){
				total+=toNumber(t.getText(i,cols.amount));
				if(taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]==undefined){
					taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]=0;
				}
				taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]=taxes[roundOff(toNumber(t.getText(i,cols.taxperc)),2)]+toNumber(t.getText(i,cols.taxamt));				
				totalDisc+=toNumber(t.getText(i,cols.discount));
				netTotal+=toNumber(t.getText(i,cols.netamount));
			}
			screenObjects.getScreenObject("totalamount").setValue(roundOff(total,2));
			screenObjects.getScreenObject("totaldiscount").setValue(roundOff(totalDisc,2));
			screenObjects.getScreenObject("nettotalamount").setValue(roundOff(netTotal,2));
			//calculate the total taxes & other amounts
			var tg=screenObjects.getScreenObject("taxgrid_data");
			var tgCols=tg.getCols();
			s=tg.getSize();
			var ls_tax_type=screenObjects.getScreenObject("taxtype").getValue();
			var ls_vat_type=screenObjects.getScreenObject("vattype").getValue();
			for(var i=0;i<s;i++){
                var lc_amt = 0
                if(toNumber(tg.getText(i, tgCols.perc)) > 0){
                    if(tg.getText(i, tgCols.cr_dr) == "C"){
                        if(tg.getText(i, tgCols.basic_others) == "B"){
                            if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type!="N")){
                                    if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100) * toNumber(tg.getText(i, tgCols.divid)) / 100), 0));
                                    }else{
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0));
                                    }
                                }
                            }else{
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type !="N")){
                                	tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0));
                                }
                            }

                        }else if(tg.getText(i, tgCols.basic_others) == "O"){
                                var ll_found = findRowNumber("taxgrid_data","ledger_code", tg.getText(i, tgCols.basic_ledger_code), s);
                                var lc_found_amt =0;
                                if(ll_found != -1){
                                    lc_found_amt = tg.getText(ll_found, tgCols.taxamount);
                                }
                                tg.setText(i, tgCols.taxamount, Math.round((toNumber(lc_found_amt) * toNumber(tg.getText(i, tgCols.perc))/ 100)));
                        }else{
                        	var lc_amt=0;
                            for(var j=0;j<=i-1;j++){
                                lc_amt = lc_amt + toNumber(tg.getText(j, tgCols.taxamount));
                            }
                            lc_amt = lc_amt + netTotal;
                            tg.setText(i, tgCols.taxamount, Math.round((lc_amt * toNumber(tg.getText(i, tgCols.perc)) / 100)));
                        }
                    }else{
                        if(tg.getText(i, tgCols.basic_others) == "B"){
                            if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type!="N")){
                                    if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100) * toNumber(tg.getText(i, tgCols.divid)) / 100), 0)*-1);
                                    }else{
                                        tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0)*-1);
                                    }
                                }
                            }else{
                                if((ls_tax_type!="V") && (ls_vat_type!="V" || ls_vat_type !="N")){
                                	tg.setText(i, tgCols.taxamount, roundOff(((netTotal * toNumber(tg.getText(i, tgCols.perc)) / 100)), 0)*-1);
                                }
                            }

                        }else if(tg.getText(i, tgCols.basic_others) == "O"){
                                var ll_found = findRowNumber("taxgrid_data","ledger_code", tg.getText(i, tgCols.basic_ledger_code), s);
                                var lc_found_amt =0;
                                if(ll_found != -1){
                                    lc_found_amt = tg.getText(ll_found, tgCols.taxamount);
                                }
                                tg.setText(i, tgCols.taxamount, Math.round((toNumber(lc_found_amt) * toNumber(tg.getText(i, tgCols.perc))/ 100)));
                        }else{
                        	var lc_amt=0;
                            for(var j=0;j<=i;j++){
                                lc_amt = lc_amt + toNumber(tg.getText(j, tgCols.taxamount));
                            }
                            lc_amt = lc_amt + netTotal;
                            tg.setText(i, tgCols.taxamount, Math.round((lc_amt * toNumber(tg.getText(i, tgCols.perc)) / 100)));
                        }
                    }
                }
            }
            billAmount=netTotal;
            var lc_perc="";
            var li_found=-1;
            var lc_tax_amt=0;
            lc_tax_amt = 0
            var det2amount=0;
            for(var i=0;i<s;i++){
            	var colType=tg.getText(i, tgCols.col_type);
                if(colType!="" && !fromTax){
                    if ((colType=="V" && (ls_vat_type == "V" || ls_vat_type == "N")) || (colType == "C" && ls_tax_type == "C")){
                        lc_perc = roundOff(toNumber(tg.getText(i, tgCols.perc)),2);
                        if(taxes[lc_perc]!=undefined){
                        	lc_tax_amt = lc_tax_amt + taxes[lc_perc];
                        }
                        if(toNumber(tg.getText(i, tgCols.divid)) > 0){
                            tg.setText(i, tgCols.taxamount, Math.round((lc_tax_amt * toNumber(tg.getText(i, tgCols.divid)) / 100)));
                        }else{
                            tg.setText(i, tgCols.taxamount, (Math.round(lc_tax_amt, 0)));
                        }
                    }
                    lc_tax_amt = 0
                }
                billAmount+=toNumber(tg.getText(i, tgCols.taxamount));
                det2amount+=toNumber(tg.getText(i, tgCols.taxamount));                                                            
            }
            screenObjects.getScreenObject("det2amount").setValue(roundOff(det2amount,2));
            var lc_net_amt=0;
            var lc_tax_4=0;
            var lc_tax_12_5=0;
            var lc_turnover_4=0;
            var lc_turnover_12_5=0;
            var lc_tax_4_capital=0;
            var lc_tax_12_5_capital=0;
            var lc_turnover_4_capital=0;
            var lc_turnover_12_5_capital=0;
            var ls_capital_goods="";
            lc_tax_amt = 0;
            screenObjects.getScreenObject("dedper1").setValue("0");
            screenObjects.getScreenObject("dedper2").setValue("0");
            screenObjects.getScreenObject("dedper3").setValue("0");
            screenObjects.getScreenObject("deductionone").setValue("");
            screenObjects.getScreenObject("deductiontwo").setValue("");
            screenObjects.getScreenObject("deductionthree").setValue("");
            screenObjects.getScreenObject("dedvalue1").setValue("0");
            screenObjects.getScreenObject("dedvalue2").setValue("0");
            screenObjects.getScreenObject("dedvalue3").setValue("0");
            for(var i=0;i<s;i++){
                var colType=tg.getText(i, tgCols.col_type);
            	if(colType!="" && !fromTax){
                    if(colType=="V"){
                        var lc_perc = roundOff(toNumber(tg.getText(i, tgCols.perc)),2);
                        var ts=t.getSize();
                        for(var g=0;g<ts;g++){
                        	var ls_capital_goods = t.getText(g,cols.capitalgoods);
                            if(ls_capital_goods== "Y"){
                                lc_tax_amt = lc_tax_amt + toNumber(t.getText(g, cols.taxamt));
                                lc_net_amt = lc_net_amt + toNumber(t.getText(g, cols.netamount));
                                if(lc_perc == 4){
                                    lc_tax_4_capital = lc_tax_4_capital + toNumber(t.getText(g, cols.taxamt));
                                    lc_turnover_4_capital = lc_turnover_4_capital + toNumber(t.getText(g, cols.netamount));
                                }else{
                                    lc_tax_12_5_capital = lc_tax_12_5_capital + toNumber(t.getText(g, cols.taxamt));
                                    lc_turnover_12_5_capital = lc_turnover_12_5_capital + toNumber(t.getText(g, cols.netamount));
                                }
                            }else{
                                if(lc_perc == 4){
                                    lc_tax_4 = lc_tax_4 + toNumber(t.getText(g, cols.taxamt));
                                    lc_turnover_4 = lc_turnover_4 + toNumber(t.getText(g, cols.netamount));
                                }else{
                                    lc_tax_12_5 = lc_tax_12_5 + toNumber(t.getText(g, cols.taxamt));
                                    lc_turnover_12_5 = lc_turnover_12_5 + toNumber(t.getText(g, cols.netamount));
                                }
                            }
                        }
					}
                }
            }
            
                if(lc_tax_amt > 0 || lc_net_amt > 0 || lc_turnover_4 > 0 || lc_turnover_12_5 > 0 || lc_tax_4 > 0 || lc_tax_12_5 > 0){
                    screenObjects.getScreenObject("turnover").setValue(lc_net_amt);
                    screenObjects.getScreenObject("vat_amt").setValue(lc_tax_amt);
                    screenObjects.getScreenObject("turnover_4").setValue(lc_turnover_4);
                    screenObjects.getScreenObject("turnover_12_5").setValue(lc_turnover_12_5);
                    screenObjects.getScreenObject("vat_amt_4").setValue(lc_tax_4);
                    screenObjects.getScreenObject("vat_amt_12_5").setValue(lc_tax_12_5);
                    screenObjects.getScreenObject("turnover_4_capital").setValue(lc_turnover_4_capital);
                    screenObjects.getScreenObject("turnover_12_5_capital").setValue(lc_turnover_12_5_capital);
                    screenObjects.getScreenObject("vat_4_capital").setValue(lc_tax_4_capital);
                    screenObjects.getScreenObject("vat_12_5_capital").setValue(lc_tax_12_5_capital);
                    screenObjects.getScreenObject("dedper1").setValue("50");
                    screenObjects.getScreenObject("dedper2").setValue("25");
                    screenObjects.getScreenObject("dedper3").setValue("25");
                    screenObjects.getScreenObject("deductionone").setValue("");
                    screenObjects.getScreenObject("deductionone").setValue(screenObjects.getScreenObject("recddate").getValue());
                    var dt=screenObjects.getScreenObject("deductionone").getValue().split("/");
                    var y1="";
                    var y2="";
                    if(dt.length==3){
                    	y1=toNumber(dt[2])+1;
                    	y2=toNumber(dt[2])+2;
                    }
                    screenObjects.getScreenObject("dedvalue1").setValue(roundOff(lc_tax_amt * 50/ 100,2));
                    screenObjects.getScreenObject("deductiontwo").setValue(dt[0]+"/"+dt[1]+"/"+y1);
                    screenObjects.getScreenObject("dedvalue2").setValue(roundOff(lc_tax_amt * 25/ 100,2));
                    screenObjects.getScreenObject("deductionthree").setValue(dt[0]+"/"+dt[1]+"/"+y2);
                    screenObjects.getScreenObject("dedvalue3").setValue(roundOff(lc_tax_amt * 25/ 100,2));
                }else{
                    if(ls_vat_type =="C"){
                        var ll_row = findRowNumber("taxgrid_data","col_type", "V", s);
                        screenObjects.getScreenObject("turnover").setValue( netTotal);
                        screenObjects.getScreenObject("vat_amt").setValue(tg.getText(ll_row, tgCols.taxamount));
                        if(toNumber(tg.getText(ll_row, tgCols.perc)) == 4){
                        	screenObjects.getScreenObject("turnover_4").setValue( netTotal);
                        	screenObjects.getScreenObject("vat_amt_4").setValue(tg.getText(ll_row, tgCols.taxamount));
                        }else{
                            screenObjects.getScreenObject("turnover_12_5").setValue( netTotal);
                        	screenObjects.getScreenObject("vat_amt_12_5").setValue(tg.getText(ll_row, tgCols.taxamount));
                        }
                    }else{
                        screenObjects.getScreenObject("vat_amt").setValue("0");
                    }
                }
            if(s> 0){
                if(tg.getText(1,tgCols.col_type) == "E"){
                    screenObjects.getScreenObject("cenvatded").setValue(roundOff(toNumber(tg.getText(1, tgCols.taxamount)) / 2,2));
                    screenObjects.getScreenObject("educess").setValue(roundOff(toNumber(tg.getText(2, tgCols.taxamount)) / 2,2));
                    screenObjects.getScreenObject("heducess").setValue(roundOff(toNumber(tg.getText(3, tgCols.taxamount)) / 2,2));
				}		   
			}
            screenObjects.getScreenObject("detamount").setValue(roundOff(billAmount,2));            
            screenObjects.getScreenObject("billamount").setValue(roundOff(billAmount,2));
			$("#netAmt").text(roundOff(billAmount,2));
		}
		function findRowNumber(gridName,columnName,uptoRow,searchTxt){
			var tg=screenObjects.getScreenObject(gridName);
			var tgCols=tg.getCols();
			var s=tg.getSize();
			if(uptoRow!=0){
				s=uptoRow;
			}
			for(var k=0;k<s;k++){
				if(t.getText(k,tgCols[columnName])==searchTxt){
					return k;
				}
			}
			return -1;
		}
		function calculateAmount(row){
			var t=screenObjects.getScreenObject("purgrid_data");
			var bdisc=screenObjects.getScreenObject("billdiscperc");
			var cols=t.getCols();	
			var baseqty=0;
			baseqty=toNumber(t.getText(row,cols.billqty));
			var amt=roundOff(toNumber(t.getText(row,cols.rate))*baseqty,2);
			var tax=0;
			var netAmt=0;
			taxableamt=amt;
			var disc=taxableamt*toNumber(bdisc.getValue())/100;
			taxableamt-=disc;	
			tax=taxableamt*toNumber(t.getText(row,cols.taxperc))/100;
			netAmt=roundOff(taxableamt+tax,2);
			t.setText(row,cols.taxamt,roundOff(tax,2));
			t.setText(row,cols.discount,roundOff(disc,2));
			t.setText(row,cols.camount,amt);
			t.setText(row,cols.amount,roundOff(amt,2));
			t.setText(row,cols.cnetamt,roundOff(taxableamt,2));
			t.setText(row,cols.netamount,roundOff(taxableamt,2));
		}
		function onTaxCodeChange(id,me){
			var taxcode=screenObjects.getScreenObject("taxcode");
			var taxgrid=screenObjects.getScreenObject("taxgrid_data");
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET","/tekknow/service/ajax","ic=0&ro=true&id=taxdetail&taxcode="+taxcode.getValue());
			taxgrid.clear();
			taxgrid.setObjectData(v.data);
			return true;			
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				savePurchase();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadBillData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			purchase.loadObjectData(v);
			calculateTotal();			
		  	hideLoader();
		}
		function cancelGIRDlg(){
			$('#dlggir').dialog('close');
			$('#dlggir').dialog('destroy');
		}
		function showGIRDialog(){
			$('#dlggir').dialog({autoOpen:false,modal:true,minHeight:600,minWidth:700,position:'center'});
			$('#dlggir').dialog('open');
	    }
	    function selectGIR(){
	   		var g=screenObjects.getScreenObject("girs_data");
			var gCols=g.getCols();
			var s=g.getSize();
			var selectedGirs="";
			var comma="";
			for(var k=0;k<s;k++){
				if(g.getText(k,gCols["gircode"])!=""){				
					selectedGirs=selectedGirs+comma+g.getText(k,gCols["gircode"]);
				}
				comma=",";
			}
			if(selectedGirs!=""){
				var purgrid=screenObjects.getScreenObject("purgrid_data");
				var l=new FlexUI.Ajax();
				var v=l.callAjax("GET","/tekknow/service/ajax","ic=0&ro=true&id=girdata&gircodes="+selectedGirs);
				purgrid.clear();
				purgrid.setObjectData(v.data);
				screenObjects.getScreenObject("isgir").setValue("Y");
			}else{
				purgrid.clear();
				screenObjects.getScreenObject("isgir").setValue("N");
			} 	
			cancelGIRDlg();   
	    }
	</script>
</body>
</html>