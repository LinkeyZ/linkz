<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/demo.css" type="text/css">
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
 
<div class="page-header">
	<h1>
		编辑设备
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form id="validation-form" class="form-horizontal" role="form" action="/admin/equipmentInfo/add" method="post">
		  <div class="form-group">
					<label class="col-sm-3 control-label no-padding-top" for="parentSel">选择机构
					</label>
					<div class="col-sm-4">
						<div class="clearfix input-group">
						<input value="${organ.name }" name="organ" type="text"
							onclick="showMenu()" id="parentSel" placeholder="choose"
							class="col-xs-10 col-sm-12" readonly="readonly" />
						<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;" onclick="showMenu()">
								<i class="fa fa-cog"></i>
						</span>
						<input name="organizationID" id="organization" value="${organ.id }" type="hidden"/>
						</div>
					</div>
					<div id="menuContent" class="menuContent" 
						style="display: none; position: absolute;z-index: 999">
						<ul id="treeDemo" class="ztree"
							style="margin-top: 0; width: 275px; height: 300px;"></ul>
					</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1">设备编号</label>
				<div class="col-sm-9">
				<input name="equipmentId" type="text" id="form-field-1" placeholder="请输入设备编号" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1">设备名称</label>
				<div class="col-sm-9">
				<input name="equipmentName" type="text" id="form-field-1" placeholder="请输入设备名称" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1">设备类型</label>
				<div class="col-sm-9">
					<select name="equipmentType" class="col-xs-10 col-sm-5" id="form-field-select-1" data-placeholder="选择设备类型" >
						<c:forEach var="type" items="${typeList}">
							<option value="${type.typeId}">${type.typeName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1">生产厂商</label>
				<div class="col-sm-9">
					<select  name="manufacturer"  class="col-xs-10 col-sm-5" id="form-field-select-1" data-placeholder="选择生产厂商">
						<c:forEach var="mf" items="${mfList}">
							<option value="${mf.id}">${mf.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1">是否公用</label>
				<div class="col-sm-9"> 
				  <input type="radio" value=1  class="ace" name="orPublic" onclick="hideLimitDiv()"><span class="lbl">公用</span>&nbsp;&nbsp;
				  <input type="radio" value=2  class="ace" name="orPublic" onclick="showLimitDiv()"><span class="lbl">非公用</span>
				</div>
			</div>
			<div class="form-group" id="limitDiv">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1">用户上限</label>
				<div class="col-sm-9">
				<input name="equipmentBindLimit" type="text" id="form-field-1" placeholder="请输入设备用户绑定上限人数" class="col-xs-10 col-sm-5" />
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
	$("#logmap_tmpl").change(function(){});

	function showMenu() {
		var parentObj = $("#parentSel");
		var parentOffset = $("#parentSel").offset();
		$("#menuContent").css("margin-top","33px");
		$("#menuContent").css({
			left:parentOffset.left + "px"
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

	function hideLimitDiv(){
		$("#limitDiv").hide();
		}
	function showLimitDiv(){
		$("#limitDiv").show();
		}
	
</script>