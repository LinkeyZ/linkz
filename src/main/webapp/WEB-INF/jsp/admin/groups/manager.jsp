<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a name="addGroup" href="#" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加群组
		</a>
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
						<th>群组ID</th>
						<th>群组名称</th>
						<th>描述</th>
						<th>成员数量</th>
						<th>创建时间</th>
						<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="group" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${group.groupid}</td>
							<td>${group.name}</td>
							<td>${group.descscription}</td>
							<td>${group.affiliations_count}</td>
							<td>${group.createDate}</td>
							<td class="center">
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="red" href="/admin/groups/addmembers?id=${group.id}">
										<i class="ace-icon fa fa-pencil-square-o bigger-130"></i>添加成员
									</a>
									<a class="green" href="/admin/groups/members?id=${group.id}">
										<i class="ace-icon fa fa-search bigger-130"></i>查看成员
									</a>
									<a class="red" href="/admin/groups/delete?id=${group.id}"
										onclick="javascript:return confirm_delete('')">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>删除群组
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<!-- save from brgin -->
<form  role="form" id="save-form"  action="/admin/groups/add" method="post" >
<div id="modal-form-save" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">添加群组</h4>
			</div>
			<input type="hidden" name="parentId" value=""/>
			<div class="modal-body overflow-visible">
				<div class="row">
					<div class="col-xs-12">
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">群组名称:</label>
								<input name="name" class="input-large" type="text" id="form-field-name" placeholder="请输入群组名称" value="" />
						</div>
						
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">群组描述:</label>
								<input name="descscription" class="input-large" type="text" id="form-field-name" placeholder="请输入群组描述" value="" />
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="icon-remove"></i>
					取消
				</button>
				<button id="submitUpdate" class="btn btn-sm btn-primary">
					<i class="icon-ok"></i>
					确认添加
				</button>
			</div>
		</div>
	</div>
	</div>
</form>
<!-- save from end -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.raty.min.js"></script>
<script>
	$("a[name='addGroup']").on('click',function(){
		$('#modal-form-save').modal('show');
	});

</script>