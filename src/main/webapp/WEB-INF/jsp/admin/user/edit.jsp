<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="page-header">
	<h1>
		编辑用户
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form id="validation-form-update" class="form-horizontal"  role="form" action="/admin/user/edit" method="post">
			<input type="hidden" name="id" value="${user.id}">
			<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 用户名 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="username" value="${user.username}" 
							type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 新密码 </label>

				<div class="col-sm-9">
					<input name="password" value="" type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" />
					<span class="help-inline col-xs-12 col-sm-7">
						<span class="middle">不填写则不改变密码</span>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 类型</label>
				
				<div class="col-sm-9">
					<select name="typeid" class="col-xs-10 col-sm-5" id="form-field-select-1" data-placeholder="选择用户类型">
						<c:forEach var="type" items="${ types }">
							<c:if test="${not empty user.userType}">
								<c:if test="${ user.userType.id == type.id }">
									<option selected="selected" value="${ type.id }">${ type.name }</option>
								</c:if>
								<c:if test="${ user.userType.id != type.id }">
									<option value="${ type.id }">${ type.name }</option>
								</c:if>
							</c:if>
							<c:if test="${empty user.userType}">
								<option value="${ type.id }">${ type.name }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="parentSel"> 请选择机构 </label>
				<div class="col-sm-4">
					<div class="clearfix input-group">
					<input value="${organ.name }" name="organ" type="text"
						onclick="showMenu()" id="parentSel" placeholder="choose"
						class="col-xs-10 col-sm-12" readonly="readonly" />
					<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;" onclick="showMenu()">
							<i class="fa fa-cog"></i>
					</span>
					<input name="organizationID" id="organization" value="${organ.id}"" type="hidden"/>
					<input name="old_organizationID" value="${organ.id}"" type="hidden"/>
					</div>
				</div>		
			</div>
			<div id="menuContent" class="menuContent"
					style="display: none; position: absolute;z-index: 999">
					<ul id="treeDemo" class="ztree"
						style="margin-top: 0; width: 180px; height: 300px;"></ul>
				</div>
			<div class="hr hr-16 hr-dotted"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist">角色选择</label>
	
				<div class="col-sm-8">
					<select multiple="multiple" size="10" name="multiSelect" id="duallist">
						<c:set var="status" value="1"></c:set>
						<c:forEach var="role" items="${roles}">
							<c:forEach var="srole" items="${user.roles}">
								<c:if test="${role.id == srole.id}">
									<c:set var="status" value="2"></c:set>
								</c:if>
							</c:forEach>
							<c:choose>
								<c:when test="${status == 2}">
									<option value="${role.id}" selected="selected">${role.name}</option>
								</c:when>
								<c:otherwise>
									<option value="${role.id}">${role.name}</option>
								</c:otherwise>
							</c:choose>
							<c:set var="status" value="1"></c:set>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 使用状态 </label>

				<input name="selectStatus" id="id-button-borders" type="checkbox"  class="ace ace-switch ace-switch-5" 
				<c:if test="${user.status == 1 }">
					checked="checked"
				</c:if>
				/>
				<span class="lbl middle"></span>
			</div>
			<div class="hr hr-16 hr-dotted"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="moduleTree"> 该用户拥有的权限 </label>
				<div class="col-sm-8">
					<ul id="moduleTree" class="ztree" style="height: 300px;"></ul>
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
<script src="/static/js/customjs/user.js"></script>
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

var zNodes = eval('${zTreeOrgan}');
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
	drawRoleSel(id);
}

function showMenu() {
	var parentObj = $("#parentSel");
	var parentOffset = $("#parentSel").offset();
	$("#menuContent").css({
		left : parentOffset.left + "px",
		top : 145+parentObj.outerHeight()+ "px"
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
var defaultModule = eval('${zTreeModule}');
$(window).load(function(){
	$.fn.zTree.init($("#moduleTree"), setting2, defaultModule);
});
	
</script>