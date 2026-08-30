(function ($) {
$.extend(true, window, {
    "FlexUI": {
      "ConstructReport": ConstructReport
      }
      });
      
  function ConstructReport(reportid,screenContainer) {
  	  var currentScreen=null;
  	  var vScreen=null;
  	  var me=this;
  	  var l=new FlexUI.Ajax();  	  
  	  this.clearScreen=function(){
  	  	currentScreen.clearScreen();
  	  }
  	  this.getCurrentScreen=function(){
  	  	return currentScreen;
  	  }	
	  this.buildFilters=function(){
	  	var v=l.callAjax("GET","/tekknow/service/report/params","id="+reportid);
	  	//construct the screen out here
	  	vScreen=v;
	  	var screenProp={};
	  	screenProp["container"]={};
	  	screenProp["screen"]=[];
	  	screenProp.container.id=screenContainer;
	  	screenProp.container.isdialog=false;
	  	screenProp.js="";
	  	var title="";
	  	if(v.length>0){
	  		title=v[0].reporttitle;
	  	}
  		var sgroup={};
  		sgroup["name"]="filters";
  		sgroup["title"]=title;
  		sgroup["layout"]=2;
		sgroup["contentType"]="Fields";
		sgroup["fields"]=[];
  		screenProp.screen.push(sgroup);

		var gas=v.length;
		for(var i=0;i<gas;i++){
			var attribute=v[i];
			var field={};
			var screenFields=screenProp.screen[0];
			field.name=v[i].paramname;
			field.inputType=v[i].paraminputtype;
			field.type=v[i].paramtype;
			field.caption=v[i].paramcaption;
			field.mandatory=false;
			field.defaultValue="";
			field.maxValue="0";
			field.textLength="100";
			field.decimalLength="0";
			field.visible=true;			
			if(v[i].paramvisible=="0"){
				field.visible=false;			
			}
			field.readOnly=false;
			if(v[i].paramvisible=="2"){
				field.readOnly=true;			
			}			
			if(v[i].paramtype=="LOV"){
				field.chkTag=true;
			}else{
				field.chkTag=false;
			}
			field.saveTag=false;
			field.align="left";
			if(field.type=="LOV"){
				field.lovOptions={};
				field.lovOptions.url="/tekknow/service/ajax";
				field.lovOptions.ajax=v[i].paramajaxid;
				field.lovOptions.scrollEnabled=true;
				field.lovOptions.searchFromList=false;
				field.lovOptions.dsi=1;
				field.lovOptions.params=[];
				field.lovOptions.results=[];
				var result={};
				if(v[i].paramajaxcolumns!=""){
				var pcolumns=v[i].paramajaxcolumns.split(",");
				result.id=pcolumns[0];
				result.tgt=v[i].paramname;
				result.tt=false;
				result.row="cr";
				field.lovOptions.results.push(result);
				result={};
				result.id=pcolumns[1];
				result.tgt=v[i].paramname+"_code";
				result.tt=false;
				result.row="cr";
				field.lovOptions.results.push(result);
				}
				if(v[i].paramtargetcolumns!=""){
					var targetcolumns=v[i].paramtargetcolumns.split(",");
					var targetparams=v[i].paramtargets.split(",");
					for(var h=0;h<targetcolumns.length;h++){
						result={};
						result.id=targetcolumns[h];
						result.tgt=targetparams[h];
						result.tt=false;
						result.row="cr";
						field.lovOptions.results.push(result);
					}
				}
				
			}else if(field.inputType==1){
			    if(v[i].paramkeys!=""){
					var keys=v[i].paramkeys.split(",");
					var values=v[i].paramvalues.split(",");
					var tilled="";
					field.keys="";
					field.values="";
					for(var k=0;k<keys.length;k++){
						field.keys=field.keys+tilled+keys[k];
						field.values=field.values+tilled+values[k];
						tilled="~";
					}
				}
			}
			if(screenFields.contentType=="Fields"){
				screenFields.fields.push(field);
				if(field.type=="LOV"){
					var vfield={};
					vfield.name=v[i].paramname+"_code";
					vfield.inputType=0;
					vfield.type="TEXT";
					vfield.caption=v[i].paramcaption;
					vfield.mandatory=false;
					vfield.defaultValue="";
					vfield.maxValue="0";
					vfield.textLength="100";
					vfield.decimalLength="0";
					vfield.visible=false;
					vfield.readOnly=true;
					vfield.chkTag=false;
					vfield.saveTag=false;
					vfield.align="left";
					screenFields.fields.push(vfield);
				}			
			}
		}
		currentScreen=new FlexUI.Screen("reports",screenProp);
		currentScreen.setScreenCode(reportid);		
	  };	  
  }
  })(jQuery);