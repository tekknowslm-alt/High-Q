<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Outward</title>
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
			Outward
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
					<div class="col-md-3"><label>Date</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="outward_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>Outward No.</label></div>
					<div class="col-md-9"><input type="text" class="form-control" id="outward_no"></div>
				</div>
				</div>	
			</div>
	</div>
			
			<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
		 	 <div class="col-md-12 col-sm-12 mpZero" id="outwardgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveRewindingIssue()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editRewindingIssue()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelRewindingIssue()">Delete</div>	
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
  	{name:"outward_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	{name:"outward_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername",font:{weight:"600",size:"14px",style:"italic",color:"#424242"},background:"#ffffff"},
  	 
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"outwardgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"product_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "product_code", name: "Barcode", field: "product_code",defaultValue:"0","inputType":0,"type":"int","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"left","chkTag":false,onchange:"onProductCodeChange"},
    {order:"2",id: "prod_code", name: "Code", field: "prod_code",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:150,align:"left","chkTag":false,onchange:"onRateQuantityChange"},
 	{order:"3",id: "product_name", name: "Product Name", field: "product_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:300,align:"left","chkTag":false,onchange:"onRateQuantityChange"},
    {order:"4",id: "qty", name: "Quantity", field: "qty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:125,"chkTag":false,align:"right",onchange:"onRateQuantityChange"},
    {order:"5",id: "mtrs", name: "Mtrs", field: "mtrs",defaultValue:"0","inputType":0,"type":"DECI","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:125,"chkTag":false,align:"right",onchange:"onRateQuantityChange"},
    ]
    }}]};
    var gir=new FlexUI.Screen("outward",sProps);	
	//ajax columns
	
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("outwardgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("outwardgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
      loadoutwardNo();
      
        });
        
        function saveRewindingIssue(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
        	var cnt;
			var a=new FlexUI.Ajax();
	       	var r=a.callAjax("GET","/tekknow/service/ajax?id=fincheck&ro=false&ic=0&tdate="+screenObjects.getScreenObject("outward_date").getValue());	    
	       	if(r!=null){
	   	 			if(r.data){
	   	 				cnt=r.data[0][0];	
									if(cnt==0)
										{
										alert("Please Check Finance Period...");
										return;
										}
	    						}
						    
				  }
    		var code=screenObjects.getScreenObject("code").getValue();
    		if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
        	}
        	else
        		{
        		var txt;
				if(gir.getOperation()=="MOD")
				{
				txt="Confirm to Modify";		
				}
				else
				{
				txt="Confirm to Delete";
				}
        		var r = confirm(txt);
        		if (r != true) {
        		  return;        		  
        		}         		
        		}
    		//int response;
 
  		//	response = JOptionPane.showConfirmDialog(null, "Should i delete all files?");
    		
    		gir.setScreenCode("600051");
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
                 function loadoutwardNo()
                 {
					  var a=new FlexUI.Ajax();
					  var r=a.callAjax("GET","/tekknow/service/ajax?id=outward_no&ro=false&ic=0");
 	 				 if(r!=null){
 	 						if(r.data){
   	 							screenObjects.getScreenObject("outward_no").setValue(r.data[0][0]);	
    									}
							    }	
				  }
        
        function onGirTypeChange(id,me){
        	//var gt=screenObjects.getScreenObject("girtype").getValue();
        	//screenObjects.getScreenObject("girprefix").setValue("H"+gt);
        	return true;
        }
 				function onProductCodeChange(id,me){
			    var a=new FlexUI.Ajax();
           		var productcode;
             		var t=screenObjects.getScreenObject("outwardgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
			 	if(t.getCurrentRow()==i )
			  {
				  productcode=t.getText(i,cols.product_code);
				 var r=a.callAjax("GET","/tekknow/service/ajax?id=barcodesearch&ro=false&ic=0&productcode="+productcode);
			if(r!=null){
 				if(r.data){		 
					t.setText(i,cols.prod_code,r.data[0][0]);
					t.setText(i,cols.product_name,r.data[0][1]);
				}
			  }
			}	
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
        loadoutwardNo();
        }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
		function calculateTotal(){
		/*	var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("outwardgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			for(var i=0;i<s;i++){
				//total_cones=toNumber(t.getText(i,cols.bags))* toNumber(t.getText(i,cols.cones_bag));
				//t.setText(i, cols.cones,total_cones);
		    	t.setText(i,cols.kgs,toNumber(t.getText(i,cols.cones))*toNumber(t.getText(i,cols.cone_weight)));
			}
		*/}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveRewindingIssue();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadRewindingIssue(url,code,did){
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600051","code="+args.result[2]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			calculateTotal();
			hideLoader();
		}
		
		function editRewindingIssue(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"outward_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
			}
		function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600051","code="+args.result[2]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			calculateTotal();
			hideLoader();
		}
		function cancelRewindingIssue(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"outward_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	</script>
</body>
</html>