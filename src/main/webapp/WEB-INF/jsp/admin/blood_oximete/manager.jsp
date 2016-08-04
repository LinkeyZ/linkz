<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>血氧管理</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
<!-- 		<a href="/admin/role/add" class="btn btn-primary"> -->
<!-- 			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i> -->
<!-- 			添加血氧信息 -->
<!-- 		</a> -->
		<a href="/admin/bloodOximete/statistics" class="btn btn-primary" target="_block">
			血氧趋势图
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">
		血氧历史记录
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
						<th>饱和度</th>
						<th>脉率</th>
						<th>测量时间</th>
						<th>内容</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bloodOximete" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td>${bloodOximete.userId}</td>
							<td>${bloodOximete.spo2}</td>
							<td>${bloodOximete.pr}</td>
							<td><fmt:formatDate value="${bloodOximete.measurementDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${bloodOximete.content}</td>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="green" href="/admin/user/edit?id=${bloodOximete.id}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>

									<a class="red" href="/admin/user/delete?id=${bloodOximete.id}"
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
