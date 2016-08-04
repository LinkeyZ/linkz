<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>体重管理</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/role/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加体重信息
		</a>
		<a href="/admin/weight/statistics" class="btn btn-primary" target="_block">
			体重趋势图
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">
		Results for "Latest Registered Domains"
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
						<th>用户名</th>
						<th>体重(kg)</th>
						<th>身高(m)</th>
						<th>BMI</th>
						<th>测量时间</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="weight" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${weight.userId}</td>
							<td>${weight.weight}</td>
							<td>${weight.height}</td>
							<td>${weight.bmi}</td>
							<td><fmt:formatDate value="${weight.measurementDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="green" href="/admin/user/edit?id=${weight.id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>

									<a class="red" href="/admin/user/delete?id=${weight.id}"
										onclick="javascript:return confirm_delete()">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>
									</a>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>
