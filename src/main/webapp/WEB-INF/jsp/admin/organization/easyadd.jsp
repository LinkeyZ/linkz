<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
	<title>Basic Layout - jQuery EasyUI Demo</title>
	<link href="/static/jquery-easyui-1.3.4/themes/default/easyui.css" rel="stylesheet" type="text/css" />
	<link href="/static/jquery-easyui-1.3.4/themes/icon.css" rel="stylesheet" type="text/css" />
	<script src="/static/js/jquery-1.9.1.min.js"></script>
	<script src="/static/jquery-easyui-1.3.4/jquery.easyui.min.js" type="text/javascript"></script>
	<script src="/static/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>

</head>
<body>
	<form id="ff" method="post">   
	    <div>   
	        <label for="name">名称：</label>   
	        <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />   
	    </div>
	    <div>   
	        <label for="description">描述：</label>
	        <input class="easyui-validatebox" type="text" name="description" data-options="required:true" />   
	    </div>
	    <div>   
	        <label>上级机构</label>  
	    	<input id="cc" name="parentId">
	    </div>
	    <div>
	    	<label>类型</label>  
	    	<input id="orgType" name="organizationType">
	    </div>
	    <div>
	        <label for="contact">联系方式：</label>   
	        <input class="easyui-validatebox" type="text" name="contact" data-options="required:true" />   
	    </div>   
	    <div>   
	        <label for="address">地址：</label>   
	        <input class="easyui-validatebox" type="text" name="address" data-options="required:true" />   
	    </div>
	    <div>
	    	<input type="submit" onclick="subOrg()">
	    </div>
	</form>
</body>
<script type="text/javascript">
$(function(){
	$.ajax({ 
		url: "/admin/organization/getOrgTreeName", 
		type:"get",
		dataType:"json",
		success: function(data){
			$('#cc').combotree('loadData', data);
			$('#orgType').combotree('loadData',[{
					id: 1,
					text: '医院'
				},{
					id: 2,
					text: '机构'
				},{
					id: 3,
					text:'科室'
				}]);
      }});
	//下拉机构列表
	$('#cc').combotree({});
	
	//下拉机构类型
	$('#orgType').combotree({
	});
});

function subOrg(){
	$('#ff').form({
	    url:'/admin/organization/addOrg',
	    onSubmit: function(){    
	    	var isValid = $(this).form('validate');
			if (!isValid){
				$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
			}
			return isValid;	// 返回false终止表单提交

	    },    
	    success:function(data){
	    	//跳转
	    	window.parent.location.href='/admin/organization/list';
	    }    
	});    
}

</script>
</html>

