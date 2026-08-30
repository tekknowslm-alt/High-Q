<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Warping Receipt</title>
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
			Warping Receipt
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
					<div class="col-md-4"><label>Party</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>
			</div>
			<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Order No.</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="order_no"></div>
				</div>
	</div>
			
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Set No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="set_no"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Count</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="count_name"></div>
				</div>
				</div>
			</div>
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Mill</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="mill_name"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Warp Breaks</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="total_warp_breaks"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Avg.Warp Breaks per Million Mts.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="avg_warp_breaks_mm"></div>
				</div>
				</div>
					<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Baby Cones</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="baby_cones">
					</div>
					<div class="col-md-4">
						<button id="warpbreaks" class="btn priBut" onclick="openBreaksDialog()">Baby Cones</button>
					</div>
				</div>		
			</div>
		 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="warpingrecegrid" style="height:350px">
			<div class="col-md-12 col-sm-12 mpZero" id="babyconegrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveWarpingReceipt()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editWarpingReceipt()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="showParetoAnalysis()">Pie-Chart</div>
				<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelWarpingReceipt()">Cancel</div>	</span>
				</span>
			</div>
				<div style="display:none">
		<div id='breaksdlg' class='pop_lov_box'>
			<div id='breakstitle' class='pop_lov_hed_box'>
			<div class='pop_lov_clos'>
				<a href='#'>
					<span class='fa fa-times-circle'>
					</span>
				</a>
			</div>
			<div class='pop_lov_hed_txt'>Baby Cone Details</div>
			</div>
			<div id='breaks' class='pop_lov_inp_box'>
				<div class="col-md-12 col-sm-12 mpZero">
					<div class="col-md-12 col-sm-12 mpZero" id="babyconegrid" style="height:350px">
					
					
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
  	
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
 	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",validation:"ClearColumnsLedgerCode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
    
  	{name:"order_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},
  	{name:"order_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"taxname",lovOptions:{url:"/tekknow/service/ajax",ajax:"sizingsetorderlistr",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"order_no",tt:false,id:"order_no"},
  	{tgt:"order_no",tt:true,id:"order_no"},
  	{tgt:"order_code",tt:false,id:"order_code"},
  	{tgt:"no_of_back_beam",tt:false,id:"no_of_back_beam"},
  	{tgt:"total_ends",tt:false,id:"total_ends"},
  	{tgt:"set_length",tt:false,id:"set_length"},
 ]},validation:"SetNoofBeams"},
	
	{name:"warping_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  
  	{name:"set_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"set_no_list",scrollEnabled:true,searchFromList:false,dsi:0,
  	params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"set_no",tt:false,id:"set_no"},
  	{tgt:"set_no",tt:true,id:"set_no"},
  	{tgt:"warping_code",tt:false,id:"warping_code"},
    {tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"},
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"},
  		]}},
    {name:"count_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
 	{name:"count_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"count_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"count_name",tt:true,id:"count_name"},
  	{tgt:"count_code",tt:false,id:"count_code"}
    	]}},
    	
    {name:"mill_code",inputType:0,type:"INT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"count_code"},  	
  	{name:"mill_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"count_name",lovOptions:{url:"/tekknow/service/ajax",ajax:"mill_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"mill_name",tt:true,id:"mill_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"}
  		]}},
 	{name:"total_warp_breaks",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"avg_warp_breaks_mm",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"set_length",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"cone_weight",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"no_of_cones",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"dis_between_flange",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"no_of_sized_beam",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"sized_beam_reqd_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"baby_cones",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"warpingrecegrid",title:"",contentType:"Table",tableProperties:{rowObject:true,enableAddRow:false,serialNumberColumn:"sno",rowEmptyCheckColumn:"ends",optional:false,enableColumnTotal:true,columns:[
  	{order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "ends", name: "Ends", field: "ends",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"left","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"2",id: "beam_no", name: "Beam No.", field: "beam_no",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"3",id: "mtrs", name: "Mtrs", field: "mtrs",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,onchange:"onMtrsChange"},
  	{order:"4",id: "gross_weight", name: "Gross Weight", field: "gross_weight",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"5",id: "tare_weight", name: "Tare Weight", field: "tare_weight",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"6",id: "net_weight", name: "Net. Weight", field: "net_weight",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"7",id: "tot_breaks", name: "Breaks", field: "tot_breaks",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"8",id: "thin_place", name: "Thin Place", field: "thin_place",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"9",id: "cut_ends", name: "Cut Ends", field: "cut_ends",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"10",id: "entaglement", name: "Entaglement", field: "entaglement",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"11",id: "foreign_fibre", name: "Foreign Fibre", field: "foreign_fibre",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"12",id: "hand_waste", name: "Hand Waste", field: "hand_waste",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"13",id: "thick_place", name: "Thick Place", field: "thick_place",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"14",id: "splicing", name: "Splicing", field: "splicing",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"15",id: "slough_off", name: "Slough Off", field: "slough_off",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"16",id: "adas_cone", name: "Adas Cone", field: "adas_cone",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"17",id: "back_winding", name: "Back Winding", field: "back_winding",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"18",id: "damage_cone", name: "Damage Done", field: "damage_cone",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"19",id: "tip_damage", name: "Tip Damage", field: "tip_damage",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"20",id: "run_out", name: "Runout", field: "run_out",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"21",id: "others", name: "Others", field: "others",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:100,align:"right","chkTag":false,onchange:"onRateQuantityChange"},
    ]
    }},
  	{name:"babyconegrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"bag_no",optional:true,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "bag_no", name: "Bag No.", field: "bag_no",defaultValue:"0",align:"right","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false},
  	{order:"2",id: "no_of_cones", name: "No. of Cones", field: "no_of_cones",defaultValue:"0",align:"right","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"3",id: "gross_weight", name: "Gross Weight", field: "gross_weight",defaultValue:"0",align:"right","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"4",id: "net_weight", name: "Nett. Weight", field: "net_weight",defaultValue:"0",align:"right","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
    ]
    }}]};
    //ends,beam_no,mtrs,gross_weight,tare_weight,net_weight
    var gir=new FlexUI.Screen("warping",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            screenObjects.getScreenObject("warpingrecegrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("warpingrecegrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveWarpingReceipt(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        		var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		} 
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
        function ClearColumnsLedgerCode(id,me){
        if(!gir.getSaveInProgress()){
     	screenObjects.getScreenObject("order_no").setValue("");
		screenObjects.getScreenObject("order_no").setTag("");
		screenObjects.getScreenObject("set_no").setValue("");
		screenObjects.getScreenObject("set_no").setTag("");
		screenObjects.getScreenObject("count_name").setValue("");
		screenObjects.getScreenObject("count_name").setTag("");
	    screenObjects.getScreenObject("count_code").setValue(0);
		screenObjects.getScreenObject("count_code").setTag("");
		screenObjects.getScreenObject("mill_name").setValue("");
		screenObjects.getScreenObject("mill_name").setTag("");
		screenObjects.getScreenObject("mill_code").setValue(0);
		screenObjects.getScreenObject("mill_code").setTag("");		
		}
	 	return true;   
		}
		 function ClearColumnsOrderCode(id,me){
   		if(!gir.getSaveInProgress()){
	     	screenObjects.getScreenObject("set_no").setValue("");
			screenObjects.getScreenObject("set_no").setTag("");
			screenObjects.getScreenObject("count_name").setValue("");
			screenObjects.getScreenObject("count_name").setTag("");
		    screenObjects.getScreenObject("count_code").setValue(0);
			screenObjects.getScreenObject("count_code").setTag("");
			screenObjects.getScreenObject("mill_name").setValue("");
			screenObjects.getScreenObject("mill_name").setTag("");
			screenObjects.getScreenObject("mill_code").setValue(0);
			screenObjects.getScreenObject("mill_code").setTag("");	 
		}
	 	return true;  
		}
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
		 function onMtrsChange(id,me){
	 		var t=me.getParent();
			var ll_current_row=0;
			ll_current_row=t.getCurrentRow();
			var t=screenObjects.getScreenObject("warpingrecegrid_data");
		 	var cols=t.getCols();
		 	var s=t.getSize();
		 	for(var i=ll_current_row+1;i<s;i++)
			{
					t.setText(i,cols.mtrs,toNumber(t.getText(ll_current_row,cols.mtrs)));
			}		 
		 	//calculateTotal();
			return true;
		
		}
		 function OnSetNoChange(id,me){
			alert("Hello");
			/*var t=me.getParent();
	  		var s=new FlexUI.Ajax();		   
			var r=s.callAjax("GET","/tekknow/service/ajax","&ic=0&ro=true&id=sizingbeams&warping_code="+screenObjects.getScreenObject("warping_code").getValue());
			var dg=screenObjects.getScreenObject("sizingdcgrid_data");
			dg.clear();
			dg.setObjectData(r.data);*/
			return true;
		}
		function calculateTotal(){
		 	var total=0,total_breaks=0;
		 	var total_cones=0,total_ends=0,total_mtrs=0 
		 	var t=screenObjects.getScreenObject("warpingrecegrid_data");
		 	var avg_warp_breaks_mm=0.00;
		 	var cols=t.getCols();
		 	var s=t.getSize();
		//	var net_amount=0;
			 for(var i=0;i<s;i++){
				t.setText(i,cols.net_weight,toNumber(t.getText(i,cols.gross_weight))- toNumber(t.getText(i,cols.tare_weight)));
			}
			for(var i=0;i<s;i++){
				total_breaks=total_breaks+toNumber(t.getText(i,cols.tot_breaks));
			}
			for(var i=0;i<s;i++){
				total_ends=total_ends+toNumber(t.getText(i,cols.ends));
			}
			for(var i=0;i<s;i++){
				total_mtrs=toNumber(t.getText(i,cols.mtrs));
			}
			avg_warp_breaks_mm=(total_breaks/total_ends/total_mtrs*1000000);
			screenObjects.getScreenObject("total_warp_breaks").setValue(total_breaks);
			screenObjects.getScreenObject("avg_warp_breaks_mm").setValue(avg_warp_breaks_mm);
			
		 	var t1=screenObjects.getScreenObject("babyconegrid_data");
	 
		 	var cols=t1.getCols();
		 	var s=t1.getSize();
	 		var total_baby_cones=0;
			 for(var i=0;i<s;i++){
				 total_baby_cones=total_baby_cones+toNumber(t1.getText(i,cols.no_of_cones)); 
			}
			screenObjects.getScreenObject("baby_cones").setValue(total_baby_cones);			
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveWarpingReceipt();
			}
		}
		function tableRowDelete(e,args){
			//calculateTotal();
		}		
		function loadWarpingData(url,code,did){
		  	showLoader();
			var l=new FlexUI.Ajax();
			var v=l.callAjax("GET",url,"");
			gir.loadObjectData(v);
			//calculateTotal();			
		  	hideLoader();
		}
			function onEditClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600051","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function editWarpingReceipt(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"warpingrecelist",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
		function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600051","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelWarpingReceipt(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"warpingrecelist",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
				function SetNoofBeams(id,me){
		if(!gir.getSaveInProgress()){
			var noOfBeams=screenObjects.getScreenObject("no_of_back_beam").getValue();
			var calcEnds=screenObjects.getScreenObject("total_ends").getValue()/noOfBeams;
			var setlength=screenObjects.getScreenObject("set_length").getValue();
			
			var rowData={ends:calcEnds,beam_no:"",mtrs:setlength,gross_weight:"",tare_weight:"",net_weight:""};
			var rows=[];
			ClearColumnsOrderCode();
			//gir.loadObjectData(v);
			var t=screenObjects.getScreenObject("warpingrecegrid_data");
			t.clear();
			for(var i=0;i<noOfBeams;i++){
				var newRow = jQuery.extend(true, {}, rowData);
				newRow.ends=calcEnds;
				rows.push(newRow);
			}
			t.setObjectData(rows);
			}
			return true;
		}
			function cancelBreaksDlg(){
			$('#breaksdlg').dialog('close');
			$('#breaksdlg').dialog('destroy');
		}
		function openBreaksDialog(){
			$('#breaksdlg').dialog({autoOpen:false,modal:true,height:'auto',minHeight:500,minWidth:900,position:'center'});
			$('#breaksdlg').dialog('open');								
		}
		function showParetoAnalysis(){
            window.open("/tekknow/WarpBreaksChart.do?setno="+screenObjects.getScreenObject("set_no").getValue()+",avgwarpbreakspermm="+screenObjects.getScreenObject("avg_warp_breaks_mm").getValue(),"_blank");    
        }
	</script>
</body>
</html>