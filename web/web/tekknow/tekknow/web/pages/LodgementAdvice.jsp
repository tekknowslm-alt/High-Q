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
				Lodgement Advice
		</div>
	</div>    
	<div class="col-md-12 col-sm-12 mpZero ">
		<div class="col-md-12 col-sm-12 mpZero" id="firsttab">
		<div class="col-md-6 col-sm-6 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>Type</label></div>
					<div class="col-md-8"><select class="form-control" id="advice_type"></select><input type="hidden" class="form-control" id="code"><input type="hidden" class="form-control" id="isgir"></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Supplier</label></div>
				<div class="col-md-8"><input type="text" class="form-control" id="suppliername"><input type="hidden" class="form-control" id="suppliercode"></div>
				<div class="col-md-2"><button id="btnShowGir" class="btn btn-primary priBut" type="button" onclick="showGIRDialog()">GIR</button></div>
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
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label> </label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="place"/></div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-2"><label>Tax Code</label></div>
				<div class="col-md-10"><input type="text" class="form-control" id="taxname"><input type="hidden" class="form-control" id="taxcode"><input type="hidden" class="form-control" id="taxtype"><input type="hidden" class="form-control" id="vattype"></div>
				</div>
			</div>
		 </div>
		</div>
		</div>
		<div class="col-md-6 col-sm-6 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 	<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label></label></div>
					<div class="col-md-8"></div>					
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label></label></div>
					<div class="col-md-8"></div>				
				</div>
				</div>
      		 </div>
      		 <div class="clearfix"></div>
      		 <div class="col-md-12 col-sm-12 mpZero">
      		 	<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label></label></div>
					<div class="col-md-8"></div>					
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label></label></div>
					<div class="col-md-8"></div>				
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
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Recd Date</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="recddate"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Bill Disc%</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="billdiscperc"></div>
				</div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Jobcard No</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="jobcardno"><input type="hidden" class="form-control" id="jobcardcode"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
				</div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Against</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="against"><input type="hidden" class="form-control" id="againstcode"></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>PO No</label></div>
					<div class="col-md-8"><input type="text" class="form-control" id="pono"></div>
				</div>
				</div>
			</div>			
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Tax Type</label></div>
					<div class="col-md-8"><select class="form-control" id="zerotax"></select></div>
				</div>
				</div>	
				<div  class="col-md-6 col-sm-6 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-4"><label>Invoice Type</label></div>
					<div class="col-md-8"><select class="form-control" id="supplementary"></select></div>
				</div>
				</div>
			</div>					
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
					<div class="col-md-12"><label style="margin:0">CENVAT CAPITAL?</label></div>
					<div class="col-md-12"><select class="form-control" id="cenvatcapital"></select>
						<input type="hidden" class="form-control" id="turnover"/>
						<input type="hidden" class="form-control" id="vat_amt"/>
						<input type="hidden" class="form-control" id="turnover_4"/>
						<input type="hidden" class="form-control" id="turnover_12_5"/>
						<input type="hidden" class="form-control" id="vat_amt_4"/>
						<input type="hidden" class="form-control" id="vat_amt_12_5"/>
						<input type="hidden" class="form-control" id="turnover_4_capital"/>
						<input type="hidden" class="form-control" id="turnover_12_5_capital"/>
						<input type="hidden" class="form-control" id="vat_4_capital"/>
						<input type="hidden" class="form-control" id="vat_12_5_capital"/>						
						<input type="hidden" class="form-control" id="det2amount"/>
					</div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-12"><label style="margin:0">Next Ded.Date</label></div>
				<div class="col-md-12"><input type="text" class="form-control" id="nextdeddate"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-12"><label style="margin:0">CENVAT Ded. </label></div>
				<div class="col-md-12"><input type="text" class="form-control" id="cenvatded"></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-12"><label style="margin:0">EDU CESS </label></div>
				<div class="col-md-12"><input type="text" class="form-control" id="educess"/></div>
				</div>
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-12"><label style="margin:0">H-EDU CESS </label></div>
				<div class="col-md-12"><input type="text" class="form-control" id="heducess"/></div>
				</div>
			</div>
		 </div>
		</div>
		</div>
		<div class="col-md-4 col-sm-4 mpZero">
		<div class="col-md-12 col-sm-12 marLfBx panelOrange hcH">
      	 <div class="col-md-6 col-sm-6 mpZero">
      		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-12"><label>Asset Sub Ledger</label></div>
					<div class="col-md-12"><input type="text" class="form-control" id="assetledgername"/><input type="hidden" class="form-control" id="assetledgercode"/></div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>	
			<div class="col-md-12 col-sm-12 mpZero">
				<div class="form-group mbotto">
				<div class="col-md-12"><label>Asset Additional Value</label></div>
				<div class="col-md-12"><input type="text" class="form-control" id="assetaddvalue"></div>
				</div>
			</div>
		 </div>
		 <div class="col-md-6 col-sm-6 mpZero">
		    <div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-12"><label>Deductions</label></div>
				</div>
				</div>	
			</div>		 
			<div class="clearfix"></div>
      		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>1st</label></div>
					<div class="col-md-10">
					<input type="text" class="form-control" id="deductionone"/>
					<input type="hidden" class="form-control" id="dedper1"/>
					<input type="hidden" class="form-control" id="dedvalue1"/>
					</div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
      		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>2nd</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="deductiontwo"/>
					<input type="hidden" class="form-control" id="dedper2"/>
					<input type="hidden" class="form-control" id="dedvalue2"/>					
					</div>
				</div>
				</div>	
			</div>
			<div class="clearfix"></div>
      		<div class="col-md-12 col-sm-12 mpZero">
				<div  class="col-md-12 col-sm-12 mpZero">		
				<div class="form-group mbotto">
					<div class="col-md-2"><label>3rd</label></div>
					<div class="col-md-10"><input type="text" class="form-control" id="deductionthree"/>
					<input type="hidden" class="form-control" id="dedper3"/>
					<input type="hidden" class="form-control" id="dedvalue3"/>					
					</div>
				</div>
				</div>	
			</div>
		 </div>
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
			<span>Tax Grid<span/>
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
  	{name:"isgir",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"N","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},
  	{name:"advice_type",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"R","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername",values:"C~A",keys:"Collection Advice~Advance Advice"},
  	{name:"advice_date",inputType:1,type:"TEXT",caption:"",mandatory:false,defaultValue:"R","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername",values:"C~A",keys:"Collection Advice~Advance Advice"},
  	{name:"suppliercode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"suppliername"},
  	{name:"suppliername",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"taxname",lovOptions:{url:"/tekknow/service/ajax",ajax:"suppliers",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"suppliername",tt:false,id:"ledger_name"},
  	{tgt:"suppliername",tt:true,id:"ledger_name"},
  	{tgt:"suppliercode",tt:false,id:"ledger_code"},
  	{tgt:"address1",tt:false,id:"addr1"},
  	{tgt:"address2",tt:false,id:"addr2"},
  	{tgt:"address3",tt:false,id:"addr3"},
  	{tgt:"place",tt:false,id:"place"}
  	]}},
  	{name:"address1",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"address2",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"address3",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"place",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"taxname"},
  	{name:"taxname",inputType:0,type:"LOV",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"invno",lovOptions:{url:"/tekknow/service/ajax",ajax:"taxes",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"taxname",tt:false,id:"tax_name"},
  	{tgt:"taxname",tt:true,id:"tax_name"},
  	{tgt:"taxcode",tt:false,id:"tax_code"},
  	{tgt:"taxtype",tt:false,id:"tax_type"},
  	{tgt:"vattype",tt:false,id:"vat_type"}
  	]},validation:"onTaxCodeChange"},
  	{name:"taxcode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"invno"},
  	{name:"taxtype",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"invno"},
  	{name:"vattype",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"invno"},
  	{name:"invno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":20,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"invdate"},
  	{name:"invdate",inputType:0,type:"DATE",caption:"",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"recddate"},
  	{name:"recddate",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"billdiscperc"},
  	{name:"billdiscperc",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":2,"visible":true,"readOnly":false,"chkTag":false,nf:"jobcardno"},
  	{name:"jobcardcode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"jobcardno"},
  	{name:"jobcardno",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":20,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"against"},
  	{name:"againstcode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"against"},
  	{name:"against",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"pono"},
  	{name:"pono",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"purgrid_data"},
  	{name:"zerotax",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"supplementary",values:"N~Y",keys:"Non-Zero Tax~Zero Tax"},  	
  	{name:"supplementary",inputType:1,type:"TEXT",caption:"",mandatory:true,defaultValue:"0","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":true,"chkTag":false,nf:"purgrid_data",values:"N~Y",keys:"Primary~Supplementary"},
  	{name:"btnSave",inputType:3,caption:"",visible:false},
    {name:"btnClear",inputType:3,caption:"",visible:false}
  	]},
  	{name:"purgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"sno",rowEmptyCheckColumn:"productcode",optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "productcode", name: "ProductCode", field: "productcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"2",id: "productname", name: "Product", field: "productname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"products",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"product_code",col:"productcode"},
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"purgrid_data",tt:true,row:"cr",id:"product_name",col:"productname"},
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"unit_code",col:"unitcode"},
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"unit_name",col:"unitname"},
  	{tgt:"purgrid_data",tt:true,row:"cr",id:"unit_name",col:"unitname"},
  	{tgt:"purgrid_data",tt:false,row:"cr",id:"capital_goods",col:"capitalgoods"}  	  	  	  	  	  
  	]}},
    {order:"3",id: "girqty", name: "GIR Qty", field: "girqty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"4",id: "billqty", name: "Billed Qty", field: "billqty",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"center"},
    {order:"5",id: "unitcode", name: "UnitCode", field: "unitcode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
    {order:"6",id: "unitname", name: "Unit", field: "unitname",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":true,width:0,"chkTag":false},
    {order:"7",id: "rate", name: "Rate", field: "rate",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":true,width:100,onchange:"onRateQuantityChange",align:"right"},
    {order:"8",id: "amount", name: "Amount", field: "amount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":true,width:100,align:"right"},
    {order:"9",id: "discount", name: "Discount", field: "discount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right"},
    {order:"10",id: "taxperc", name: "VAT %", field: "taxperc",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:100,onchange:"onRateQuantityChange",align:"right"},
    {order:"11",id: "taxamt", name: "VAT Amt", field: "taxamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right"},
    {order:"12",id: "netamount", name: "Amount", field: "netamount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":999999.99,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"right"},
    {order:"13",id: "girno", name: "GIR No", field: "girno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,align:"center"},
    {order:"14",id: "camount", name: "CAmount", field: "camount",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"15",id: "cdiscamt", name: "CDiscamt", field: "cdiscamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"16",id: "ctaxamt", name: "Ctaxamt", field: "ctaxamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"17",id: "ccessamt", name: "CCessamt", field: "ccessamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"18",id: "cnetamt", name: "CNetamt", field: "cnetamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"19",id: "ceducessamt", name: "CEduCessamt", field: "ceducessamt",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"20",id: "capitalgoods", name: "CapitalGoods", field: "capitalgoods",defaultValue:"0","inputType":0,"type":"DECIMAL","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"mandatory":false,width:0},
    {order:"21",id: "gircode", name: "GIRCode", field: "gircode",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0}
    ]
    }},
    {name:"group2",predesigned:true,contentType:"Fields",
  	fields:[
  	{name:"totalamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"totaldiscount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"nettotalamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"detamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"billamount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:"cenvatcapital"},
  	{name:"cenvatcapital",inputType:1,type:"INT",caption:"",mandatory:false,defaultValue:"1","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"nextdeddate",values:"N~Y",keys:"No~Yes"},
  	{name:"nextdeddate",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"cenvatded"},
  	{name:"cenvatded",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"educess"},
  	{name:"educess",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"heducess"},
  	{name:"heducess",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"chkTag":false,nf:"assetledgername"},
  	{name:"assetledgercode",inputType:0,type:"INT",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"assetledgername"},
  	{name:"assetledgername",inputType:0,type:"LOV",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"mode",lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"assetledgername",tt:false,id:"ledger_name"},
  	{tgt:"assetledgername",tt:true,id:"ledger_name"},
  	{tgt:"assetledgercode",tt:false,id:"ledger_code"}
  	]}},
  	{name:"assetaddvalue",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"chkTag":false,nf:"deductionone"},
	{name:"deductionone",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"deductiontwo"},
	{name:"deductiontwo",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"deductionthree"},
	{name:"deductionthree",inputType:0,type:"DATE",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:""},
	{name:"dedper1",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"dedper2",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"dedper3",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"dedvalue1",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"dedvalue2",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"dedvalue3",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"turnover",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"vat_amt",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"turnover_4",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"turnover_12_5",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"vat_amt_4",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"vat_amt_12_5",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"turnover_4_capital",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"turnover_12_5_capital",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"vat_4_capital",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"vat_12_5_capital",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"det2amount",inputType:0,type:"DECIMAL",caption:"",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":2,"visible":false,"readOnly":true,"chkTag":false,nf:""},
	{name:"remarks",inputType:0,type:"TEXT",caption:"",mandatory:false,defaultValue:"","maxValue":0,"textLength":200,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:""}
  	]},
  	{name:"taxgrid",title:"",contentType:"Table",tableProperties:{rowObject:true,serialNumberColumn:"",enableAddRow:true,rowEmptyCheckColumn:"ledger_code",optional:false,columns:[
    {order:"0",id: "ledger_code", name: "Code", field: "ledger_code",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:0,"chkTag":false},    
    {order:"1",id: "description", name: "Account Name", field: "description",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":true,width:150,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"ledger_mast",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[
  	{tgt:"taxgrid_data",tt:false,row:"cr",id:"ledger_code",col:"ledger_code"},
  	{tgt:"taxgrid_data",tt:false,row:"cr",id:"ledger_name",col:"description"},
  	{tgt:"taxgrid_data",tt:true,row:"cr",id:"ledger_name",col:"description"}
  	]}},
    {order:"2",id: "perc", name: "%", field: "perc",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":true,"mandatory":false,width:75,onchange:"onTaxDetailChange",align:"right"},
    {order:"3",id: "taxamount", name: "Amount", field: "taxamount",defaultValue:"0","inputType":0,"type":"NEGDEC","maxValue":0,"textLength":10,"decimalLength":2,"visible":true,"readOnly":false,"mandatory":false,width:75,onchange:"onTaxDetailChange",align:"right"},
    {order:"4",id: "cr_dr", name: "Cr/Dr", field: "cr_dr",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":false,"mandatory":false,width:50,"chkTag":false,onchange:"onTaxDetailChange",align:"right"},
    {order:"5",id: "col_type", name: "coltype", field: "col_type",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"6",id: "basic_ledger_code", name: "basic_ledger_code", field: "basic_ledger_code",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"7",id: "basic_others", name: "basic_others", field: "basic_others",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"8",id: "divid", name: "divid", field: "divid",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false},
    {order:"9",id: "ded", name: "ded", field: "ded",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"mandatory":false,width:0,"chkTag":false}
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
    		purchase.setScreenCode(600011);
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