<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>
		题库管理
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/questionBank/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加试题
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
						<th>类型</th>
						<th>科目</th>
						<th>题目内容</th>
						<th>录入时间</th>
						<th>是否可用</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
		           <c:forEach items="${page.items}" var="t" varStatus="status">
		             <tr>
		                <td class="center">
							<label class="pos-rel">
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>
		                	<td>
		                	  <c:choose>
		                		<c:when test="${t.type == 1}">单选题</c:when>
		                		<c:when test="${t.type == 2}">多选题</c:when>
		                		<c:when test="${t.type == 3}">判断题</c:when>
		                		<c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
		                	<td>
		                	  <c:choose>
		                	    <c:when test="${t.catalog == 1}">中医</c:when>
		                	    <c:when test="${t.catalog == 2}">西医</c:when>
		                	    <c:when test="${t.catalog == 3}">运动</c:when>
		                	    <c:when test="${t.catalog == 4}">饮食</c:when>
		                	    <c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
		                	<td>${t.content}</td>
		                	<td>${t.createTime}</td>
		                	<td>
		                	  <c:choose>
		                	    <c:when test="${t.isvalid == -1}">不可用</c:when>
		                	    <c:when test="${t.isvalid == 0 }">可用</c:when>
		                	    <c:otherwise>未配置</c:otherwise>
		                	  </c:choose>
		                	</td>
		                <td>
							<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
								<a class="green" href="/admin/questionBank/update?id=${t.id}">
									<i class="ace-icon fa fa-pencil bigger-130"></i>
								</a>

								<a class="red" href="/admin/questionBank/del?id=${t.id}" 
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