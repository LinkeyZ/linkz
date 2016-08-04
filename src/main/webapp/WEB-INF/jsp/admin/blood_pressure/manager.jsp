<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>血压管理</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/bloodPressure/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加血压信息
		</a>
		<a href="/admin/bloodPressure/statistics" target="_block" class="btn btn-primary">
			<i class="ace-icon fa  align-top bigger-125"></i>
			查看血压趋势图
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">
		血压历史记录
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
						<th>收缩压</th>
						<th>舒张压</th>
						<th>心率</th>
						<th>测量时间</th>
						<th>上传内容</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bloodPressure" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${bloodPressure.userId}</td>
							<td>${bloodPressure.systolic}</td>
							<td>${bloodPressure.diastolic}</td>
							<td>${bloodPressure.heartrate}</td>
							<td><fmt:formatDate value="${bloodPressure.measurementDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${bloodPressure.content}</td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<!-- <a class="green" href="/admin/bloodPressure/edit?id=${bloodPressure.id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>

									<a class="red" href="/admin/bloodPressure/delete?id=${bloodPressure.id}"
										onclick="javascript:return confirm_delete()">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>
									</a> -->
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
