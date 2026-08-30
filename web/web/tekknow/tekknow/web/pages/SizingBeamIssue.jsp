<!DOCTYPx`E HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>/Sizing Beam Issue</title>
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
			Sizing Beam Issue
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
					<div class="col-md-4"><label>Issue No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="issue_no"></div>
				</div>
				</div>
			</div>
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Party</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Set No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="set_no"></div>
				</div>
				</div>
			</div>
		</div>
			
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Remarks</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>	
			</div>
				<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>BeamNos</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="beamnos"></div>
				</div>
				</div>	
			</div>
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="sizingbeamissuegrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveSizingBeamIssue()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editSizingBeamIssue()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelSizingBeamIssue()">Cancel</div>	</span>
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
	{name:"issue_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",validation:"ClearColumnsLedgerCode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
   {name:"warping_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	 {name:"set_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",validation:"SetWeightRow",lovOptions:{url:"/tekknow/service/ajax",ajax:"set_no_list",scrollEnabled:true,searchFromList:false,dsi:0,
  	params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"set_no",tt:false,id:"set_no"},
  	{tgt:"set_no",tt:true,id:"set_no"},
  	{tgt:"warping_code",tt:false,id:"warping_code"}    
 		]}},	
 	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"beamnos",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mode"},
  	{name:"btn ",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},	
  	{name:"sizingbeamissuegrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"rece_det_code",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "rece_det_code", name: "item", field: "rece_det_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	{order:"2",id: "beam_no", name: "Beam no.", field: "beam_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,validation:"BeamNoChange" ,lovOptions:{url:"/tekknow/service/ajax",ajax:"emptybeamslistr",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"ledger_code",src:"ledger_code",tt:false},{n:"beamnos",src:"beamnos",tt:false}],results:[
  	{tgt:"sizingbeamissuegrid_data",tt:false,row:"cr",id:"rece_det_code",col:"rece_det_code"},
  	{tgt:"sizingbeamissuegrid_data",tt:false,row:"cr",id:"beam_no",col:"beam_no"},
  	{tgt:"sizingbeamissuegrid_data",tt:true,row:"cr",id:"beam_no",col:"beam_no"},
  	{tgt:"sizingbeamissuegrid_data",tt:false,row:"cr",id:"vendor_name",col:"vendor_name"},
  		]}},
  	{order:"3",id: "vendor_name", name: "Vendor", field: "vendor_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":true,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  		]
    }}]};
    var gir=new FlexUI.Screen("gir",sProps);
    //ajax columns
	var showTender=true;

	var l=new FlexUI.Ajax();
	$(document).ready(function () {
            screenObjects.getScreenObject("sizingbeamissuegrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("sizingbeamissuegrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
            loadMixingNo();
        });
        function saveSizingBeamIssue(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		} 
    			gir.setScreenCode("600052");
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
        	loadMixingNo();
			   }
		   function BeamNoChange()
		   {
		   	var t=screenObjects.getScreenObject("sizingbeamissuegrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
			var ls_beam_nos="0";
			for(var i=0;i<s;i++){
			ls_beam_nos=ls_beam_nos+",";
			ls_beam_nos=ls_beam_nos + t.getText(i,cols.beam_no);
			}
				screenObjects.getScreenObject("beamnos").setValue(ls_beam_nos);
		   return true;
		   }
		  function loadMixingNo(){
			  var a=new FlexUI.Ajax();
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=beam_issue_no&ro=false&ic=0","");
 	 	  if(r!=null){
   	 			if(r.data){
    				screenObjects.getScreenObject("issue_no").setValue(r.data[0][0]);	
    						}
					    }	
						screenObjects.getScreenObject("beamnos").setValue("0");
		
					    return true;
			  }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			//calculateTotal();
			screenObjects.getScreenObject("beamnos").setValue("1234");
			return true;
		}
		function calculateTotal(){
		
			var total=0;
			var total_cones=0;
			var t=screenObjects.getScreenObject("sizingbeamissuegrid_data");
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
				saveSizingBeamIssue();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}
		function loadSizingBeamIssueData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();	
		  	screenObjects.getScreenObject("beamnos").setValue(" ");
		}
		function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
		    var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600052","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r); 
			//calculateTotal();
			hideLoader();
		}
		
		function editSizingBeamIssue(id,me){
		 	gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"sizingbeamissuelist",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600052","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelSizingBeamIssue(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"sizingbeamissuelist",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
	</script>
</body>
</html>