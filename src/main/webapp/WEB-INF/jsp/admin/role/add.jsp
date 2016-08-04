<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="page-header">
	<h1>
		添加角色
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" action="/admin/role/add" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 角色名 </label>
				<div class="col-sm-9">
					<input name="name"
						type="text" id="form-field-1" placeholder="Role Name" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="parentSel"> 请选择机构 </label>
				<div class="col-sm-4">
					<div class="clearfix input-group">
					<input value="" name="organ" type="text"
						onclick="showMenu()" id="parentSel" placeholder="choose"
						class="col-xs-10 col-sm-12" readonly="readonly" />
					<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;" onclick="showMenu()">
							<i class="fa fa-cog"></i>
					</span>
					<input name="organizationID" id="organization" value="" type="hidden"/>
					</div>
				</div>		
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-select-1"> 请选择角色类型</label>
				
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="role_type" class="col-xs-10 col-sm-5" 
							id="form-field-select-1" data-placeholder="选择一个角色类型">
							<c:forEach var="item" items="${ roleTypeList }">
								<option value="${ item.id }">${ item.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div id="menuContent" class="menuContent" style="display: none; position: absolute;z-index: 999">
				<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 180px; height: 300px;"></ul>
			</div>
			<div class="hr hr-16 hr-dotted"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 选择资源 </label>
	
				<div class="col-sm-8">
					<ul id="moduleTree" class="ztree" style="height: 300px;"></ul>
					<input type="hidden" name="multiSelect" id="modules">
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
var setting = {
	check : {
		enable : true,
		chkStyle : "radio",
		radioType : "all"
	},
	view : {
		dblClickExpand : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : onClick,
		onCheck : onCheck
	}
};

var zNodes = eval('${organTree}');
function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}

function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
			.getCheckedNodes(true), v = "",id="";
	for ( var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
		id += nodes[i].id+",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);
	if (id.length > 0)
		id = id.substring(0, id.length - 1);
	var parentName = $("#parentSel");
	var organization = $("#organization");
	parentName.attr("value", v);
	organization.attr("value",id);
}

function showMenu() {
	var parentObj = $("#parentSel");
	var parentOffset = $("#parentSel").offset();
	$("#menuContent").css({
		left : parentOffset.left + "px",
		top : 50+parentObj.outerHeight()+ "px"
	}).slideDown("fast");
	$("#treeDemo_1_ico").attr("class","button ico_open");
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "citySel"
			|| event.target.id == "menuContent" || $(event.target).parents(
			"#menuContent").length > 0)) {
		hideMenu();
	}
}
//资源tree begin
var setting2 = {
	check : {
		enable : true,
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onCheck : treeOnCheck
	}
};

function treeOnCheck(e, treeId, treeNode){
	var zTree = $.fn.zTree.getZTreeObj("moduleTree");
	var nodes = zTree.getCheckedNodes(true);
	var v = "",id="";
	for ( var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
		id += nodes[i].id+",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);
	if (id.length > 0)
		id = id.substring(0, id.length - 1);
	var modules = $("#modules");
	modules.attr("value",id);
}

var moduleTree = eval('${moduleTree}');
$(window).load(function(){
	$.fn.zTree.init($("#moduleTree"), setting2, moduleTree);
});
</script>