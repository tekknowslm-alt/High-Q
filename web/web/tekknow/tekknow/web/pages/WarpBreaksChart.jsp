<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    </head>
    <body style="background:#ffffff">
    <link href="css/xgrid.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/jqgrid/ui.jqgrid.css" type="text/css"/>
     <link rel="stylesheet" href="css/jquery-ui.css" type="text/css"/>
     
     <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/icomoon.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
    
    <script type="text/javascript" src="js/jquery/jquery-1.8.3.min.js"></script>
	<script src="js/jquery/jquery-ui.min.js"></script>
	<script src="js/jquery/jquery-ui-timepicker-addon.js"></script>
	<script src="js/jquery/jquery-ui-sliderAccess.js"></script>
	<script src="js/jqgrid/i18n/grid.locale-en.js"></script>
	<script src="js/jqgrid/jquery.jqGrid.min.js"></script>
	<script type="text/javascript" src="js/ntfw.js"></script>
    <script language="javascript" type="text/javascript" src="js/flot/jquery.flot.js"></script>
	<script language="javascript" type="text/javascript" src="js/flot/jquery.flot.categories.js"></script>
	<script language="javascript" type="text/javascript" src="js/flot/jquery.flot.pie.js"></script>
	<script language="javascript" type="text/javascript" src="js/flot/jquery.flot.tooltip.js"></script>    
    <script>
    <%
    	String userId=(String)session.getAttribute("LOGIN_ID");
    	String setno=(String)request.getParameter("setno");
    	String avgwarpbreakspermm=(String)request.getParameter("avgwarpbreakspermm");
    	%>
    	function showDash(data) {

      var options = {
            series: {
                pie: {show: true,
                	radius: 1,
		            label: {
		                show: true,
		                radius: 1,
		                formatter: labelFormatter,
		                background: {
		                    opacity: 0.8
		                }
		            }
                    }
		},
            legend: {
                show: true
            }
	  
         };
 
    $.plot($("#chartcontainer"), data, options);  
	}
function labelFormatter(label, series) {
    return "<div style='font-size:12px; text-align:center; padding:2px;'>"+ series.data[0][1] + "%</div>";
}
    	
    </script>
    
    
    <div id="divDash" class="col-sm-12 col-md-12 col-lg-12 " style="display:block"> 
	    <div class="row">
	          <div class="col-lg-12 mpZero">
	            <div class="panel panel-info">
	              <div class="panel-body">
	              	<div class="row">
	                	<span style="font-weight:bold;font-size:14px"> R. B. WOVENS (P) LTD</span><br/>
	                	<span style="font-weight:bold;font-size:14px">Pareto Analysis for the set No : <span id="setnol"><%=setno%></span></span>
	                </div>
	                <div class="row">
	                	<div class="form-group extrBT col-lg-5"><div class="col-sm-7 mpRes"><input type="hidden" id="setno" disabled/></div></div>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="clearfix"></div>
	          <div class="col-lg-3 mpZero">
	            <div class="panel panel-info">
	              <div class="panel-body">
	                <div style="text-align:center">
	                	<div id="warpbreak" style="height:650px;">
	                		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="warpbreakdetails"></table>
	                	</div>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-lg-3 mpZero">
	            <div class="panel panel-info">
	              <div class="panel-body">
	                <div style="text-align:center">
	                	<div id="breaksperbeamcont" style="height:650px;">
	                		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="breaksperbeam"></table>
	                	</div>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="col-lg-5 mpZero">
	            <div class="panel panel-info">
	              <div class="panel-body">
	                <div style="text-align:center">
	                	<div id="chartcontainer" style="width:350px;height:400px;"></div>
	                </div>
	              </div>
	            </div>
	          </div>
	    </div>
    </div>
</body>
<script>
$(document).ready(function(){
    $('#setno').val(<%=setno%>);
	ConstructWarpBreaks();
	ConstructBeamBreaks();
	loadData();
});
function loadData(setno){
 		var chartdata = [
    	];
		var a=new FlexUI.Ajax();
		var v=a.callAjax("GET","/tekknow/service/ajax","&id=warpbreaks&ic=0&ro=false&setno="+$('#setno').val());		
		var warpdata = v.data;
		var warpdetails=[];
		if(warpdata[0][0]!=0){
			warpdetails.push({"btype":"Thin Place","breaks":warpdata[0][0]});
			chartdata.push({label: "Thin Place", data:((warpdata[0][0]/warpdata[0][13])*100).toFixed(2)});
			
		}
		if(warpdata[0][1]!=0){
			warpdetails.push({"btype":"Cut Ends","breaks":warpdata[0][1]});
			chartdata.push({label: "Cut Ends", data:((warpdata[0][1]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][2]!=0){
			warpdetails.push({"btype":"Entaglement","breaks":warpdata[0][2]});
			chartdata.push({label: "Entaglemenet", data:((warpdata[0][2]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][3]!=0){
			warpdetails.push({"btype":"Foreign Fibre","breaks":warpdata[0][3]});
			chartdata.push({label: "Foreign Fibre", data:((warpdata[0][3]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][4]!=0){
			warpdetails.push({"btype":"Hand Waste","breaks":warpdata[0][4]});
			chartdata.push({label: "Hand Waste", data:((warpdata[0][4]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][5]!=0){
			warpdetails.push({"btype":"Thick Place","breaks":warpdata[0][5]});
			chartdata.push({label: "Thick Place", data:((warpdata[0][5]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][6]!=0){
			warpdetails.push({"btype":"Splicing","breaks":warpdata[0][6]});
			chartdata.push({label: "Splicing", data:((warpdata[0][6]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][7]!=0){
			warpdetails.push({"btype":"Slough Off","breaks":warpdata[0][7]});
			chartdata.push({label: "Slough Off", data:((warpdata[0][7]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][8]!=0){
			warpdetails.push({"btype":"Adas Cone","breaks":warpdata[0][8]});
			chartdata.push({label: "Adas Cone", data:((warpdata[0][8]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][9]!=0){
			warpdetails.push({"btype":"Back Winding","breaks":warpdata[0][9]});
			chartdata.push({label: "Back Winding", data:((warpdata[0][9]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][10]!=0){
			warpdetails.push({"btype":"Damage Cone","breaks":warpdata[0][10]});
			chartdata.push({label: "Damage Cone", data:((warpdata[0][10]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][11]!=0){
			warpdetails.push({"btype":"Tip Damage","breaks":warpdata[0][11]});
			chartdata.push({label: "Tip Damage", data:((warpdata[0][11]/warpdata[0][13])*100).toFixed(2)});
		}
		if(warpdata[0][12]!=0){
			warpdetails.push({"btype":"Run Out","breaks":warpdata[0][12]});
			chartdata.push({label: "Run Out", data:((warpdata[0][12]/warpdata[0][13])*100).toFixed(2)});
		}		
		warpdetails.push({"btype":"Total","breaks":warpdata[0][13]});
		$grid = $("#warpbreakdetails");
    	$grid.clearGridData();
    	$grid.jqGrid('setGridParam', { data: warpdetails });
    	$grid[0].refreshIndex();
    	$grid.trigger("reloadGrid");
		
		
		v=a.callAjax("GET","/tekknow/service/ajax","&id=breaksperbeam&ic=0&ro=true&setno="+$('#setno').val());		
		warpdata = v.data;
		$grid = $("#breaksperbeam");
    	$grid.clearGridData();
    	$grid.jqGrid('setGridParam', { data: warpdata });
    	$grid[0].refreshIndex();
    	$grid.trigger("reloadGrid");
		
		showDash(chartdata);

}
function ConstructWarpBreaks() {
        var areaWidth = 300;
        $("#warpbreakdetails").jqGrid({
            datatype: "local",
            //width: areaWidth,
            height:600,
            autowidth: true,
            shrinktofit:true,
            colNames: ['Type', 'Breaks'],
            colModel: [
                        { name: 'btype', index: 'btype', sorttype: "text", sortable: false, width: 100, align: 'left' },
                        { name: 'breaks', index: 'breaks', sorttype: "integer", sortable: false, width: 50, align: 'left' }
            ],
            rowNum: 500,
            datatype: "jsonstring",
            jsonReader: { repeatitems: false },
            viewrecords: true,
            gridview: true,
            loadtext: "Loading....",
            multiselect: false,
        });
    }
function ConstructBeamBreaks() {
        var areaWidth = 300;
        $("#breaksperbeam").jqGrid({
            datatype: "local",
            //width: areaWidth,
            height:600,
            autowidth: true,
            shrinktofit:true,
            colNames: ['Beam No.', 'Breaks'],
            colModel: [
                        { name: 'beam_no', index: 'beam_no', sorttype: "integer", sortable: false, width: 50, align: 'left' },
                        { name: 'tot_breaks', index: 'tot_breaks', sorttype: "integer", sortable: false, width: 50, align: 'left' }
            ],
            rowNum: 500,
            datatype: "jsonstring",
            jsonReader: { repeatitems: false },
            viewrecords: true,
            gridview: true,
            loadtext: "Loading....",
            multiselect: false,
        });
    }
</script>
</html>