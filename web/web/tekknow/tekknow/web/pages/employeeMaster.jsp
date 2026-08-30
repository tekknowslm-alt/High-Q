<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>Employees</title>
</head>
<body>
<div class="col-sm-10 col-md-10 col-lg-10 mpZero"><h1>Employees</h1><ol class="breadcrumb mpZero"><li><a href="#">Home</a></li><li><a>Security</a></li><li class="active breaCSel"><strong>Employees</strong></li></ol></div>
<!--add and search-->
<div class="col-sm-2 col-md-2 col-lg-2 mpZero marTp" id='addGrp'>
</div>
<div class="clearfix"></div>
<!-- JQ grid starts-->
<div id="xyz" style='position:relative;border:0px;display:block;'></div>			    	 
<div id="callback" style="display:none" >
<div class="col-sm-12 col-md-12 col-lg-12 mpZero">                    
    <div id="group1" class="panelOrange hcH">
   </div></div>
   <div class="clearfix"></div>
<div class="col-sm-12 col-md-12 col-lg-12 mpZero">                    
    <div id="group2" class="panelOrange hcH">
   </div></div>
   
   <div class="clearfix"></div>
   <div class="col-sm-12 col-md-12 col-lg-12 mpRes mTBx" style="display:none">
    <div id="branch" class="panelOrange hcH" style="height:250px;">
   </div></div>
   
</div>
<!-- JQ grid ends-->
<div id="saveGrp" style='display:none'>
<span>
<button type="button" class="btn btn-primary mRhAj" onclick='onSaveClicked()'>Save</button>
<button type="button" class="btn btn-default" onclick='hideMasterData()'>Cancel</button>
</span>
</div>

<script>
  	var l=new FlexUI.Ajax();
  	var defdata=l.callAjax("GET","/tekknow/service/ajax","id=userbranch&ic=0");
  	var branches=defdata.data;
    var sProps={title:{height:30,width:100,name:"AMC"},container:{id:"callback",isdialog:false},js:"",screen:[
  	{name:"group1",title:"Employee Details",pcolumns:2,height:40,width:98,minWidth:500,minHeight:200,colWidth:45,float:"left",backColor:"beige",contentType:"Fields",
  	fields:[{colno:1,name:"code",inputType:0,type:"INT",caption:"Code",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":false,nf:"name"},
  	{colno:0,name:"empname",inputType:0,type:"TEXT",caption:"Name",mandatory:true,defaultValue:"","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"username"},
  	{colno:1,name:"username",inputType:0,type:"TEXT",caption:"User Name",mandatory:true,defaultValue:"","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"password"},
  	{colno:0,name:"password",inputType:0,type:"password",caption:"Password",mandatory:true,defaultValue:"","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"role"},
  	{colno:1,name:"role",inputType:0,type:"LOV",caption:"Role",mandatory:true,defaultValue:"","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":true,nf:"address1",lovOptions:{url:"/tekknow/service/ajax",ajax:"roles",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[]}}
  	]
  	},{name:"group2",title:"Contact Details",pcolumns:2,height:40,width:98,minWidth:500,minHeight:200,colWidth:45,float:"left",backColor:"beige",contentType:"Fields",
  	fields:[
  	{colno:0,name:"address1",inputType:0,type:"TEXT",caption:"Building",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"address2"},
  	{colno:1,name:"address2",inputType:0,type:"TEXT",caption:"Street",mandatory:false,defaultValue:"0","maxValue":0,"textLength":100,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"city"},
  	{colno:0,name:"city",inputType:0,type:"TEXT",caption:"City",mandatory:false,defaultValue:"0","maxValue":0,"textLength":50,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"pincode"},
	{colno:1,name:"pincode",inputType:0,type:"TEXT",caption:"PinCode",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"mobile"},
	{colno:0,name:"mobile",inputType:0,type:"TEXT",caption:"Mobile",mandatory:false,defaultValue:"0","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"phone"},  
	{colno:1,name:"phone",inputType:0,type:"TEXT",caption:"Phone",mandatory:false,defaultValue:"0","maxValue":0,"textLength":30,"decimalLength":0,"visible":true,"readOnly":false,"chkTag":false,nf:"defbranch"},
	{colno:0,name:"defbranch",inputType:0,type:"LOV",caption:"Primary Branch",mandatory:false,defaultValue:"0","maxValue":0,"textLength":10,"decimalLength":0,"visible":false,"readOnly":true,"chkTag":true,nf:"status",lovOptions:{url:"/tekknow/service/ajax",ajax:"userbranch",scrollEnabled:true,searchFromList:false,dsi:0,params:[],results:[]}},
	{colno:0,name:"status",inputType:1,type:"TEXT",caption:"Status",mandatory:true,defaultValue:"","textLength":10,"visible":true,"readOnly":false,"chkTag":false,nf:"branch_data",keys:"Active~InActive",values:"Active~InActive"},
	{colno:0,name:"usertype",inputType:0,type:"TEXT",caption:"Type",mandatory:false,defaultValue:"U","textLength":10,"visible":false,"readOnly":false,"chkTag":false,nf:"branch_data"}
	]
  	},{name:"branch",title:"Employee Branch Details",height:30,width:98,minWidth:500,minHeight:200,colWidth:98,float:"left",backColor:"biege",contentType:"Table",tableProperties:{rowEmptyCheckColumn:"location",serialNumberColumn:"sno",rowObject:false,enableAddRow:false,optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:50,sno:true},
    {order:"1",id: "location", name: "Branch", field: "location",defaultValue:"0","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,width:200,"chkTag":true},
    {order:"2",id: "selected", name: "Select", field: "selected",defaultValue:"0","inputType":2,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:120,chkTag:false},
    {order:"3",id: "lmname", name: "Default Location", field: "lmname",defaultValue:"0","inputType":0,"type":"LOV","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:200,"chkTag":true,lovOptions:{url:"/tekknow/service/ajax",ajax:"branchlocations",scrollEnabled:true,searchFromList:false,dsi:0,params:[{n:"branch",src:"branch_data",ft:true,row:"cr",col:"1"}],results:[]}}    
    ]
    }}
    /*,{name:"processes",title:"Employee Process Update",height:30,width:98,minWidth:500,minHeight:200,colWidth:98,float:"left",backColor:"biege",contentType:"Table",tableProperties:{rowEmptyCheckColumn:1,enableAddRow:false,optional:false,columns:[
    {order:"0",id: "sno", name: "SNo", field: "sno",defaultValue:"0","inputType":0,"type":"INT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":true,"chkTag":false,width:20,sno:true},
    {order:"1",id: "group", name: "Group", field: "group",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,"chkTag":false},
    {order:"2",id: "process", name: "Process", field: "process",defaultValue:"","inputType":0,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":true,"mandatory":false,width:100,"chkTag":true},
    {order:"3",id: "selected", name: "Select", field: "selected",defaultValue:"0","inputType":2,"type":"TEXT","maxValue":0,"textLength":10,"decimalLength":0,"visible":true,"readOnly":false,"mandatory":false,width:20,chkTag:false}
    ]
    }}*/
    ]};
  var employee=new FlexUI.Screen("employeemaster",sProps);
  jqReport(910002,"#xyz");
  function addMasterData(){ 
  	employee.clearScreen();
  	var b=screenObjects.getScreenObject('branch_data');
  	var s=branches.length;
  	for(var h=0;h<s;h++){
  		if(b.getSize()==h){
  			b.addRow();
  		}
  		b.setText(h,1,branches[h][0]);
  		b.setCellTag(h,1,branches[h][1]);
  		b.setText(h,3,branches[h][5]);
  		b.setCellTag(h,3,branches[h][6]);
  	}
  	/*var p=screenObjects.getScreenObject('processes_data');
  	s=processes.length;
  	for(var i=0;i<s;i++){
  		if(p.getSize()==i){
  			p.addRow();
  		}
  		p.setText(i,1,processes[i][6]);
  		p.setText(i,2,processes[i][0]);
  		p.setCellTag(i,2,processes[i][1]);
  	}*/
  	$('#callback').css('display','block');
  	$('#saveGrp').css('display','block');
  	$('#history').css('display','block');
  	$('#addGrp').css('display','none');
  	$('#xyz').css('display','none');
  }
  function hideMasterData(){
  	$('#callback').css('display','none');
  	$('#saveGrp').css('display','none');
  	$('#history').css('display','none');
  	$('#addGrp').css('display','block');
  	$('#xyz').css('display','block');
  }  
  function toggleHeaderRow(){
  	toggleSearchToolBar("910002");
  }
  toggleHeaderRow();
  function onSaveClicked(id,me){
    var cid=screenObjects.getScreenObject("code").getValue();
    screenObjects.getScreenObject("defbranch").setTag("1");
    if(cid!="0" && cid!=""){
    	employee.setOperation("EDIT");
    }
	var d=employee.processDataToSave();
	if("FAILED"!=d){
		var s=new FlexUI.Ajax();
		showLoader();
		var r=s.callAjax("POST","/tekknow/service/users/employee",d);
		hideLoader();
		if(r.result=="Success"){
			setErrorMessage(r.message+" [No:"+r.code+"]");
			employee.clearScreen();
			hideMasterData();
			reloadGrid("910002");
			return r.key;			
		}else{
			setErrorMessage(r.message);		
		}
		return 0;
	}
  }
  
  function loadOrderData(url,code,did){
  	if(url==""){
  		url="/tekknow/service/users/employee";
  	}
  	if(code!=""){
  		code="code="+code+"";
  	}
  	showLoader();
	var v=l.callAjax("GET",url,code);
	employee.clearScreen();
	employee.loadData(v);
	screenObjects.getScreenObject('username').setEnabled(false);
  	//screenObjects.getScreenObject('password').setEnabled(false);	
	$('#callback').css('display','block');
  	$('#saveGrp').css('display','block');
  	$('#history').css('display','block');
  	$('#addGrp').css('display','none');
  	$('#xyz').css('display','none');
  	hideLoader();
  }
</script> 
</body>
</html>