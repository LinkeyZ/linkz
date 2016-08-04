//截取空字符串
function fTrim(str)
{
	return str.replace(/(^\s*)|(\s*$aaa)/g, ""); 
}

/*Ajax对象获取*/
function getXmlHttp() {
	var xmlHttp = false;
	/*@cc_on @*/
	/*@if (@_jscript_version >= 5)
	try {
	  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
	  try {
	    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	  } catch (e2) {
	    xmlHttp = false;
	  }
	}
	@end @*/
	if (!xmlHttp && typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	}
	return xmlHttp;
}

function isDouble(evt){
	if(evt.keyCode!=46 && (evt.keyCode<48 || evt.keyCode>57))
		return false;
}
function isNumber(evt){
	if(evt.keyCode<48 || evt.keyCode>57)
		return false;
}
function isillegalChar(evt){
	if(( event.keyCode > 32 && event.keyCode < 48) ||
       ( event.keyCode > 57 && event.keyCode < 65) ||
       ( event.keyCode > 90 && event.keyCode < 97) ||
       event.keyCode==32
      ){
		return false;
	}
}
function $aaa(id){
	return document.getElementById(id);
}
/*  
 * 打开新窗口  
 * file:链接地址  
 * name:窗口的名称  
 * width:窗口的宽度  
 * height:窗口的高度  
 * scroll:窗口是否有滚动条，1：有滚动条；0：没有滚动条  
 */
function openWin(file, name, width, height, scroll) {
	var sb = scroll == "1" ? "1" : "0";
	var left = (screen.width - width) / 2;
	var top = (screen.height - height) / 2;

	var features = "left=" + left + ",top=" + top + ",height=" + height
			+ ",width=" + width + ",center=1,scrollbars=" + sb
			+ ",status=0,directories=0,channelmode=0";
	subwin = window.open(file, name, features);
	if (!subwin.opener)
		subwin.opener = self;
	subwin.focus();
//	return subwin;
}
/**
 * 选中所有name值为boxName的多选控件，并将值赋给name值为idListInput的控件

 * @param ckObj
 * @param boxName
 * @param idListInput
 * @return
 */
function checkAll(ckObj, boxName, idListInput) {
	var List = document.getElementsByName(boxName);
	$aaa(idListInput).value = "";
	for (i = 0; i < List.length; i++) {
		if (ckObj.checked == true && List[i].disabled != true) {
			List[i].checked = true;
			check(List[i], idListInput);
		} else if (ckObj.checked == false && List[i].disabled != true) {
			List[i].checked = false;
			check(List[i], idListInput);
		}
	}
	trimIdList(idListInput);
}

function check(ckObj, idListInput) {
	var s = "";
	if (eval(ckObj).checked == true) {
		if ($aaa(idListInput).value == '') {
			$aaa(idListInput).value = $aaa(idListInput).value + ""
					+ eval(ckObj).value + "";
		} else {
			$aaa(idListInput).value = $aaa(idListInput).value + ","
					+ eval(ckObj).value + "";
		}
	} else {
		var s = "";
		s = $aaa(idListInput).value;
		s = s.replace("" + eval(ckObj).value + "", "");
		s = s.replace(",,", ",");
		$aaa(idListInput).value = s;
	}
	s = $aaa(idListInput).value;
	s = s.replace(",,", ",");
	$aaa(idListInput).value = s;
}
//去除idList值中多余的","
function trimIdList(idListInput){
	var idlist=$aaa(idListInput).value.split(",");
	var idlist_new=new Array();
	var str;
	var j=0;
	
	for(var i=0;i<idlist.length;i++){
		if(fTrim(idlist[i])!=null&&fTrim(idlist[i])!=""){
			idlist_new[j]=(idlist[i]);
			j++;
		}
	}
	$aaa(idListInput).value=idlist_new;
//	alert($aaa(idListInput).value);
}
//判断idList是否为空	空:true	非空:false 
function isEmpty(idListInput){
	if($aaa(idListInput).value==null||$aaa(idListInput).value.length==0){
		alert("请至少选择一行数据！");
		return true;
	}else{
		return false;
	}
}
/**
 * 用于翻页的方法

 */
function turnPage(param){
	var page=$aaa("hdPage").value;
	var totalPage=$aaa("hdTotalPage").value;
	
	page=getPageNum(page,param,totalPage);
	
	var formObj=document.searchForm;
	var srcAction = formObj.action;
	
	var addUrl= "";
	if(srcAction.indexOf("?") >= 0){
		addUrl = "&currentPageNum="+page;
	}else{
		addUrl = "?currentPageNum="+page;
	}
	if($aaa("currentPageNum") != null){
		$aaa("currentPageNum").value = page;
	}
	//formObj.reset();
	formObj.action=srcAction+addUrl;
	formObj.submit();
}

/**
 * 计算页数
 * @param page
 * @param param
 * @param totalPage
 * @return
 */
function getPageNum(page,param,totalPage){
	page=page*1;
	totalPage=totalPage*1;
	switch(param){
	case 'first':
		page=1;
		break;
	case 'pre':
			page=page-1;
		break;
	case 'next':
			page=page+1;
		break;
	case 'last':
		page=totalPage;
		break;
	case 'goto':
		page=$aaa("page").value;
		page=page*1;
		if(page>totalPage){
			alert("超出页面范围,将转至最后一页!");
			page=totalPage;
		}
		break;	
	}
	return page;
	
}

function show(id){
	if($aaa(id).style.display=='none')
		$aaa(id).style.display='';
	else if($aaa(id).style.display=='')
		$aaa(id).style.display='none';
}

/**
 * 根据值找到select选中项

 * @param objName
 * @param val
 * @return
 */
function set_objSelect(objName,val){
	obj = $aaa(objName);
	if(obj!=null){
		var len = obj.length;
		var selectP = -1;
		for(i=0;i<len;i++) {
			if(obj[i].value==val){
				selectP = i;
				break;
			}
		}
		if(selectP>=0) obj.options[selectP].selected = true;
	}
}

function set_objValue(objName,val){
	obj = $aaa(objName);
	if(obj!=null){
		var len = obj.length;
		var selectP = -1;
		for(i=0;i<len;i++) {
			if(obj[i].value==val){
				selectP = i;
				break;
			}
		}
		if(selectP>=0) obj.options[selectP].selected = true;
	}
}

function set_SelectCheck(objName,val){
	try{
		obj = document.getElementsByName(objName);
		if(obj!=null){
			var opt = obj[0].options;
			var len = opt.length;
			var selectP = -1;
			for(var i=0;i<len;i++) {
				if(opt[i].value==val){
					selectP = i;
					break;
				}
			}
			if(selectP>=0) opt[selectP].selected = true;
		}
	}catch (e) {
		
	}
}
