<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Sizing Plan</title>
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
			Sizing Plan
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
					<div class="col-md-6"><input type="text" class="form-control" id="plan_date"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Plan No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="plan_no"></div>
				</div>
				</div>
			</div>		 
	</div>
			
		<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-8 col-sm-8 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-3"><label>PO No.</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="order_no"></div>
				</div>
				</div>	 
				<div  class="col-md-4 col-sm-4 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Article No.</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="article_no"></div>
				</div>
				</div>				
			</div>
			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Sizing Machine</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="sizing_machine1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="sizing_machine2"></div>
				</div>
				</div>
			</div>		 
		<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Count in Warp</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="no_of_count_warp1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="no_of_count_warp2"></div>
				</div>
				</div>
			</div>		 
		<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Creel Capacity</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>		
		<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Max Warp Beam Capacity</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cone Weight in Kgs</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Remanant Weight in Kgs</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Calculated Cone Length -Warp</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Section</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Plan Set Length</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Creel</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of cones/ Creel</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Beam</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Warp length/ Beam</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Option</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>DBF</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Plan Requaired</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Balance Set Length</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Cone Weight in Kgs</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Section</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of Creel</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Calculated Cone Length -Warp</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Plan Set Length</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>No of cones/ Creel</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Cone Rquired for Warp </label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Total Warp yarn Reqd.</label></div>
					<div class="col-md-6"><input type="text" class="form-control" id="creel_capacity1"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>       </label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="creel_capacity2"></div>
				</div>
				</div>
			</div>			
			<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
			 <div class="col-md-12 col-sm-12 mpZero" id="warpingdetgrid" style="height:350px">
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
			<div id="saveGrp" class="">
				<span id="actionbuttons">
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="clearInnerScreen()">Clear</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl saVbN" onclick="saveWarping()">Save</div>
					<div class="col-sm-2 col-md-2 col-lg-2 adCl" onclick="editWarping()">Edit</div>
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
  	{name:"plan_date",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"ledger_name"},
  	 {name:"plan_no",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"count_name"},
  	{name:"ledger_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"order_no"},  	
 	{name:"ledger_name",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"order_no",validation:"ClearColumnsLedgerCode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"ledger_name",tt:false,id:"ledger_name"},
  	{tgt:"ledger_name",tt:true,id:"ledger_name"},
  	{tgt:"ledger_code",tt:false,id:"ledger_code"}
    	]}},
 
	    {name:"article_code",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"mill_name"},  	
 	{name:"article_no",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"article_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"article_no",tt:false,id:"article_no"},
  	{tgt:"article_no",tt:true,id:"article_no"},
  	{tgt:"article_code",tt:false,id:"article_code"}
    	]}},  
    {name:"sizing_machine1",inputType:0,type:"VARCHAR",caption:"fsfsdfsdf",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",onchange:"onDataChange"},
    {name:"sizing_machine2",inputType:0,type:"VARCHAR",caption:"fsdfsdfd",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mode",onchange:"onDataChange"},
 
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]}]};
  	/*
  	,
  	{name:"warpingdetgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"ends",optional:true,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true}
    ]
    }}
    */
    var gir=new FlexUI.Screen("warping",sProps);	
	//ajax columns
	var showTender=true;
	
	var l=new FlexUI.Ajax();
    $(document).ready(function () {
            //screenObjects.getScreenObject("warpingdetgrid_data").getInputField().onTextKeyDown.subscribe(tableTextKeyDown);
            //screenObjects.getScreenObject("warpingdetgrid_data").onAfterDeleteRow.subscribe(tableRowDelete);
            //screenObjects.getScreenObject("girtype").focus();
  
      screenObjects.getScreenObject("sizing_machine1").setValue("Kalmayer");
      screenObjects.getScreenObject("sizing_machine2").setValue("Bennigger");
      
      
		              loadSetNo();
        });
        function saveWarping(){
        	if('<%=mode%>'=="View") return;
        	if(gir.getSaveInProgress()) return;
        	var r=null;
    		gir.setOperation("ADD");
    		gir.setScreenCode("600036");
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
             function onDataChange(id,me){
			var t=me.getParent();
			
			screenObjects.getScreenObject("total_production_mtrs").setValue(toNumber(screenObjects.getScreenObject("order_mtrs").getValue())+(toNumber(screenObjects.getScreenObject("tolerance_per").getValue())*toNumber(screenObjects.getScreenObject("order_mtrs").getValue())/100)+(toNumber(screenObjects.getScreenObject("rejection_per").getValue())*toNumber(screenObjects.getScreenObject("order_mtrs").getValue())/100));
			screenObjects.getScreenObject("total_warp_sheet").setValue(toNumber(screenObjects.getScreenObject("total_production_mtrs").getValue())+toNumber(screenObjects.getScreenObject("total_production_mtrs").getValue())*toNumber(screenObjects.getScreenObject("warp_crimp").getValue())/100);
			screenObjects.getScreenObject("set_length").setValue(toNumber(screenObjects.getScreenObject("total_warp_sheet").getValue())/toNumber(screenObjects.getScreenObject("no_of_pcs_loom").getValue()) );
			screenObjects.getScreenObject("act_grey_tc").setValue(( toNumber(screenObjects.getScreenObject("epi").getValue())*toNumber(screenObjects.getScreenObject("warp_yarn_ply").getValue())) +( toNumber(screenObjects.getScreenObject("ppi").getValue())*toNumber(screenObjects.getScreenObject("pick_insertion").getValue())*toNumber(screenObjects.getScreenObject("weft_yarn_ply").getValue())));
			var reed_count=0;
			var weft_crimp=0;
			var width_inches=0,no_of_pcs_loom=0,no_of_beams=0;
			var act_beam_ends=0,ends_dent=0,machine_speed=0,ppi=0;
			reed_count=toNumber(screenObjects.getScreenObject("reed_count").getValue());
			weft_crimp=toNumber(screenObjects.getScreenObject("weft_crimp_per").getValue());
			width_inches=toNumber(screenObjects.getScreenObject("width_inches").getValue());
			no_of_pcs_loom=toNumber(screenObjects.getScreenObject("no_of_pcs_loom").getValue());
			no_of_beams=toNumber(screenObjects.getScreenObject("no_of_beams").getValue());
			machine_speed=toNumber(screenObjects.getScreenObject("machine_speed").getValue());
			ppi=toNumber(screenObjects.getScreenObject("ppi").getValue());
			 screenObjects.getScreenObject("cal_beam_ends").setValue(((reed_count/2*3)+((reed_count/2*3)*weft_crimp/100)) *width_inches*no_of_pcs_loom/no_of_beams);
			act_beam_ends=toNumber(screenObjects.getScreenObject("act_beam_ends").getValue());
			ends_dent=toNumber(screenObjects.getScreenObject("ends_dent").getValue());
			screenObjects.getScreenObject("reed_space_pc_cms").setValue((((act_beam_ends-(act_beam_ends/1500))/(reed_count/2*ends_dent)*2.54)/no_of_pcs_loom  ));
			screenObjects.getScreenObject("production_loom").setValue(((machine_speed*24*60*0.85)/(ppi*39.37))*no_of_pcs_loom);
			screenObjects.getScreenObject("production_day").setValue(toNumber(screenObjects.getScreenObject("no_looms_reqd").getValue())*toNumber(screenObjects.getScreenObject("production_loom").getValue()))
			screenObjects.getScreenObject("production_mth").setValue(toNumber(screenObjects.getScreenObject("production_day").getValue())*30);
			screenObjects.getScreenObject("days_reqd").setValue(toNumber(screenObjects.getScreenObject("order_mtrs").getValue())/toNumber(screenObjects.getScreenObject("production_day").getValue()));
			return true;
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
    loadSetNo();
        }
          function loadSetNo(){
			  /*var a=new FlexUI.Ajax();
	 	   var r=a.callAjax("GET","/tekknow/service/ajax?id=set_no&ro=false&ic=0","");
 	 	  if(r!=null){
   	 			if(r.data){
   	 				screenObjects.getScreenObject("set_no").setValue(r.data[0][0]);	
    						}
					    }	
					    */
		   
		            screenObjects.getScreenObject("sizing_machine1").setValue("Kalmayer");
		            screenObjects.getScreenObject("sizing_machine2").setValue("Bennigger");
					    
			  }
        function onRateQuantityChange(id,me){
			var t=me.getParent();
			calculateTotal();
			return true;
		}
		function ClearColumnsOrderCode(id,me){
			if(!gir.getSaveInProgress()){
			  screenObjects.getScreenObject("count_name").setValue("");
			  screenObjects.getScreenObject("count_name").setTag("");
		      screenObjects.getScreenObject("mill_name").setValue("");
			  screenObjects.getScreenObject("mill_name").setTag("");
			 }
			  return true;
	 	}
		function ClearColumnsLedgerCode(id,me){
		if(!gir.getSaveInProgress()){
		 	 screenObjects.getScreenObject("order_no").setValue("");
			screenObjects.getScreenObject("order_no").setTag("");
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
		function calculateTotal(){
		 	var total=0;
		 	var total_cones=0;
		 	var t=screenObjects.getScreenObject("warpingdetgrid_data");
		 	var cols=t.getCols();
		 	var s=t.getSize();
		//	var net_amount=0;
			 for(var i=0;i<s;i++){
				t.setText(i,cols.net_weight,toNumber(t.getText(i,cols.gross_weight))- toNumber(t.getText(i,cols.tare_weight)));
			}
		}
		function tableTextKeyDown(e,args){
			var key=e.which || e.keyCode;
			if(key==113){
				e.preventDefault();
				saveWarping();
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
			var r=a.callAjax("GET","/tekknow/service/screen/data?screencode=600036","code="+args.result[3]);
			clearInnerScreen();
			gir.setOperation("MOD");
			gir.loadObjectData(r);
			calculateTotal();
			hideLoader();
		}
		function editWarping(id,me){
			gir.setOperation("MOD");	
			var l={url:"/tekknow/service/ajax",ajax:"warping_list",scrollEnabled:true,searchFromList:false,dsi:1,params:[],results:[{tgt:"code",id:"0",tt:false}],closeFunction:"onEscClose"};
			var lov=new FlexUI.LOV("e_lov",me,l);
			lov.onLovClose.subscribe(onEditClose);
			lov.show();
		}
		
	</script>
</body>
</html>