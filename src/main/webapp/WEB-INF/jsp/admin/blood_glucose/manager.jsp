<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>血糖管理</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
<!-- 		<a href="/admin/role/add" class="btn btn-primary"> -->
<!-- 			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i> -->
<!-- 			添加血糖信息 -->
<!-- 		</a> -->
		<a href="/admin/bloodGlucose/statistics" class="btn btn-primary" target="_block">
			血糖趋势图
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">
		血糖历史记录
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
						<th>血糖值</th>
						<th>血糖类型</th>
						<th>测量时间</th>
						<th>内容</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bloodGlucose" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${bloodGlucose.userId}</td>
							<td>${bloodGlucose.glu}</td>
							<td>
								<c:if test="${bloodGlucose.gluType == 0}">空腹</c:if>
								<c:if test="${bloodGlucose.gluType == 1}">餐前</c:if>
								<c:if test="${bloodGlucose.gluType == 2}">餐后</c:if>
								<c:if test="${bloodGlucose.gluType == 3}">睡前</c:if>
							</td>
							<td><fmt:formatDate value="${bloodGlucose.measurementDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${bloodGlucose.content}</td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<!-- <a class="green" href="/admin/user/edit?id=${bloodGlucose.id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>

									<a class="red" href="/admin/user/delete?id=${bloodGlucose.id}"
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
