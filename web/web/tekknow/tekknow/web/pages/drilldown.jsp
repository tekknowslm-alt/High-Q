<%@ page import = "java.util.Map" %>
<%
	  String prevreportId=request.getParameter("prevreportid");
	  String reportId=request.getParameter("id");
		if(prevreportId!=null && !"0".equals(prevreportId) && !"null".equals(prevreportId)){
		%>
			$('#repback').css('display','inline-block');
		<%
		}else{
		%>
			$('#repback').css('display','none');
			drillDownReportParams={};
    		drillDownReportURL={};
    		drillDownPrevReportID={};
			
		<%
		}
		Map<String, String[]> parameters = request.getParameterMap();
		for(String parameter : parameters.keySet()) {
		String []value=parameters.get(parameter);
		%>if($('#<%=parameter%>').length>0){
			$('#<%=parameter%>').val('<%=value[0]%>');
		}<%	        			
		}    			
%>
    function backToMainReport(){
    		var prevReportID=$('#prevreportid').val();
    		var parameters=drillDownReportParams[prevReportID];
    		var url=drillDownReportURL[prevReportID];
    		var dPrevReport=drillDownPrevReportID[prevReportID];
    	    $('.ui-dialog').children().remove();
			$('.ui-dialog').remove();
			$("#bodyContainer").children().remove();
			$("#bodyContainer").html("");
			if(dPrevReport=="0" || dPrevReport=="null" || dPrevReport==undefined){
				$("#bodyContainer").attr("url",url);
			}
			$("#bodyContainer").load("/tekknow"+url+parameters+"&prevreportid="+dPrevReport,onSuccess);        
    }    
    
    
    
    
    
    
    
    
    
    
    