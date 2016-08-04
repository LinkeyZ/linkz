<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/user/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加用户
		</a>
		<div class="widget-box">
			<div class="widget-header widget-header-small">
				<h5 class="lighter">查询条件</h5>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<form class="form-search" href="/admin/user/manager">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<lable style="line-height:32px;" class="col-sm-1 control-label npadding-right" for="form-field-1">用户名：</lable>
									<input id="form-field-1" name="username" type="text" value="${queryCondition.username }" class="col-xs-10 col-sm-3"/>
									<lable style="line-height:32px;" class="col-sm-1 control-label no-padding-right" for="form-field-1">机构：</lable>
									<input id="form-field-1" name="organizationNmae" type="text" value="${queryCondition.organizationNmae }" class="col-xs-10 col-sm-3"/>
									<button type="reset" class="btn btn-sm">
										重置
										<i class="ace-icon fa fa-undo bigger-110"></i>
									</button>
									<button type="submit" class="btn btn-purple btn-sm">
										查询
										<i class="ace-icon fa fa-search bigger-110"></i>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		<div class="table-header">${ tableHeader }</div>
		<div>
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label class="pos-rel">
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</th>
						<th>用户名</th>
						<th>角色</th>
						<th>机构</th>
						<th>状态</th>
						<th class="hidden-480">类型</th>
						<th class="hidden-480">最后登录时间</th>
						<th>设备绑定</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${user[0].username}</td>
							<td>
							<!--  -->
							<c:if test="${not empty user[0].roles}">
								<c:forEach var="role" items="${user[0].roles}">
									${role.name}
								</c:forEach>
							</c:if>
							</td>
							<td>
								<a href="ajax/get_parent_node?orgid=${user[1].id}" onclick="return nothing()" class="data-poload" style="cursor: pointer;text-decoration: none;">
								${user[1].name}
								</a>
							</td>
							<td>
							<c:if test="${user[0].status == 0}"><span class="label label-sm label-warning">禁用</span></c:if>
							<c:if test="${user[0].status == 1}"><span class="label label-sm label-success">正常</span></c:if>
							</td>
							<td>${user[0].userType.name}</td>
							<td>${user[0].lastLoginTime}</td>
							<td><a class="red"  href="/admin/equipmentInfo/queryEquipmentList?userid=${user[0].id}">绑定管理</a></td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="green" href="/admin/user/edit?id=${user[0].id}&organizationID=${user[1].id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>
									<a class="red" href="/admin/user/delete?id=${user[0].id}&organizationID=${user[1].id}"
										onclick="javascript:return confirm_delete('${user[1].id}')">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="moduleTree_div" style="display: none;">
			<ul id="moduleTree" class="ztree"></ul>
			</div>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>
<script>
var setting = {data: {simpleData: {enable: true}}};
$(window).load(function(){
	$("button[type='reset']").on("click",function(){
		$("input[name='username']").attr("value","");
		$("input[name='organizationNmae']").attr("value","");
	});
	 $('.data-poload').on('shown.bs.popover', function(){
	       $('.arrow').css("top","30px");
	    });
	
	$(".data-poload").popover({
		trigger: "manual" , html: true, animation:false,title: '机构列表', placement:'right',
		content: function(){
			return details_in_popup($(this).attr('href'));
		}
	}).on("mouseenter", function () {
        var _this = this;
        $(this).popover("show");
        $(this).siblings(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
    }).on("mouseleave", function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) {
                $(_this).popover("hide");
            }
        }, 100);
    });
	function details_in_popup(link){
		$.ajax({
			url:link,
			success:function(data){
				$.fn.zTree.init($("#moduleTree"), setting, data);
			}
		});
		return  $("#moduleTree_div").html();
	}
	 
});
function confirm_delete(userid) {
	var msg = "您确定要删除该用户吗？\n\n请确认！"; 
	return confirm(msg); 
};
function nothing(){
	return false;
}

function bingequipment(userid){
	
	$("#modal-form-equipment").modal('show');
}

</script>

<%--<div id="modal-form-equipment" class="modal" tabindex="-1">
	<div class="modal-dialog" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">设备绑定</h4>
			</div>
			<input type="hidden" name="id" value=""/>
			<div class="modal-body overflow-visible">
				<div class="row">
					 <div class="col-xs-12">
						<div class="widget-box">
							<div class="widget-header widget-header-small">
								<h5 class="lighter">查询条件</h5>
							</div>
							<div class="widget-body">
								<div class="widget-main">
									<form class="form-search" href="/admin/equipmentInfo/manager">
										<div class="row">
											<div class="col-xs-12">
												<div class="form-group">
													<lable style="line-height:32px;" class="col-sm-1 control-label npadding-right" for="form-field-1">设备ID：</lable>
													<input id="form-field-1" name="equipmentId" type="text" value="" class="col-xs-10 col-sm-3" style="width: 180px;"/>
													<lable style="line-height:32px;" class="col-sm-1 control-label no-padding-right" for="form-field-1">设备名称：</lable>
													<input id="form-field-2" name="equipmentNmae" type="text" value="" class="col-xs-10 col-sm-3" style="width: 180px;"/>
													<lable style="line-height:32px;" class="col-sm-1 control-label no-padding-right" for="form-field-1" >设备类型：</lable>
													<input id="form-field-3" name="equipmentType" type="text" value="" class="col-xs-10 col-sm-3" style="width: 180px;"/>
													<button type="reset" class="btn btn-sm">
														重置
														<i class="ace-icon fa fa-undo bigger-110"></i>
													</button>
													<button type="submit" class="btn btn-purple btn-sm">
														查询
														<i class="ace-icon fa fa-search bigger-110"></i>
													</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="clearfix">
							<div class="pull-right tableTools-container"></div>
						</div>
						<div class="table-header">设备列表</div>
						<div>
							<table id="dynamic-table" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">
											<label class="pos-rel">
												<input type="checkbox" class="ace" />
												<span class="lbl"></span>
											</label>
										</th>
										<th>设备编号</th>
										<th>设备名称</th>
										<th>生产厂商</th>
										<th>设备类型  </th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="equipment" items="${page.items}">
										<tr>
											<td class="center">
												<label class="pos-rel">
													<input type="checkbox" class="ace" />
													<span class="lbl"></span>
												</label>
											</td>
											<td>${equipment.equipmentId}</td>
											<td>${equipment.equipmentName}</td>
											<td>${equipment.manufacturer}</td>
											<td>${equipment.equipmentType}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="moduleTree_div" style="display: none;">
							<ul id="moduleTree" class="ztree"></ul>
							</div>
						</div>
						<div>
							<div id="moduleTree_div" style="display: none;">
							<ul id="moduleTree" class="ztree"></ul>
							</div>
						</div>
						<!-- PAGE CONTENT ENDS -->
					</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="icon-remove"></i>
					关闭
				</button>
			</div>
		</div>
	</div>--%>