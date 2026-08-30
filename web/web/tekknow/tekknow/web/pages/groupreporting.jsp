<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title></title>
</head>
<body>
<%
	  String rptId=request.getParameter("id");
%>
<style>
table {
    width: 50%;
}
th {
    background: #ffffff;
    font-weight: bold;
    padding: 6px;
}
.trow {
    background: #ffffff;
    padding: 6px;
}
.grow {
    background: #ffffff;
    padding: 6px;
    font-weight: bold;    
}
.srow {
    background: #ffffff;
    padding: 6px;
    font-weight: bold;
}
.totrow {
    background: #fedc34;
    padding: 6px;
    font-weight: bold;
    font-size: 18px;
}
.viewGroup {
	padding:15px;
	
}
</style>
<!--add and search-->
<!-- JQ grid starts-->
<div id="callback" style="display:block;padding-top:5px;">
</div>
<div class="col-sm-12 col-md-12 col-lg-12 mpZero pull-right">
	<div class="form-group extrBT pull-right"><button type="button" class="btn btn-primary mRhAj btn-sm" onclick="reportGo('<%=rptId%>')">Go</button></div>	
</div>
<div class="clearfix"></div>
<div class="viewGroup" id='viewGroup'>        
	<span class="pull-right" style="" >
    <span>
    <select id="rownum" class="btn btn-default" onchange="showCISSOLReportOnRowChange()">
	    <option value="25">25</option>
	    <option value="50">50</option>
	    <option value="100">100</option>
	    <option value="500">500</option>
	    <option value="100">1000</option>
	</select>
	</span>	
	<span>
    <select id="reptype" class="btn btn-default">
	    <option value="S">Summary</option>
	    <option value="D">Detailed</option>	    
	</select>
	</span>
	<button type="button" class="btn btn-default" onclick="showCISSOLReportPrevPage()">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </button>
    <span class="text-muted"><b name="v_p">1</b> of <b name="v_t"></b></span>        
    <button type="button" class="btn btn-default" onclick="showCISSOLReportNextPage()">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </button>
	<%--button class="btn btn-default" onclick="toggleHeaderRow();"><i class="fa fa-search"></i></button--%></span>
</div>
<div class="clearfix"></div>
<div id="xyz" class="ui-jqgrid-view" style='position:relative;border:0px;display:block;'>
</div>
<div class="clearfix"></div>
<div class="viewGroup" style="text-align:center">        
	<span class="pull-right" style="" ><button type="button" class="btn btn-default" onclick="showCISSOLReportPrevPage()">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </button>
    <span class="text-muted"><b name="v_p">1</b> of <b name="v_t"></b></span>        
    <button type="button" class="btn btn-default" onclick="showCISSOLReportNextPage()">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </button>
	</span>
</div>			    	 
<!-- JQ grid ends-->

<script>
  var newParams="";
  var rownum=100;
  var rowTemplate="";
  var grpRowTemplate="";
  var sumRowTemplate="";
  var totalRowTemplate="";
  var reports=new FlexUI.ConstructReport(<%=rptId%>,"callback");
  reports.buildFilters();
  processParameters();  		
  //jqReport(<%=rptId%>,"#xyz",newParams);
  showGroupReport(<%=rptId%>,"#xyz",newParams);
  //showCSVExportButton(<%=rptId%>,newParams);
  function reportGo(id){
	showLoader();
	processParameters();
	//changeUrlAndReloadGrid(id,"",newParams);
	showCSVExportButton(id,newParams);
	var container=$('#listdata_'+id).parent();
	container.removeData('filterparams');
	showNewCISSOLReportData(id,$("#xyz"),1,newParams);	
	hideLoader();
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
		newParams=newParams+"&companycode="+$('#company').val()+"&reptype="+$('#reptype').val()
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
    function showGroupReport(id,parent,params){
		var container=$(parent);
		container.append('<div id="listdata_'+id+'" class="col-md-12 marPadZero"><table id="rpt_'+id+'" class="table"><thead id="rpth_'+id+'"></thead><tbody id="rptb_'+id+'"></tbody></table></div>');
		var v=l.callAjax("GET","/tekknow/service/report/metadata","id="+id+params);
		var cs=v.colModel.length;
		var hstr="<tr>";		
		rowTemplate="<tr class='trow'>";
		grpRowTemplate="<tr class='grow'><td colspan='{{hcolspan}}'>{{"+v.group_column+"}}</td>";
		sumRowTemplate="<tr class='srow'>";
		totalRowTemplate="<tr class='totrow'>";
		var nc=0;
		var grprowsum=false;
		var firstSumCol=-1;
		for(var i=0;i<cs;i++){
			var column=v.colModel[i];
			if(column.width>0){
				if(column.hspan>0){
					hstr=hstr+"<th colspan='"+column.hspan+"' style='width:"+column.width+"px;text-align:"+column.align+"'>"+v.colNames[i]+"</th>";
				}
				rowTemplate=rowTemplate+"<td name='"+column.name+"' style='width:"+column.width+"px;text-align:"+column.align+"'>{{"+column.name+"}}</td>";
				if(v.group_sum==2 && column.sum==1){
					grpRowTemplate=grpRowTemplate+"<td style='text-align:"+column.align+"'>{{"+column.name+"}}</td>";
					sumRowTemplate=sumRowTemplate+"<td>&nbsp;</td>";					
					grprowsum=true;
					if(firstSumCol==-1) firstSumCol=i;
				}else if(v.group_sum==1 && column.sum==1){
					sumRowTemplate=sumRowTemplate+"<td style='text-align:"+column.align+"'>{{"+column.name+"}}</td>";
					nc++;
					if(firstSumCol==-1) firstSumCol=i;
				}else if(grprowsum){
					grpRowTemplate=grpRowTemplate+"<td>&nbsp;</td>";
					sumRowTemplate=sumRowTemplate+"<td>&nbsp;</td>";
					nc++;					
				}else{
					sumRowTemplate=sumRowTemplate+"<td>&nbsp;</td>";					
					nc++;					
				}
				if(column.sum==1){
					totalRowTemplate=totalRowTemplate+"<td style='text-align:"+column.align+"'>{{"+column.name+"}}</td>";
				}else{
					if(firstSumCol!=-1 && i>firstSumCol){
						nc--;
					}
					totalRowTemplate=totalRowTemplate+"<td>&nbsp;</td>";
				}
			}
		}
		rowTemplate=rowTemplate+"</tr>";
		grpRowTemplate=grpRowTemplate+"</tr>";
		sumRowTemplate=sumRowTemplate+"</tr>";
		var reg=new RegExp('{{hcolspan}}','g');
		grpRowTemplate=grpRowTemplate.replace(reg,nc);		
		hstr=hstr+"</tr>";
		$('#rpth_'+id).append(hstr);
		container.data('dataurl','/tekknow/service/report/data?id='+id);
		$('#viewGroup').data("reportid",id);		
		container.data('rownum',rownum);
		container.data('currentpage',1);
		container.data('totalrows',0);
		container.data('totalpages',0);
		container.data('sortname',v.sortname);
		container.data('sortorder',v.sortorder);
		container.data('groupcolumn',v.group_column);
		container.data('groupsum',v.group_sum);
		container.data('group_filter_column',v.group_filter_column);
		container.data('group_filters',v.groupfilters);
	}  
	function showCISSOLReportOnRowChange(){
		var id=$('#viewGroup').data("reportid");
		var container=$('#listdata_'+id).parent();
		var currentPage=container.data('currentpage');
		var totalPages=container.data('totalpages');
		var filterParams=container.data('filterparams');
		container.data("rownum",$('#rownum').val());
		var currentpage=1;
		showNewCISSOLReportData(id,container,currentPage,filterParams);
	}
	function showCISSOLReportNextPage(){
		var id=$('#viewGroup').data("reportid");
		var container=$('#listdata_'+id).parent();
		var currentPage=container.data('currentpage');
		var totalPages=container.data('totalpages');
		var filterParams=container.data('filterparams');
		if(currentPage<totalPages){
			currentPage++;
			showNewCISSOLReportData(id,container,currentPage,filterParams);
		}
	}
	function showCISSOLReportPrevPage(){
		var id=$('#viewGroup').data("reportid");
		var container=$('#listdata_'+id).parent();
		var currentPage=container.data('currentpage');
		var totalPages=container.data('totalpages');
		var filterParams=container.data('filterparams');
		if(currentPage>1){
			currentPage--;
			showNewCISSOLReportData(id,container,currentPage,filterParams);
		}
	}
	function showCISSOLReportLastPage(){
		var id=$('#viewGroup').data("reportid");
		var container=$('#listdata_'+id).parent();
		var totalPages=container.data('totalpages');
		var filterParams=container.data('filterparams');
		var currentPage=totalPages;	
		showNewCISSOLReportData(id,container,currentPage,filterParams);
	}
	function showCISSOLReportFirstPage(){
		var id=$('#viewGroup').data("reportid");
		var container=$('#listdata_'+id).parent();
		var currentPage=1;
		var filterParams=container.data('filterparams');
		showNewCISSOLReportData(id,container,currentPage,filterParams);
	}
	function showNewCISSOLReportData(id,parent,pageNo,params){
		var container=$(parent);		
		//var rowTemplate=container.data('rowtemplate');
		var dataurl=container.data('dataurl');
		var rownum=container.data('rownum');
		var currentPage=container.data('currentpage');
		var totalrows=container.data('totalrows');
		var totalpages=container.data('totalpages');
		var sortname=container.data('sortname');
		var sortorder=container.data('sortorder');
		var cissolreports=container.data('paramsources');
		var grpcolumn=container.data('groupcolumn');
		var grpsum=container.data('groupsum');
		var grpfilter=container.data('group_filter_column');
		var grpfilters=container.data('group_filters');
		if(params==undefined )
		{
			params="";
		}else{
			processParameters();  										
			params=newParams;
		}	
		var v=l.callAjax("GET",dataurl,"&rows="+rownum+"&page="+pageNo+"&sidx="+sortname+"&sord="+sortorder+params);
		container.data('currentpage',pageNo);
		container.data('totalrows',v.records);
		container.data('totalpages',v.total);
		container.data('filterparams',params);
		$('#rptb_'+id).children().remove();
		var s=v.rows.length;
		var cseq=-1;
		var grpFieldValue="";
		for(var i=0;i<s;i++){
			var row=v.rows[i];
			var tr=rowTemplate;
			var gtr=grpRowTemplate;
			var rsum=sumRowTemplate;
			if(grpcolumn!="" && $('#reptype').val()!="S"){
				if(grpFieldValue=="" || grpFieldValue!=row[grpcolumn]){
					var re=new RegExp('{{'+grpcolumn+'}}','g');
					gtr=gtr.replace(re,row[grpcolumn]);
					if(grpsum==1 && grpFieldValue!=""){
						for(field in v.groupdata[grpFieldValue]){
							var re=new RegExp('{{'+field+'}}','g');
							rsum=rsum.replace(re,v.groupdata[grpFieldValue][field]);
						}
						$('#rptb_'+id).append($(rsum));					
					}				
					if(grpsum==2){
						for(field in v.groupdata[row[grpcolumn]]){
							var re=new RegExp('{{'+field+'}}','g');
							gtr=gtr.replace(re,v.groupdata[row[grpcolumn]][field]);
						}
					}
					$('#rptb_'+id).append($(gtr));
					grpFieldValue=row[grpcolumn];
				}
			}
			for(field in row){
				var re=new RegExp('{{'+field+'}}','g');
				tr=tr.replace(re,row[field]);
			}			
			
			var tro=$(tr);
			tro.data("row",row);
			for(var gf in grpfilters){
				if(row[gf]!=undefined && row[gf]!=0){
					var cft=grpfilters[gf].columns;
					var cfts=cft.split(",");
					for(var g=0;g<cfts.length;g++){
						if(row[gf]==1){
							tro.find("td[name='"+cfts[g]+"']").addClass("grow");
						}else if(row[gf]==2){
							tro.addClass("srow");
						}else{
							tro.find("td[name='"+cfts[g]+"']").addClass("totrow");
						}
					}
				}
			}
			if(row[grpfilter]=="1"){
				tro.addClass("grow");
			}
			if(row[grpfilter]=="2" || row[grpfilter]=="3"){
				tro.addClass("totrow");
			}
			$('#rptb_'+id).append(tro);	
		}
		if(grpsum==1 && grpFieldValue!=""){
			var rsum=sumRowTemplate;
			for(field in v.groupdata[grpFieldValue]){
				var re=new RegExp('{{'+field+'}}','g');
				rsum=rsum.replace(re,v.groupdata[grpFieldValue][field]);
			}
			$('#rptb_'+id).append($(rsum));					
		}
		if(v.userdata){
			var rsum=totalRowTemplate;
			for(field in v.userdata){
				var re=new RegExp('{{'+field+'}}','g');
				rsum=rsum.replace(re,v.userdata[field]);
			}
			$('#rptb_'+id).append($(rsum));					
		}
		$('[name="v_p"]').text(pageNo);
		$('[name="v_t"]').text(v.total);
	}	  
</script> 
</body>
</html>