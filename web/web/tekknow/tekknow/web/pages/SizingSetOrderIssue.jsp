<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Sizing Set Order Issue</title>
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
			Sizing Set Order Issue
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
					<div class="col-md-4"><label>Order No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="set_order_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="set_order_date"></div>
				</div>
				</div>
			</div>
			<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Sizer</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
	</div>
			
		
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Order No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="order_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Article No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="article_no"></div>
				</div>
				</div>
			</div>
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Ends</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="total_ends"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Mill</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="mill_name"></div>
				</div>
				</div>
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
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
					<div class="col-md-4"><label>No.of Cones</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="no_of_cones"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Dist.Between Flange (in Cms)</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="dis_between_flange"></div>
					</div>
				</div>
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No.of Back Beam</label></div>/
					<div class="col-md-6"><input type="text" class="form-control" id="no_of_back_beam"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No. of creal</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="no_of_creal"></div>
				</div>
				</div>
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Set Length</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="set_length"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>N0.of Sized Beam</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="no_of_sized_beam"></div>
				</div>
				</div>
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Sized Beam Reqd. Date</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="sized_beam_reqd_date"></div>
				</div>
				</div>	
			</div>				
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="sizingsetorderissuedetgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveSizingSetOrderIssue()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editSizingSetOrderIssue()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelSizingSetOrderIssue()">Cancel</div>
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
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"set_order_no"},
    {name:"set_order_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"set_order_date"},
  	{name:"set_order_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"ledger_name"},
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ledger_name"},
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"total_ends",lovOptions:{url:"/tekknow/service/ajax",ajax:"exportcustomers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
 ]}},
  	{name:"order_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ledger_name"},
  	{name:"order_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"total_ends",lovOptions:{url:"/tekknow/service/ajax",ajax:"fabric_order_list",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"order_no",tt:false,id:"order_no"},
  	{tgt:"order_no",tt:true,id:"order_no"},
  	{tgt:"order_code",tt:false,id:"order_code"}
 ]}},
  	{name:"article_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"ledger_name"},
  	{name:"article_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"total_ends",lovOptions:{url:"/tekknow/service/ajax",ajax:"article_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"article_no",tt:false,id:"article_no"},
  	{tgt:"article_no",tt:true,id:"article_no"},
  	{tgt:"article_code",tt:false,id:"article_code"}
 ]}},
  	{name:"total_ends",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mill_name"},
 	
 	{name:"mill_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"count_code"},  	
  	{name:"mill_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"count_name",lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"}
  		]}},
  		
 	{name:"count_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"count_name"},  	
 	{name:"count_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"cone_weight",lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"},
  	{tgt:"count_value",tt:false,id:"count_value"}
  		]}},
    	 	{name:"color_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"count_name"},  	
 	{name:"color_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"cone_weight",lovOptions:{url:"/tekknow/service/ajax",ajax:"yarn_color_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"color_name",tt:false,id:"color_name"},
  	{tgt:"color_name",tt:true,id:"color_name"},
  	{tgt:"color_code",tt:false,id:"color_code"}
    	]}},
	{name:"count_value",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,onchange:"OnConeWeightBackBeamchange",nf:"no_of_cones"},
	{name:"cone_weight",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,onchange:"OnConeWeightBackBeamchange",nf:"no_of_cones"},
 	{name:"no_of_cones",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"dis_between_flange"},
 	{name:"dis_between_flange",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"no_of_back_beam"},
	{name:"no_of_back_beam",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,onchange:"OnConeWeightBackBeamchange",nf:"no_of_back_beam"},
  	{name:"no_of_creal",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,onchange:"OnConeWeightBackBeamchange",nf:"no_of_back_beam"},
 	{name:"set_length",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"no_of_sized_beam"},
 	{name:"no_of_sized_beam",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"sized_beam_reqd_date"},
 	{name:"sized_beam_reqd_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"sizingsetorderissuedetgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"vendor_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,"chkTag":false,width:50,sno:true},
	{order:"1",id: "vendor_code", name: "vendor_code", field: "vendor_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "vendor_name", name: "Vendor", field: "vendor_name",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"vendor_listr",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"ledger_code",src:"ledger_code",tt:false}],results:[
  	{tgt:"sizingsetorderissuedetgrid_data",tt:false,row:"cr",id:"vendor_code",col:"vendor_code"},
  	{tgt:"sizingsetorderissuedetgrid_data",tt:false,row:"cr",id:"vendor_name",col:"vendor_name"},
  	{tgt:"sizingsetorderissuedetgrid_data",tt:true,row:"cr",id:"vendor_name",col:"vendor_name"}
  	]}},  
	{order:"3",id: "loom_type_code", name: "loom_type_code", field: "loom_type_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"4",id: "loom_type", name: "Loom Type", field: "loom_type",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"loom_type_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"sizingsetorderissuedetgrid_data",tt:false,row:"cr",id:"loom_type_code",col:"loom_type_code"},
  	{tgt:"sizingsetorderissuedetgrid_data",tt:false,row:"cr",id:"loom_type",col:"loom_type"},
  	{tgt:"sizingsetorderissuedetgrid_data",tt:true,row:"cr",id:"loom_type",col:"loom_type"}
  	]}},  
  	{order:"5",id: "width", name: "Width", field: "width",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"6",id: "metre", name: "Metre", field: "metre",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"7",id: "no_of_beams", name: "No.of Beams", field: "no_of_beams",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
    ]
    }}]};
    var gir=new FlexUI.Screen("sizingsetorder",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("sizingsetorderissuedetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("sizingsetorderissuedetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
       loadSetOrderNo();
        });
        function saveSizingSetOrderIssue(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
	    		var code=screenObjects.getScreenObject("code").getValue();
	        	if(code=="" || code=="0"){ 
	    			gir.setOperation("ADD");
	    		} 
    		gir.setScreenCode("600056");
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
        	loadSetOrderNo();
        }
          function loadSetOrderNo(){
			  var a=new FlexUI.Ajax();
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=set_order_issue_no&ro=false&ic=0","");
 	 	  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("set_order_no").setValue(r.data[0][0]);	
    						}
					    }	
			  }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			//calculateTotal();
			return true;
		}
		function OnConeWeightBackBeamchange(id,me){
			var t=me.getParent();
			var t=screenObjects.getScreenObject("set_length");
			screenObjects.getScreenObject("set_length").setValue((toNumber(screenObjects.getScreenObject("cone_weight").getValue())-0.030)*screenObjects.getScreenObject("count_value").getValue()*1693.34/toNumber(screenObjects.getScreenObject("no_of_back_beam").getValue())*screenObjects.getScreenObject("no_of_creal").getValue());
			
			//calculateTotal();
			return true;
		}
		function calculateTotal(){
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("sizingsetorderissuedetgrid_data");
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
				saveSizingSetOrder();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadSizingSetOrderData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
		function editSizingSetOrderIssue(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"sizingsetordiss_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();  
		}
		function onEditClose(e,args){	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600056","code="+args.result[3]);
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600056","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelSizingSetOrder(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"sizingsetordiss_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	</script>
</body>
</html>