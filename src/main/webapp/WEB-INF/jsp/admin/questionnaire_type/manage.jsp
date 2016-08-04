<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>${ title }</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/questionnaire_type/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加问卷类型
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">${ tableHeader }</div>
		
		<div>
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>问卷类型名称</th>
						<th>使用状态</th>
						<th>备注</th>
						<th>创建者</th>
						<th>创建日期</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${ questionnaireTypeList }">
					<tr>
						<td>${ item.name }</td>
						<td>
							<c:if test="${ item.flag == 1 }">
								<span class="label label-sm label-success">启用</span>
							</c:if>
							<c:if test="${ item.flag == 0 }">
								<span class="label label-sm label-warning">禁用</span>
							</c:if>
						</td>
						<td>${ item.creator }</td>
						<td>${ item.remarks }</td>
						<td><fmt:formatDate value="${ item.createDate }" pattern="yyyy-MM-dd"/></td>
						<td>
							<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
								<a class="green" href="/admin/questionnaire_type/edit?id=${item.id}">
									<i class="ace-icon fa fa-pencil bigger-130"></i>
								</a>

								<a class="red" href="/admin/questionnaire_type/delete?id=${item.id}" 
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