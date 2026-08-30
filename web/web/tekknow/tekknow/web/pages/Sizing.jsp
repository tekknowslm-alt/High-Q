<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Sizing</title>
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
			Sizing
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
					<div class="col-md-6"><input type="text" class="form-control" id="sizing_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Party</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="ledger_name"></div>
				</div>
				</div>
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Set No.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="set_no"></div>
				</div>
				</div>
			</div>
	
	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>PL No.</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="pl_no"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Count</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="count_name"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Ends</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="ends"></div>
				</div>
				</div>
	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Mill</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="mill_name"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Avg.Set Pickup</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="avg_set_pickup"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No.of Cones Taken</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="no_of_cones_taken"></div>
				</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Weight per Cone</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="weight_cone"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Beam Width</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="beam_width"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Lot No.</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="lot_no"></div>
				</div>
				</div>
			</div>
	<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Beam Count</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="beam_count"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Yarn Taken</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="yarn_taken"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Warp Net. Wt.</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="warp_net_weight"></div>
				</div>
				</div>
			</div>
	<div class="col-md-12 col-sm-12 mpZero">
				 
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="total"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Excess/Shortage</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="shortage"></div>
				</div>
				</div>
			</div>
	<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Yarn Received</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="yarn_received"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Balance Yarn</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="balance_yarn"></div>
				</div>
				</div>
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Warp Breaks </label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="total_warp_breaks"></div>
				</div>
				</div>
			</div>
	<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Avg.Warp Breaks per MM Cones</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="avg_warp_breaks_per_mm"></div>
				</div>
				</div>	
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Remarks</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="remarks"></div>
				</div>
				</div>
		</div>
	 <div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero" id="sizingdetgrid" style="height:350px">
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
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveSizing()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editSizing()">Edit</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="cancelSizing()">Cancel</div>	
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="showSetReport()">Set Report</div>
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
    		<div style="display:none">
		<div id='breaksdlg' class='pop_lov_box'>
			<div id='breakstitle' class='pop_lov_hed_box'>
			<div class='pop_lov_clos'>
				<a href='#'>
					<span class='fa fa-times-circle'>
					</span>
				</a>
			</div>
			<div class='pop_lov_hed_txt'>Breaks</div>
			</div>
			<div id='breaks' class='pop_lov_inp_box'>
				<div class="col-md-12 col-sm-12 mpZero">
					<div class="col-md-12 col-sm-12 mpZero" id="babyconegrid" style="height:350px">
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
				<div id="actButton" class="col-md-12 text-right">
                	<button id="btnSave" class="btn btn-primary priBut" type="button" onclick="cancelBreaksDlg()">Save</button>
	                <button id="btnClear" class="btn btn-default" type="button" onclick="cancelBreaksDlg()">Cancel</button>
            	</div>							
			</div>
		</div>
	</div>	
    	
	<script>
    var sProps={js:"",screen:[
    {name:"group1",predesigned:true,contentType:"Fields",
    fields:[{name:"code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"girtype"},
  	{name:"sizing_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
	{name:"count_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"mill_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"count_name",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
  	{name:"mill_name",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"suppliername"},
    {name:"warping_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},  	
  	{name:"set_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"set_no_list",scrollEnabled:true,searchFromList:false,dsi:0,
  	params:[{n:"ledger_code",src:"ledger_code",ft:false}],results:[
  	{tgt:"set_no",tt:false,id:"set_no"},
  	{tgt:"set_no",tt:true,id:"set_no"},
  	{tgt:"warping_code",tt:false,id:"warping_code"},
  	{tgt:"count_code",tt:false,id:"count_code"},
  	{tgt:"count_name",tt:false,id:"count_name"},
  	{tgt:"mill_code",tt:false,id:"mill_code"},
  	{tgt:"mill_name",tt:false,id:"mill_name"},
  	{tgt:"ends",tt:false,id:"total_ends"},
  	{tgt:"pl_no",tt:false,id:"order_no"},
  	{tgt:"weight_cone",tt:false,id:"cone_weight"},
  	{tgt:"no_of_cones_taken",tt:false,id:"no_of_cones"},
  	{tgt:"warp_weight",tt:false,id:"warp_weight"},
  	{tgt:"warp_net_weight",tt:false,id:"warp_weight"},
  	{tgt:"warp_ends",tt:false,id:"warp_ends"},
  	{tgt:"warp_mtrs",tt:false,id:"warp_mtrs"},  
  	{tgt:"no_of_sized_beam",tt:false,id:"no_of_sized_beam"},  
  	{tgt:"beam_width",tt:false,id:"dis_between_flange"},  
  	{tgt:"yarn_taken",tt:false,id:"issued_kgs"}, 
  	{tgt:"yarn_received",tt:false,id:"yarn_stock"}, 
  	 
  		]},validation:"SetNoofBeams"},
    {name:"pl_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	
	{name:"ends",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	
    {name:"no_of_sized_beam",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"warp_weight",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"warp_ends",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"warp_mtrs",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
    {name:"avg_set_pickup",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"no_of_cones_taken",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"weight_cone",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"beam_width",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"lot_no",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"beam_count",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"yarn_taken",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"warp_net_weight",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"baby_cones",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"total",onchange:"onRateQuantityChange"},
 	{name:"total",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"shortage",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"yarn_received",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"balance_yarn",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"total_warp_breaks",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"avg_warp_breaks_per_mm",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},
 	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"chkTag":false,nf:"mode"},

  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"sizingdetgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"beam_no",optional:false,enableColumnTotal:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "issue_det_code", name: "item", field: "issue_det_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
  	{order:"2",id: "beam_no", name: "Beam No.", field: "beam_no",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"issuedbeamlist",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"sizingdetgrid_data",tt:false,row:"cr",id:"issue_det_code",col:"issue_det_code"},
  	{tgt:"sizingdetgrid_data",tt:false,row:"cr",id:"beam_no",col:"beam_no"},
  	{tgt:"sizingdetgrid_data",tt:true,row:"cr",id:"beam_no",col:"beam_no"},
  	{tgt:"sizingdetgrid_data",tt:false,row:"cr",id:"vendor_name",col:"vendor_name"},
  		]}},
  	{order:"3",id: "vendor_name", name: "Vendor", field: "vendor_name",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":true,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"4",id: "mtrs", name: "Mtrs", field: "mtrs",defaultValue:"0",align:"right","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":true,width:100,"chkTag":false,cTotal:true,onchange:"onRateQuantityChange"},
  	{order:"5",id: "gross_weight", name: "Gross Weight", field: "gross_weight",defaultValue:"0",align:"right","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,cTotal:true,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"6",id: "tare_weight", name: "Tare Weight", field: "tare_weight",defaultValue:"0",align:"right","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,cTotal:true,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"},
  	{order:"7",id: "net_weight", name: "Net Weight", field: "net_weight",defaultValue:"0",align:"right","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,cTotal:true,"mandatory":true,width:100,"chkTag":false,onchange:"onRateQuantityChange"}
    ]
    }},
  	{name:"babyconegrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"bag_no",optional:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,"chkTag":false,width:50,sno:true},
  	{order:"1",id: "bag_no", name: "Bag No.", field: "bag_no",defaultValue:"0",align:"right","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false},
  	{order:"2",id: "no_of_cones", name: "No. of Cones", field: "no_of_cones",defaultValue:"0",align:"right","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false},
  	{order:"3",id: "gross_weight", name: "Gross Weight", field: "gross_weight",defaultValue:"0",align:"right","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false},
  	{order:"4",id: "net_weight", name: "Nett. Weight", field: "net_weight",defaultValue:"0",align:"right","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":3,"visible":true,"readOnly":false,"mandatory":false,width:100,"chkTag":false},
    ]
    }}]};
    var gir=new FlexUI.Screen("sizing",sProps);
    
    //ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
	$(document).ready(function () {
            screenObjects.getScreenObject("sizingdetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            screenObjects.getScreenObject("sizingdetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
        });
        function saveSizing(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    		var code=screenObjects.getScreenObject("code").getValue();
        	if(code=="" || code=="0"){ 
    			gir.setOperation("ADD");
    		} 
    		gir.setScreenCode("600038");
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
			var t=screenObjects.getScreenObject("sizingdetgrid_data");
			var cols=t.getCols();
			var s=t.getSize();
			var net_amount=0;
		    var total_weight=0;
		    for(var i=0;i<s;i++){
				t.setText(i,cols.net_weight,toNumber(t.getText(i,cols.gross_weight))- toNumber(t.getText(i,cols.tare_weight)));
			total_weight+=toNumber(t.getText(i,cols.net_weight));
			}
			screenObjects.getScreenObject("avg_set_pickup").setValue((total_weight-screenObjects.getScreenObject("warp_weight").getValue())*100/screenObjects.getScreenObject("warp_weight").getValue());
			screenObjects.getScreenObject("beam_count").setValue((screenObjects.getScreenObject("warp_ends").getValue()*screenObjects.getScreenObject("warp_mtrs").getValue())/(1693.34*screenObjects.getScreenObject("warp_weight").getValue()));
		    screenObjects.getScreenObject("total").setValue(toNumber(screenObjects.getScreenObject("warp_net_weight").getValue())+toNumber(screenObjects.getScreenObject("baby_cones").getValue()));
		    screenObjects.getScreenObject("shortage").setValue(toNumber(screenObjects.getScreenObject("total").getValue())-toNumber(screenObjects.getScreenObject("yarn_taken").getValue()));
		    screenObjects.getScreenObject("balance_yarn").setValue(toNumber(screenObjects.getScreenObject("yarn_received").getValue())-toNumber(screenObjects.getScreenObject("yarn_taken").getValue()));
		
		return true;
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveSizing();
			}
		}
		function tableRowDelete(e,args){
			calculateTotal();
		}
		function loadSizingData(url,code,did){
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600038","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function editSizing(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"sizing_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
			 	function onCancelClose(e,args)
		{	
			//screenObjects.getScreenObject(gir.getInitialFocus()).focus();
			var a=new FlexUI.Ajax();
			showLoader();
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600038","code="+args.result[4]);
			clearInnerScreen();
			gir.setOperation("CAN");
			gir.loadObjectData(r);
			//calculateTotal();
			hideLoader();
		}
		function cancelSizing(id,me){
			gir.setOperation("CAN");	
			var l={url:"/tekknow/service/ajax",ajax:"sizing_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onCancelClose);
			lov.show();
			}	
			function SetNoofBeams(id,me){
		/*if(!gir.getSaveInProgress()){
			var noOfBeams=screenObjects.getScreenObject("no_of_sized_beam").getValue();
			var calcEnds=screenObjects.getScreenObject("total_ends").getValue()/noOfBeams;
			var setlength=screenObjects.getScreenObject("set_length").getValue()/noOfBeams;
			
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
			}*/
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
			function showSetReport(){
            window.open("/tekknow/service/invoice/sizingcontrol?setno="+screenObjects.getScreenObject("code").getValue(),"_blank");    
        }
	</script>
</body>
</html>