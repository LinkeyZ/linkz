<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>${ title }</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/pedometer/statistics" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			计步趋势图
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
						<th>用户编号</th>
						<th>步数</th>
						<th>距离(km)</th>
						<th>能力消耗(kcal)</th>
						<th>运动时间(s)</th>
						<th>运动类型</th>
						<th>步长(cm)</th>
						<th>测量时间</th>
						<th>数据来源</th>
						<th>计步类型</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${ list }">
						<tr>
							<td>${ item.userid }</td>
							<td>${ item.steps }</td>
							<td>${ item.distance }</td>
							<td>${ item.energyConsumption }</td>
							<td>${ item.exerciseTime }</td>
							<c:if test="${ item.exerciseType == 'walking' }">
								<td>走路</td>
							</c:if>
							<c:if test="${ item.exerciseType == 'running' }">
								<td>跑步</td>
							</c:if>
							<td>${ item.stepLength }</td>
							<td><fmt:formatDate value="${ item.createDate }" pattern="yyyy年MM月dd日"/></td>
							<td>${ item.dataSource }</td>
							<c:if test="${ item.pedometerType == 0 }">
								<td>手动</td>
							</c:if>
							<c:if test="${ item.pedometerType == 1 }">
								<td>Bong手环</td>
							</c:if>
							<td>
								<div class="hidden-sm hidden-xs action-buttons">
									<a class="green" href="#">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>

									<a class="red" href="#"
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
