<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">

<div class="page-header">
	<h1>添加机构绑定关系</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" action="/admin/binding/orga/add" method="post">
			<sec:authentication property="principal" var="authentication"/>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 机构绑定</label>
	
				<div class="col-sm-8">
					<ul id="organTree" class="ztree" style="height: 300px;"></ul>
					<ul id="organTree2" class="ztree" style="height: 300px;"></ul>
					<input type="hidden" name="orgaids" id="orgaSelect">
					<input type="hidden" name="roleids" id="roleSelect">
					<input type="hidden" name="orgaJsonObj" id="orgaJsonObj">
					<input type="hidden" name="roleJsonObj" id="roleJsonObj">
				</div>
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit">
						<i class="ace-icon fa fa-check bigger-110"></i>
						Submit
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						Reset
					</button>
				</div>
			</div>
			
		</form>	
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">

//资源tree begin
var setting2 = {
	check : {
		enable: true,
		chkboxType: { "Y" : "", "N" : "" }
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback : {
		onCheck: treeOnCheck
	}
};

var setting = {
	check : {
		enable: true,
		chkboxType: { "Y" : "", "N" : "" }
	},
	data: {
		simpleData: {
			enable: true
		}
	}
	,
	callback : {
		onCheck: treeOnCheck2
	}
};

function treeOnCheck2(e, treeId, treeNode){
	var zTree = $.fn.zTree.getZTreeObj("organTree2");
	var nodes = zTree.getCheckedNodes(true);

	var id_array = new Array();
	var name_array = new Array();
	var jsonObj = {};
	for (var i = 0, l = nodes.length; i < l; i++) {
		jsonObj[nodes[i].id] = nodes[i].name;
		id_array[i] = nodes[i].id;
		name_array[i] = nodes[i].name;
	}
	
	$("#roleSelect").attr("value", id_array.sort(function(x, y) {
		return (x - y);
	}));
	$("#roleJsonObj").attr("value", JSON.stringify(jsonObj));
}

function treeOnCheck(e, treeId, treeNode){
	var zTree = $.fn.zTree.getZTreeObj("organTree");
	var nodes = zTree.getCheckedNodes(true);
	var id = "";
	
	var id_array = new Array();
	var jsonObj = {};
	for (var i = 0, l = nodes.length; i < l; i++) {
		id += nodes[i].id + ",";
		jsonObj[nodes[i].id] = nodes[i].name;
		id_array[i] = nodes[i].id;
	}
	
	if (id.length > 0)
		id = id.substring(0, id.length - 1);
	
	$("#orgaSelect").attr("value", id_array.sort(function(x, y) {
		return (x - y);
	}));
	$("#orgaJsonObj").attr("value", JSON.stringify(jsonObj));
	
	var select = $('#organTree2');
	$.ajax({
		type: "POST",
		url: "ajax/getOrgaRoles?t=" + new Date().getTime(),
		data: { orgaids: id },
		success:function(data){
			$.fn.zTree.init($("#organTree2"), setting, data);
		}
	});
}

var organTree = eval('${organTree}');
$(window).load(function(){
	$.fn.zTree.init($("#organTree"), setting2, organTree);
});

</script>