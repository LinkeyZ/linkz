<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="principal" />
<sec:authentication property="principal" var="authentication"/>
<div class="page-header">
	<h1>
		MeatBall
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			概述 &amp; 统计
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/goods/addGoods" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加商品
		</a>
		<a href="/user/getUserRole" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			用户测试
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">${ tableHeader }</div>
		
		<div>
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>商品编码</th>
						<th>商品名称</th>
						<th>商品类型</th>
						<th>使用状态</th>
						<th>创建日期</th>
						<th>截止试用日期</th>
						<th>创建人</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="goods" items="${ goodsList }">
					<tr>
						<td>${ goods.goodsId}</td>
						<td>${ goods.goodsName }</td>
						<td>${ goods.goodsType.goodsTypeName }</td>
						<td>
							<c:if test="${ goods.isValid == 200 }">
								<span class="label label-sm label-success">启用</span>
							</c:if>
							<c:if test="${ goods.isValid == 300 }">
								<span class="label label-sm label-warning">禁用</span>
							</c:if>
						</td>
						<td><fmt:formatDate value="${ goods.createTime }" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${ goods.endTime }" pattern="yyyy-MM-dd"/></td>
						<td>${goods.createMan }</td>
						<td>
							<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
								<a class="blue data-poload" href="#" qid="${ goods.goodsId }">
									<i class="ace-icon fa fa-search bigger-130"></i>
								</a>
								
								<a class="green" href="/goods/updateGoods?id=${goods.goodsId}">
									<i class="ace-icon fa fa-pencil bigger-130"></i>
								</a>

								<a class="red" href="/admin/delGoods?id=${goods.goodsId}" 
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
<div class="row">
	<div class="col-xs-12">
			
	</div><!-- /.col -->
</div>
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
