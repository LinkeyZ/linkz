<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link href="/static/jquery-easyui-1.3.4/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="/static/jquery-easyui-1.3.4/themes/icon.css" rel="stylesheet" type="text/css" />
<script src="/static/js/jquery-1.9.1.min.js"></script>
<script src="/static/jquery-easyui-1.3.4/jquery.easyui.min.js" type="text/javascript"></script>
<script src="/static/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>

</head>
<body>
	<h2>I am coming!!</h2>
	<div>
		<table id="tt" style="width:600px;height:400px"></table>
	</div>
</body>
<script type="text/javascript">

$(function(){
	$('#tt').treegrid({
	    url:'/admin/organization/getOrgList',
	    idField:'id',
	    treeField:'name',
	    columns:[[
			{field:'name',title:'机构名',width:180},
			{field:'description',title:'描述',width:60,align:'right'},
			{field:'organizationType',title:'机构类型',width:80},
			{field:'address',title:'地址',width:80},
			{field:'contact',title:'联系方式',width:80},
			{field:'startDate',title:'创建日期',width:80}
	    ]]
	});
});
</script>
</html>