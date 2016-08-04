<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
</div><!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
			<div>
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
						<th class="center">成员名称</th>
						<th>类型</th>
						<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input name="multiSelect" type="checkbox" class="ace" value="${user[0].id }"/>
									<span class="lbl"></span>
								</label>
							</td>
							<td class="center">${user[0].username }</td>
							<td>${user[0].userType.name}</td>
							<td class="center">
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="red" href="/admin/groups/addusertogroup?id=${groupid}&userid=${user[0].id }">
										<i class="ace-icon fa fa-pencil-square-o bigger-130"></i>添加为成员
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
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>
