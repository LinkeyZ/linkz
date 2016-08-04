<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<div class="page-header">
	<h1>任务计划管理</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<h3 class="header smaller lighter blue">计划中的任务</h3>
		<table id="simple-table" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>任务名</th>
					<th>任务组</th>
					<th>
						<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
						时间表达式
					</th>
					<th>状态</th>
					<th>备注</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="job" items="${ plannedTasks }">
				<tr>
					<td>${ job.name }</td>
					<td>${ job.group }</td>
					<td>${ job.cronExpression }</td>
					<td>${ job.status }</td>
					<td>${ job.description }</td>
					<td></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-info" href="/admin/cronjob/add">
			<i class="ace-icon fa fa-check bigger-110"></i>
			添加计划任务
		</a>
		<h3 class="header smaller lighter blue">运行中的任务</h3>
		<table id="simple-table" class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th class="center">
						<label class="pos-rel">
							<input type="checkbox" class="ace" />
							<span class="lbl"></span>
						</label>
					</th>
					<th>任务名</th>
					<th>任务组</th>
					<th>
						<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
						时间表达式
					</th>
					<th>状态</th>
					<th>备注</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="job" items="${ runningTasks }">
				<tr>
					<td class="center">
						<label class="pos-rel">
							<input type="checkbox" class="ace" />
							<span class="lbl"></span>
						</label>
					</td>
					<td>${ job.name }</td>
					<td>${ job.group }</td>
					<td>${ job.cronExpression }</td>
					<td>${ job.status }</td>
					<td>${ job.description }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>	
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>