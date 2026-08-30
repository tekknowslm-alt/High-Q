<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>User Roles</title>
</head>
<body>
<link href="js/dynatree/skin/ui.dynatree.css" rel="stylesheet" type="text/css">
<script src="js/dynatree/jquery.dynatree.min.js" type="text/javascript"></script>

<div class="col-sm-10 col-md-10 col-lg-10 mpZero"><h1>Roles</h1><ol class="breadcrumb mpZero"><li><a href="#">Home</a></li><li><a>Security</a></li><li class="active breaCSel"><strong>Roles</strong></li></ol></div>
<!--add and search-->
<div class="col-sm-2 col-md-2 col-lg-2 mpZero marTp" id='addGrp'>
</div>
<div class="clearfix"></div>
<!-- JQ grid starts-->
<div id="xyz" style='position:relative;border:0px;display:block;width:100%;float:left'></div>			    	 
<div id="callback" style="display:none" >
<div class="col-sm-5 col-md-5 col-lg-5 mpRhZ">                    
    <div id="group1" class="panelOrange hcH">
   </div>
   <div id="saveGrp" >
<span>
<button type="button" class="btn btn-primary mRhAj" onclick='onSaveClicked()'>Save</button>
<button type="button" class="btn btn-default" onclick='hideMasterData()'>Cancel</button>
</span>
</div></div>
   
   <div class="col-sm-7 col-md-7 col-lg-7 mpZero">                    
    <div id="treeview" class="panelOrange hcH">
    <div id='tree2'></div>
   </div></div>
</div>
<!-- <div id="treeview" style='position:relative;border:0px;padding:5px;display:none;float:right;width:60%'>
<div id='tree2'></div> -->
<script type="text/javascript">
	function buildTreeView(menus){
		var rootNode=initializeTree();
		var s=menus.menus.length;
		for(var j=0;j<s;j++){
			var menu=menus.menus[j];
			var node={};
			node['menu_id']=menu[0];
			node['title']=menu[2];
			node['key']=menu[0];
			node['type']='Menu';
			if(menu[4]!='0'){
				node['select']=true;
			}
			if(menu[3]=='0'){
				rootNode.addChild(node);			
			}else{
				$("#tree2").dynatree("getTree").getNodeByKey(menu[3]).addChild(node);
			}			
		}
		s=menus.operations.length;
		for(var j=0;j<s;j++){
			var menu=menus.operations[j];
			var node={};
			node['so_menu_id']=menu[0];
			node['so_id']=menu[1];
			node['title']=menu[2];
			node['key']=node['so_menu_id']+'_'+node['so_id'];
			node['type']='Operation';
			node['report_id']=menu[5];
			node['report_column']=menu[3];
			if(menu[4]!='0'){
				node['select']=true;
			}
			var t=$("#tree2").dynatree("getTree").getNodeByKey(menu[0]+'_keys');
			if(!t){
				var key={};
				key['title']='Key Settings';
				key['key']=menu[0]+'_keys';
				key['hideCheckbox']=true;
				key['type']='Operation';
				if(menu[4]!='0'){
					key['select']=true;
				}
				console.log(menu[0]);
				$("#tree2").dynatree("getTree").getNodeByKey(menu[0]).addChild(key);				
				t=$("#tree2").dynatree("getTree").getNodeByKey(menu[0]+'_keys');
			}
			t.addChild(node);			
		}
		s=menus.columns.length;
		for(var j=0;j<s;j++){
			var menu=menus.columns[j];
			var node={};
			node['menu_id']=menu[0];
			node['report_id']=menu[1];
			node['title']=menu[3];
			node['report_column']=menu[2];			
			node['key']=node['menu_id']+'_'+node['report_column'];
			node['type']='Column';
			if(menu[4]!='0'){
				node['select']=true;
			}
			var t=$("#tree2").dynatree("getTree").getNodeByKey(menu[0]+'_columns');
			if(!t){
				var key={};
				key['title']='Column Settings';
				key['key']=menu[0]+'_columns';
				key['hideCheckbox']=true;
				key['type']='Column';
				if(menu[4]!='0'){
					key['select']=true;
				}
				$("#tree2").dynatree("getTree").getNodeByKey(menu[0]).addChild(key);				
				t=$("#tree2").dynatree("getTree").getNodeByKey(menu[0]+'_columns');
			}
			t.addChild(node);			
		}
		
	}
	function initializeTree(){
		$("#tree2").dynatree({
			checkbox: true,
			selectMode: 3,
			onDblClick: function(node, event) {
				node.toggleSelect();
			}
    	});
	    var rootNode = $("#tree2").dynatree("getRoot");	
	    rootNode.removeChildren();	
	    return rootNode;
	}
</script>
</div>
<!-- JQ grid ends-->


<script>
  	var l=new FlexUI.Ajax();
    var sProps={title:{height:30,width:100,name:"SP"},container:{id:"callback",isdialog:false},js:"",screen:[
  	{name:"group1",title:"Process Details",pcolumns:1,height:40,width:98,minWidth:500,minHeight:200,colWidth:98,float:"left",backColor:"beige",contentType:"Fields",
  	fields:[{colno:0,name:"code",inputType:0,type:"INT",caption:"Code",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"rolename"},
  	{colno:0,name:"rolename",inputType:0,type:"TEXT",caption:"Name",mandatory:true,defaultValue:"","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"parentrole"},
  	{colno:0,name:"parentrole",inputType:0,type:"LOV",caption:"Parent",mandatory:true,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"desc",lovOptions:{url:"/tekknow/service/ajax",ajax:"roles",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[]},validation:"pickRoleMenus"}
  	]
  	}]};
  var rolemaster=new FlexUI.Screen("rolemaster",sProps);
  jqReport(910001,"#xyz");
  function addMasterData(){ 
  	rolemaster.clearScreen(); 
  	initializeTree();
  	$('#callback').css('display','block');
  	$('#treeview').css('display','block');
  	$('#saveGrp').css('display','block');
  	$('#history').css('display','block');
  	$('#addGrp').css('display','none');
  	$('#xyz').css('display','none');
  }
  function hideMasterData(){
  	$('#callback').css('display','none');
  	$('#treeview').css('display','none');
  	$('#saveGrp').css('display','none');
  	$('#history').css('display','none');
  	$('#addGrp').css('display','block');
  	$('#xyz').css('display','block');
  }  
  function toggleHeaderRow(){
  	toggleSearchToolBar("910001");
  }
  toggleHeaderRow();
  function onSaveClicked(id,me){
    var cid=screenObjects.getScreenObject("code").getValue();
    if(cid!="0" && cid!=""){
    	rolemaster.setOperation("EDIT");
    }
    var partSelected=[];
    var keys=[];
    var columns=[];
    var selectedNodes=$("#tree2").dynatree("getTree").getSelectedNodes();
    var sn=selectedNodes.length;
    for(var k=sn-1;k>=0;k--){
	    if(selectedNodes[k].data.type=='Operation'){
			keys.push(selectedNodes[k]);	    	
		    selectedNodes.splice(k,1);
	    }else if(selectedNodes[k].data.type=='Column'){
			columns.push(selectedNodes[k]);	    	
		    selectedNodes.splice(k,1);	    
	    }
    }    
    sn=selectedNodes.length;
    $(".dynatree-partsel").each(function(){
    	var node = $.ui.dynatree.getNode(this);
    	var avail=false;
    	for(var k=0;k<sn;k++){
	    	if(node.data.key==selectedNodes[k].data.key){
		    	avail=true;
		    	break;    	
	    	}
    	}
    	if(!avail && node.data.type!='Operation' && node.data.type!='Column'){
    		partSelected.push(node);
    	}
	});    
    selectedNodes=selectedNodes.concat(partSelected);
	var selectedKeys = $.map(selectedNodes, function(node){
    	return node.data.key;
    });
    var selectedOperations=[];
    var sk=keys.length;
    for(var j=0;j<sk;j++){
    	if(keys[j].data.title!='Key Settings'){
	    	var node={};
	    	node['menu_id']=keys[j].data.so_menu_id;
	    	node['so_id']=keys[j].data.so_id;
	    	node['report_id']=keys[j].data.report_id || "0";
	    	node['report_column']=keys[j].data.report_column || "";
	    	selectedOperations.push(node);
	    }
    }
    var selectedColumns=[];
    var sc=columns.length;
    for(var j=0;j<sc;j++){
    	if(columns[j].data.title!='Column Settings'){
	    	var node={};
	    	node['menu_id']=columns[j].data.menu_id;
	    	node['report_id']=columns[j].data.report_id || "0";
	    	node['report_column']=columns[j].data.report_column || "";
	    	selectedColumns.push(node);
	    }
    }
    
	var d=rolemaster.processDataToSave(',"menus":'+JSON.stringify(selectedKeys)+',"operations":'+JSON.stringify(selectedOperations)+',"columns":'+JSON.stringify(selectedColumns));
	if("FAILED"!=d){
		var s=new FlexUI.Ajax();
		showLoader();
		var r=s.callAjax("POST","/tekknow/service/users/role",d);
		hideLoader();
		if(r.result=="Success"){
			setErrorMessage(r.message+" [No:"+r.code+"]");
			rolemaster.clearScreen();
			hideMasterData();
			reloadGrid("910001");
			return r.key;			
		}else{
			setErrorMessage(r.message);		
		}
		return 0;
	}
  }
  
  function loadOrderData(url,code,did){
  	if(url==""){
  		url="/tekknow/service/users/role";
  	}
  	if(code!=""){
  		code="code="+code+"";
  	}
  	showLoader();
	var v=l.callAjax("GET",url,code);
	rolemaster.loadData(v);
	buildTreeView(v);
	screenObjects.getScreenObject('parentrole').setEnabled(false);
	$('#callback').css('display','block');
	$('#treeview').css('display','block');
  	$('#saveGrp').css('display','block');
  	$('#history').css('display','block');
  	$('#addGrp').css('display','none');
  	$('#xyz').css('display','none');
  	hideLoader();
  }
  function pickRoleMenus(id,me){
   if(!rolemaster.getSaveInProgress()){
   		showLoader();
	  	var menus=l.callAjax("GET","/tekknow/service/users/role/menus","code="+me.getTag());
	  	buildTreeView(menus);
	  	hideLoader();
	  }
	  return true;
  }
</script> 
</body>
</html>