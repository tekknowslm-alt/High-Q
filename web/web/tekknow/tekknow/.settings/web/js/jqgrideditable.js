function toNumber(value){
	if(value!='NaN' && value!=null && jQuery.trim(value).length>0){
		return Number(value);
	}else{
		return 0.0;
	}
	}	
function handleElementKeyDown(e){
	var key=e.which || e.keyCode;
	var target=e.target;
	if(key==13 || key==9){
		if($(target).data('calc')!=null){
			$(target).data('calc').call(target,$(target).data('p'));
		}
		if(toNumber($(target).attr('minVal'))!=0){
			if(toNumber($(target).attr('minVal'))>$(target).val()){
				setDisplayMessage('Value should not be less than '+$(target).attr('minVal'));
				e.stopPropagation();
				e.preventDefault();				
				return;
			}
		}
		moveNextCol($(target));
		e.stopPropagation();
		e.preventDefault();
	}else{
		var t=$(target).attr('inputType');
		if(t=='NUMERIC' || t=='DECIMAL'){ 
			validate(target,e);
		}
	}	
}
function handleElementKeyPress(e){
	var target=e.target;
	if($(target).data('calc')!=null){
		$(target).data('calc').call(target,$(target).data('p'));
	}
	if($(target).data('setval')!=null){
		$(target).data('setval').call(target,$(target).data('p'));
	}
}
function initializeGrid(id,colNames,colModel,emptyRow,disableAddRow,editable){
    var container=$('#'+id).parent();
	$('#'+id).data("lastsel",0);
	$('#'+id).data("disableAddRow",disableAddRow);
	$('#'+id).data("editable",editable);
	$("#"+id).jqGrid(
	{ 
		datatype: "local", 
		height: container.height()-50, 
		width:container.width(),
		shrinkToFit:false,
		viewrecords: true,
		colNames:colNames, 
		colModel:colModel, 
    	onSelectRow: function(rowid){
    				var lastsel=$('#'+id).data("lastsel");
    				if(rowid && rowid!=lastsel){ 
    					if(lastsel!=0){
    						saveGridRow(id,lastsel);
    					} 
    					$('#'+id).jqGrid('editRow',rowid); 
    					lastsel=rowid;
    					$('#'+id).data("lastsel",rowid);
    				}
    				var rowClick=$('#'+id).data("onrowclick");
    				if(rowClick){
    					rowClick.call($('#'+id),rowid);
    				}
    			}, 
    	editurl:'clientArray'}
    	);
    	$('#'+id).data('emptyRow',emptyRow);
    	addGridRow(id);    	
}
/*

editrules: {
    custom:true,
    custom_func: function(value,colname) {
        // return [true,""] in case of successful validation
        // [false,"Your error message"]; in case of validation error
    }
}

*/
function moveNextCol(elem){
	var nf=elem.data('nf');
	var id=elem.data('p');
	var vColumn=elem.data('vc');
	var rowid = $("#"+id).jqGrid('getGridParam', 'selrow');
	var disableAddRow=$("#"+id).data('disableAddRow');
	//$("#list").data('disableAddRow',true);
	if(nf=='0'){
		var vcv=$("#"+id).jqGrid('getCell', rowid, vColumn);	
		var last = $('#'+id).jqGrid('getGridParam','records');
		if(last==rowid && vcv!=""){
			if(!disableAddRow){
				addGridRow(id);
			}
		}else if(last!=rowid){
			editNextRowJqGridRow(id,rowid);	
		}	
	}else{
		$("#"+(rowid)+"_"+nf).focus();
	}	
}
function getRowData(id){
	saveGridRow(id,0);
	$('#'+id).jqGrid('resetSelection');
	var rowData = $('#'+id).jqGrid('getRowData');
	$('#'+id).data('lastsel',0);
	return JSON.stringify(rowData);
}
function getRowListData(id){
	saveGridRow(id,0);
	$('#'+id).jqGrid('resetSelection');
	var rowData = $('#'+id).jqGrid('getRowData');
	$('#'+id).data('lastsel',0);
	return rowData;
}
function addGridRow(id){
	var last = $('#'+id).jqGrid('getGridParam','records');
    addNewJqGridRow(id,last,$('#'+id).data('emptyRow'));
}
function addGridRowWithData(id,rows){
	//row will be like {name:"product1",stock:"10",ship:"yes",note:"product1 is sold"}
	var s=rows.length;
	for(var i=0;i<s;i++){
		var r=rows[i];
		var last = $('#'+id).jqGrid('getGridParam','records');
		if(last-1<i){
			addNewJqGridRow(id,last,r);
		}else{
			$('#'+id).jqGrid('setRowData',i+1,r);
			editNextRowJqGridRow(id,i);
		}
	}
}	
function addNewJqGridRow(id,last,dataRow){
	saveGridRow(id,0);
    $('#'+id).jqGrid('resetSelection');
	var lastsel = parseInt(last) + 1;
    var su=$("#"+id).addRowData(lastsel,dataRow, "last") ;
    $("#"+id).jqGrid('setCell', lastsel, 'sno', lastsel);
    if(!$('#'+id).data('editable')){    
    	$('#'+id).jqGrid('editRow',lastsel);
    	$("#"+id).setSelection (lastsel, true);
    }
}
function addNewJqGridRowAfter(id,current,copyrow,colName){
   	var dataRow=$("#"+id).data('emptyRow');   	
   	saveGridRow(id,0);
   	$('#'+id).jqGrid('resetSelection');
   	var nos = $('#'+id).jqGrid('getGridParam','records');
   	for(var j=nos;j>=current+1;j--){
		$("#"+id +" [id='"+j+"']").attr("id", j+1);
		$("#"+id).jqGrid('setCell', j+1, 'sno', j+1);
	}
	if(copyrow){
		dataRow=$("#"+id).jqGrid('getRowData',current);
		dataRow[colName]='copied';
    }
    $("#"+id).addRowData(current+1,dataRow, "after",current) ;    
    $("#"+id).jqGrid('setCell', current+1, 'sno', current+1);
    $('#'+id).jqGrid('editRow',current+1);
    $("#"+id).setSelection (current+1, true);
}
function editNextRowJqGridRow(id,last){
	if(!$('#'+id).data('editable')){
		saveGridRow(id,0);
    	$('#'+id).jqGrid('resetSelection');
		var ed = parseInt(last) + 1;
    	$('#'+id).jqGrid('editRow',ed);
    	$("#"+id).setSelection (ed, true);
    }
}
function saveGridRow(id,row){
	var rowid;
	if(row==0){
		rowid = $("#"+id).jqGrid('getGridParam', 'selrow');
	}else{
		rowid=row;
	}
	if(rowid!=0){
    	$('#'+id).jqGrid('saveRow',rowid);
    }	
}
function delteteJqGridRow(id){
	var grid=$('#'+id);
	var myDelOptions = {
        onclickSubmit: function(options, rowid) {
            var grid_id = $.jgrid.jqID(grid[0].id),
                grid_p = grid[0].p,
                newPage = grid_p.page;
            options.processing = true;
            grid.delRowData(rowid);
            $.jgrid.hideModal("#delmod"+grid_id,
                              {gb:"#gbox_"+grid_id,
                              jqm:options.jqModal,onClose:options.onClose});

            if (grid_p.lastpage > 1) {// on the multipage grid reload the grid
                if (grid_p.reccount === 0 && newPage === grid_p.lastpage) {
                    newPage--; // go to the previous page
                }
                grid.trigger("reloadGrid", [{page:newPage}]);
            }
            return true;
        },
        processing:true
    };
	var rowid = $("#"+id).jqGrid('getGridParam', 'selrow');
	var last  = $("#"+id).jqGrid('getGridParam', 'records');
	$("#"+id).jqGrid('delGridRow',rowid,myDelOptions);
	for(var j=Number(rowid)+1;j<=last;j++){
		if(j-1==0) j=1;
		$("#" + j).attr("id", j-1);
	}
	$("#"+id).data('lastsel',0);
	setSelectionAfterDelete(id,rowid,last);
}
function setJqGridRowFocus(id,rowid){
    $('#'+id).jqGrid('editRow',rowid);
    $("#"+id).setSelection (rowid, true);	
}
function delteteJqGridRowData(id){
	var grid=$('#'+id);
	var rowid = $("#"+id).jqGrid('getGridParam', 'selrow');
	var last  = $("#"+id).jqGrid('getGridParam', 'records');
	$("#"+id).jqGrid('delRowData',rowid);
	for(var j=Number(rowid)+1;j<=last;j++){
		if(j-1==0) j=1;
		$("#"+id +" [id='"+j+"']").attr("id", j-1);
		$("#"+id).jqGrid('setCell', j-1, 'sno', j-1);
	}
	$("#"+id).data('lastsel',0);
	setSelectionAfterDelete(id,rowid,last);
}
function delteteRowDataOnClick(id,img){
	var grid=$('#'+id);
	var rowid=$(img).parent().parent().attr('id');
	saveGridRow(id,0);
    $('#'+id).jqGrid('resetSelection');
    $('#'+id).jqGrid('editRow',rowid);
    $("#"+id).setSelection (rowid, true);
	var last  = $("#"+id).jqGrid('getGridParam', 'records');
	
	$("#"+id).jqGrid('delRowData',rowid);
	for(var j=Number(rowid)+1;j<=last;j++){
		if(j-1==0) j=1;
		$("#"+id +" [id='"+j+"']").attr("id", j-1);
		$("#"+id).jqGrid('setCell', j-1, 'sno', j-1);
	}
	$("#"+id).data('lastsel',0);
	setSelectionAfterDelete(id,rowid,last);
}
function setSelectionAfterDelete(id,deletedRow,last){
	var records = $("#"+id).jqGrid('getGridParam', 'records');
	if(records==0){
		addGridRow(id);
	}
	var ed = 1;
	if(last>deletedRow){
		ed=deletedRow;
	}else if(deletedRow==1){
		ed=1;
	}else{
		ed=deletedRow-1;
	}	
    $('#'+id).jqGrid('editRow',ed);
    $("#"+id).setSelection (ed, true);	
}
function clearJqGrid(id){
	var rowIds = $('#'+id).jqGrid('getDataIDs');
	var s=rowIds.length;
	for(var i=0;i<s;i++){
		var currRow = rowIds[i];
		$('#'+id).jqGrid('delRowData', currRow);
	}
    addGridRow(id);   
}	


 /*
 	* jQuery UI Multicolumn Autocomplete Widget Plugin 1.0
 	* Copyright (c) 2012 Mark Harmon
 	*
 	* Depends:
 	*   - jQuery UI Autocomplete widget
 	*
 	* Dual licensed under the MIT and GPL licenses:
 	*   http://www.opensource.org/licenses/mit-license.php
 	*   http://www.gnu.org/licenses/gpl.html
	*/
	$.widget('custom.mcautocomplete', $.ui.autocomplete, {
    _renderMenu: function(ul, items) {
        var self = this,
            thead;

        if (this.options.showHeader) {
            table = $('<div class="ui-widget-header" style="width:100%"></div>');
            $.each(this.options.columns, function(index, item) {
                table.append('<span style="padding:0 4px;float:left;width:' + item.width + ';">' + item.name + '</span>');
            });
            table.append('<div style="clear: both;"></div>');
            ul.append(table);
        }
        $.each(items, function(index, item) {
            self._renderItem(ul, item);
        });
    },
    _renderItem: function(ul, item) {
        var t = '',
            result = '';

        $.each(this.options.columns, function(index, column) {
            t += '<span style="padding:0 4px;float:left;width:' + column.width + ';">' + item[column.valueField ? column.valueField : index] + '</span>'
        });

        result = $('<li></li>').data('item.autocomplete', item).append('<a class="mcacAnchor">' + t + '<div style="clear: both;"></div></a>').appendTo(ul);
        return result;
    }
});


(function ($) {
$.extend(true, window, {
    "FlexUI": {
      "Actions": Actions
      }
      });
      
  function Actions(menuId,iconsParent,buttonsParent) {
	  this.buildActions=function(){
	  	var v=callAjax("GET","/eprocure/service/ajax","ic=0&id=actions&menuid="+menuId);
	  	var icons=v.data;
	  	var s=icons.length;
	  	if($('#'+iconsParent)){
	  		$('#'+iconsParent).append("<ul id='actionicons' class='ic_addSea'></ul>");
	  	}
	  	if($('#'+buttonsParent)){
	  		$('#'+buttonsParent).append("<span id='actionbuttons'></span>");
	  	}
	  	var ul=$('#actionicons');  	
	  	var sp=$('#actionbuttons');
	  	for(var i=0;i<s;i++){
	  		var a=icons[i];
	  		if(a[5]==0){
				ul.append("<li class='"+a[3]+"'><a href='#' onclick='"+a[2]+"'><span class='"+a[4]+"'></span></a></li>");
			}else{
				sp.append("<a class='"+a[3]+"' href='#' onclick='"+a[2]+"'>"+a[1]+"</a>");
			}
	  	}
	  };
  }
  })(jQuery);
  
  function formatTimeHHMM(d){
		var formattedDate="";
		var curr_hour = d.getHours();
		var curr_min = d.getMinutes();
		
   		var h="";
   		var m="";
   		if(curr_hour<=9){
   			h="0"+curr_hour;
   		}else{
   			h=curr_hour+"";
   		}
   		if(curr_min<=9){
   			m="0"+curr_min;
   		}else{
   			m=curr_min+"";
   		}
   		formattedDate=h+":"+m;
   		return formattedDate;
   }
   function formatDateddMMyyyy(d){
		var formattedDate="";
		var curr_date = d.getDate();
		var curr_month = d.getMonth();
		var curr_year = d.getFullYear();
		curr_month++;
		
   		var mon="";
   		var day="";
   		if(curr_month<=9){
   			mon="0"+curr_month;
   		}else{
   			mon=curr_month+"";
   		}
   		if(curr_date<=9){
   			day="0"+curr_date;
   		}else{
   			day=curr_date+"";
   		}   		
   		formattedDate=day+"/"+mon+"/"+curr_year;
   		return formattedDate;
   }