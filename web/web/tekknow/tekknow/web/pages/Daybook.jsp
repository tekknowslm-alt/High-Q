<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Daybook</title>
</head>
<body>
	<%
		String code = (String) request.getParameter("code");
		String branch = (String) request.getParameter("branch");
		String userId = (String) session.getAttribute("LOGIN_ID");
		String rptId = (String) request.getParameter("id");
	%>
	<!-- JQ grid starts-->
	<div id="content">
		<div class="clearfix"></div>
		<div id="filter" style="display: block"
			class="col-sm-15 col-md-15 col-lg-15 mpRhZ mTBx">
			<div class="panelOrange hcH">
				<div class="subHe" id="dtfilter" name="dtfilter"
					style="display: none">
					Ledger<span class="pull-right" onclick="showHideFilter()"><b
						class="fa fa-caret-down"></b></span>
				</div>
				<div id="branch1" style="display: none"></div>
				<div id="divFirstFilter" style="display: block"></div>
				<div id="divSecond" style="display: block">
					<div class="col-sm-4 col-md-4 col-lg-4 mpZero">
						<div class="form-group extrBT">
							<button type="button" class="btn btn-primary mRhAj btn-sm"
								onclick="reportGo(<%=rptId%>)">Go</button>
							<button type="button" class="btn btn-primary mRhAj btn-sm"
								onclick="printCurrentSession()">Print</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="rep" style='position: relative; border: 0px; display: block;'
			class="mTBx">
			<div class="">
				<span class="pull-right" style="margin-top: -50px"><button
						class="btn btn-sm seaColB" onclick="enableSearch();">
						<i class="fa fa-search"></i>
					</button></span>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
		<div id="clbal"
			style='position: relative; border: 0px; display: block;' class="mTBx">
			<div
				style="background: #fedc34; display: inline-block; width: 100%; padding: 5px 10px; text-align: right">
				<div class="netAm" id="netAmt">Cash Closing Balance:- Rs. 0.00</div>
			</div>
		</div>
	</div>
	<!-- JQ grid ends-->
	<script>
var l=new FlexUI.Ajax();
//var v=l.callAjax("GET","/tekknow/service/ajax","ic=0&id=userdefbranch");
//var defbranch=v.data;
var acvis=false;
var colno=0;
if(<%=rptId%>==900031){
	acvis=true;
	colno=1;
}
var sProps={title:{height:25,width:100,name:"Invoice"},container:{id:"callback",isdialog:false},js:"",screen:[
{name:"divFirstFilter",title:"",pcolumns:3,height:30,width:98,minWidth:500,minHeight:200,colWidth:45,float:"left",backColor:"biege",contentType:"Fields",
  fields:[
	
  {colno:0,name:"fromdate",inputType:0,type:"DATE",caption:"From Date",mandatory:true,defaultValue:"","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"todate"},
  {colno:1,name:"todate",inputType:0,type:"DATE",caption:"To Date",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:""},  
  ]}
  ]};


var ledgereport=null;
ledgereport=new FlexUI.Screen("ledgereport",sProps);
//setDefaultBranch();
var newParams="&fromdate="+screenObjects.getScreenObject("fromdate").getValue()+"&todate="+screenObjects.getScreenObject("todate").getValue()+"&companycode="+$('#company').val();
jqReport(<%=rptId%>,"#rep",newParams,null,300);
	
function setDefaultBranch(){
		var branch=screenObjects.getScreenObject("branch");
		branch.setTag(defbranch[0][1]);
		branch.setValue(defbranch[0][0]);
	}
function enableSearch(){
	toggleSearchToolBar(<%=rptId%>);
}
enableSearch();	       
function reportGo(id){
	showLoader();
	var newParams="&fromdate="+screenObjects.getScreenObject("fromdate").getValue()+"&todate="+screenObjects.getScreenObject("todate").getValue()+"&companycode="+$('#company').val();
	changeUrlAndReloadGrid(id,"",newParams);
	hideLoader();
	var v=l.callAjax("GET","/tekknow/service/ajax","ic=0&id=<%=rptId%>&fromdate="+screenObjects.getScreenObject("fromdate").getValue()+"&todate="+screenObjects.getScreenObject("todate").getValue()+"&companycode="+$('#company').val());
	if(v.data[0][0]<0){
		$('#netAmt').text("Cash Closing Balance:- Rs. "+roundOff(toNumber(v.data[0][0])*-1,2)+" Cr ");
	}else{
		$('#netAmt').text("Cash Closing Balance:- Rs. "+roundOff(toNumber(v.data[0][0]),2)+" Dr ");
	}
}
function showHideFilter(){
	if( $('#divFirstFilter').is(':visible') ) {
		$('#divFirstFilter').css("display","none");
	}else{
		$('#divFirstFilter').css("display","block");
	}
}
function printCurrentSession(){
}
 </script>

</body>
</html>