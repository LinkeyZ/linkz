<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/role/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加角色
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">
			${ tableHeader }
		</div>
		
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
						<th>角色名</th>
						<th>资源列表</th>
						<th>机构名</th>
						<th>角色类型</th>
						<th class="hidden-480">注册时间</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="role" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${role.name}</td>
							<td>
								<c:if test="${not empty role.display}">
								<a class="btn btn-minier btn-success data-poload" role_id="${role.id}">查看</a>
								</c:if>
							</td>
							<td>
								<a href="/admin/user/ajax/get_parent_node?orgid=${role.organization.id}" onclick="return nothing()" class="data-poload-org" style="cursor: pointer;text-decoration: none;">
								${role.organization.name}</a>
							</td>
							<td>${ role.roleType.name }</td>
							<td>${role.createDate}</td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
									<a class="green" href="/admin/role/edit?id=${role.id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>

									<a class="red" href="/admin/role/delete?id=${role.id}" 
										onclick="javascript:return confirm_delete()">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="orgTree_div" style="display: none;">
				<ul id="orgTree" class="ztree"></ul>
			</div>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<div id="modal-form" class="modal" tabindex="-2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">拥有的资源</h4>
			</div>
			<div class="modal-body overflow-visible">
			<ul id="moduleTree" class="ztree"></ul>
			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-sm btn-danger pull-right">
					<i class="ace-icon fa fa-times"></i>
					关闭
				</button>
			</div>
</div>
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>

<script>
var setting = {data: {simpleData: {enable: true}}};
$('.data-poload-org').on('shown.bs.popover', function(){
    $('.arrow').css("top","30px");
 });
$(".data-poload-org").popover({
	trigger: "manual" , html: true, animation:false,title: '机构列表', placement:'right',
	content: function(){
		return details_in_org($(this).attr('href'));
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
$(".data-poload").on('click',function(){
	details_in_module($(this).attr('role_id'));
	var treeObj = $.fn.zTree.getZTreeObj("moduleTree");
	if(treeObj != null){
		var nodes = treeObj.getNodes();
		for (var i = nodes.length-1; i >= 0; i--) {
		    treeObj.removeNode(nodes[i]);
		}
	}
	$("#modal-form").modal('show');
	return false;
});

function details_in_module(id){
	$.ajax({
		url:"/admin/user/ajax/getModules",
		data:{multiSelect:id},
		success:function(data){
			$.fn.zTree.init($("#moduleTree"), setting, data);
		}
	});
	return;
}

function details_in_org(link){
	$.ajax({
		url:link,
		success:function(data){
			$.fn.zTree.init($("#orgTree"), setting, data);
		}
	});
	return  $("#orgTree_div").html();
}
	
function confirm_delete() {
	var msg = "您真的确定要删除该角色吗，删除后该角色下得用户将不可使用？\n\n请确认！"; 
	if (confirm(msg) == true){ 
		return true;
	} else { 
		return false; 
	} 
};
function nothing(){
	return false;
}
</script>
