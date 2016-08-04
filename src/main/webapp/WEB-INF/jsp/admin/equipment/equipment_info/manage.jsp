<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/equipmentInfo/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加设备
		</a>
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
									<input id="form-field-1" name="equipmentId" type="text" value="${queryCondition.equipmentId }" class="col-xs-10 col-sm-3" style="width: 180px;"/>
									<lable style="line-height:32px;" class="col-sm-1 control-label no-padding-right" for="form-field-1">设备名称：</lable>
									<input id="form-field-2" name="equipmentName" type="text" value="${queryCondition.equipmentName }" class="col-xs-10 col-sm-3" style="width: 180px;"/>
									<lable style="line-height:32px;" class="col-sm-1 control-label no-padding-right" for="form-field-1" >设备类型：</lable>
									<input id="form-field-3" name="equipmentType.typeName" type="text" value="${queryCondition.equipmentType.typeName }" class="col-xs-10 col-sm-3" style="width: 180px;"/>
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
						<th>设备编号</th>
						<th>设备名称</th>
						<th>生产厂商</th>
						<th>设备类型  </th>
						<th>是否公用</th>
						<th>操作  </th>
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
							<td>${equipment.manufacturer.name}</td>
							<td>${equipment.equipmentType.typeName}</td>
							<td>
							<c:if test="${equipment.orPublic == 1}"><span class="label label-sm label-warning">公用</span></c:if>
							<c:if test="${equipment.orPublic == 2}"><span class="label label-sm label-success">非公用</span></c:if>
							</td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="green" href="/admin/equipmentInfo/viewEdit?id=${equipment.id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>
									<a class="red" href="/admin/equipmentInfo/delete?id=${equipment.id}"
										onclick="javascript:return confirm_delete('${equipment.id}')">
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
		<div>
			
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
		//$("input[name='username']").attr("value","");
		//$("input[name='organizationNmae']").attr("value","");
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
</script>