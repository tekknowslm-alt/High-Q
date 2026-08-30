<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title></title>
</head>
<body>
<%@ page import = "java.util.Map" %>
<%
	  String rptId=request.getParameter("id");
%>
<!--add and search-->
<!-- JQ grid starts-->
<input type="hidden" id="prevreportid" value=""/>	
<div id="callback" style="display:block;">
</div>
<div class="col-sm-3 col-md-3 col-lg-6 mpZero pull-right">
	<div class="form-group extrBT"></div>	
</div>
<div class="col-sm-3 col-md-3 col-lg-6 mpZero pull-right">
	<div class="form-group extrBT"><button type="button"  class="btn btn-primary mRhAj btn-sm1" onclick="reportGo('<%=rptId%>')">Go</button><button type="button" id="jsonexp" class="btn btn-primary mRhAj btn-sm1" onclick="jsonExport('<%=rptId%>')">Export to JSON</button></div>	
</div>
<div class="clearfix"></div>
<div id="xyz" style='position:relative;border:0px;display:block;'>
<div class=""><span class="pull-right" style="margin-top:-50px" ><button class="btn btn-sm seaColB" onclick="toggleHeaderRow();"><i class="fa fa-search"></i></button><button class="btn btn-sm" onclick="backToMainReport();" id="repback" style="display:none"><i class="fa fa-arrow-up"></i></span></div>
<div class="clearfix"></div>
</div>			    	 
<!-- JQ grid ends-->

<script>
  var newParams="";
  var reports=new FlexUI.ConstructReport(<%=rptId%>,"callback");
  reports.buildFilters();
  <%@ include file = "drilldown.jsp" %>  
  processParameters();  		
  jqReport(<%=rptId%>,"#xyz",newParams);
  showCSVExportButton(<%=rptId%>,newParams);
  if(<%=rptId%>=='800014')
  {
  }
  else
  {
	  $("#jsonexp").remove();  
  }	  
  function addMasterData(){ 
  	reports.clearScreen();
  }
  function toggleHeaderRow(){
  	toggleSearchToolBar(<%=rptId%>);
  }
  toggleHeaderRow();
  function reportGo(id){
	showLoader();
	processParameters();
	changeUrlAndReloadGrid(id,"",newParams);
	showCSVExportButton(id,newParams);	
	hideLoader();
}

  function jsonExport(id){
	  var nparam=processParameters();
	  window.open("/tekknow/service/invoice/gstfiling?"+nparam,"_blank");	  
	}
  function processParameters(){
	  	newParams="";  	
  		var screenProperties=reports.getCurrentScreen().getScreenProperties();
  		var s=screenProperties.length;
  		var comma=""; 
  		for(var i=0;i<s;i++){
			var g=screenProperties[i];
			var fields=g.fields;
			var fs=fields.length;
			var v="";
			for(var p=0;p<fs;p++){				
				var f=fields[p];
				var fieldId=f.name;				
				var w=screenObjects.getScreenObject(fieldId);
				v=w.getValue();
				if(v==null || v==""){
					v=f.defaultValue;
				}
				newParams=newParams+"&"+fieldId+"="+escape(v)+"&"+fieldId+"val="+escape(v);
			}				
		}
  		newParams=newParams+"&companycode="+$('#company').val();
		return newParams;
  	}
  	function showCSVExportButton(id,params){
		$("#csvbutton_"+id).remove();
		jQuery("#report_"+id).jqGrid('navButtonAdd', 
	            '#paging_'+id,
	            {caption:"",
	            title:"Export to CSV", 
	            buttonicon:"csv-icon", 
	            onClickButton: function(){window.open('/tekknow/service/report/writecsv?id='+id+params);}, position:"last",id:"csvbutton_"+id});
    }
    function loadDrilldownReports(link,name,rowid){
    	    saveReportParameters(<%=reportId%>,$("#bodyContainer").attr("url"),<%=prevreportId%>);
    	    var cReportParams=processParameters();
    	    $('.ui-dialog').children().remove();
			$('.ui-dialog').remove();
			$("#bodyContainer").children().remove();
			$("#bodyContainer").html("");
			$("#bodyContainer").attr("url",link+cReportParams+"&prevreportid="+<%=reportId%>);
			$("#bodyContainer").load("/tekknow"+link+cReportParams+"&prevreportid="+<%=reportId%>,onSuccess);
    }    
</script> 
</body>
</html>