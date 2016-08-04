<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="page-header">
	<h1>
		添加资源模块
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" id="validation-form"  action="/admin/module/add" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 资源模块名 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="name" type="text" id="form-field-1" placeholder="Name" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 资源地址 </label>

				<div class="col-sm-9">
					<input name="url"
						type="text" id="form-field-2" placeholder="Url" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="parentSel"> 资源父级 </label>

				<div class="col-sm-4">
					<div class="clearfix input-group">
					<input value="" name="parentName" type="text"
						onclick="showMenu()" id="parentSel" placeholder="choose"
						class="col-xs-10 col-sm-12" readonly="readonly" />
					<input name="parentId" id="parentId" value="" type="hidden"/>
					<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;" onclick="showMenu()">
							<i class="fa fa-cog"></i>
					</span>
					</div>
				</div>
				<div id="menuContent" class="menuContent"
					style="display: none; position: absolute;z-index: 999">
					<ul id="treeDemo" class="ztree"
						style="margin-top: 0; width: 180px; height: 300px;"></ul>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-4"> 资源排序 </label>

				<div class="col-sm-9">
					<div class="clearfix">
					<input value="${module.priority}" name="priority" type="text"
						id="form-field-4" placeholder="资源排序顺序" class="col-xs-10 col-sm-5" />
					<span class="help-inline col-xs-12 col-sm-7">
						 <span class="middle red">
						 <i class="fa fa-exclamation-triangle"></i>该值将影响导航栏的排序
						 </span>
					</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-5"> 资源类型 </label>

				<div class="col-sm-9">
					<select id="form-field-4" name="type" class="col-xs-10 col-sm-5">
						<option value="1">导航</option>
						<option value="2">操作</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-6"> 备注 </label>
				<div class="col-sm-9">
					<input value="${module.remark}" name="remark" type="text"
						id="form-field-6" placeholder="remarks" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit" onclick="return onvalid()">
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
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>
<!-- zTree -->
<SCRIPT type="text/javascript">

function onvalid(){
	$('#validation-form').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules:{
			name:{
				required:true
			},
			parentName:{
				required:true
			},
			priority:{
				required:true,
				number:true
			}
		},
		messages:{
			name:{
				required:"<i class='fa fa-exclamation'></i>必填项"
			},
			parentName:{
				required:"<i class='fa fa-exclamation'></i>必填项"
			},
			priority:{
				required:"<i class='fa fa-exclamation'></i>必填项",
				number:"<i class='fa fa-exclamation'></i>请输入合法的数字"
			}
		},
		highlight:function(e){
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight:function(e){
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		},
		errorPlacement:function(error,element){
			error.insertAfter(element.parent());
		}
	});	
	return $("#validation-form").valid();
}
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

var zNodes = eval('${zTreeModule}');

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
	var parentId = $("#parentId");
	parentName.attr("value", v);
	parentId.attr("value",id);
}

function showMenu() {
	var parentObj = $("#parentSel");
	var parentOffset = $("#parentSel").offset();
	$("#menuContent").css({
		left : parentOffset.left + "px",
		top : 99+parentObj.outerHeight()+ "px"
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
</SCRIPT>
<!-- inline scripts related to this page -->
