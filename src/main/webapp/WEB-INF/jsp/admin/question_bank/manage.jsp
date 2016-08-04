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
		<a href="/admin/question_bank/add" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加试题
		</a>
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">${ tableHeader }</div>
		
		<div>
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>试题编码</th>
						<th>试题名称</th>
						<th>试题题型</th>
						<th>试题类型</th>
						<th>使用状态</th>
						<th>创建日期</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${ questionBankList }">
					<tr>
						<td>${ item.questionCode }</td>
						<td>${ item.title }</td>
						<td>
							<c:if test="${ item.type == 1 }">
								<span class="label label-sm label-success">单选</span>
							</c:if>
							<c:if test="${ item.type == 2 }">
								<span class="label label-sm label-success">多选</span>
							</c:if>
							<c:if test="${ item.type == 3 }">
								<span class="label label-sm label-success">填空</span>
							</c:if>
							<c:if test="${ item.type == 4 }">
								<span class="label label-sm label-success">单选+填空</span>
							</c:if>
							<c:if test="${ item.type == 5 }">
								<span class="label label-sm label-success">多选+填空</span>
							</c:if>
						</td>
						<td>${ item.questionType.name }</td>
						<td>
							<c:if test="${ item.flag == 1 }">
								<span class="label label-sm label-success">启用</span>
							</c:if>
							<c:if test="${ item.flag == 0 }">
								<span class="label label-sm label-warning">禁用</span>
							</c:if>
						</td>
						<td><fmt:formatDate value="${ item.createDate }" pattern="yyyy-MM-dd"/></td>
						<td>
							<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
								<a class="blue data-poload" href="#" qid="${ item.id }">
									<i class="ace-icon fa fa-search bigger-130"></i>
								</a>
								
								<a class="green" href="/admin/question_bank/edit?id=${item.id}">
									<i class="ace-icon fa fa-pencil bigger-130"></i>
								</a>

								<a class="red" href="/admin/question_bank/delete?id=${item.id}" 
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
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
			            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span></button>
			            <h4 class="modal-title" id="modal-title">你吃饭了吗？</h4>
					</div>
					<div class="modal-body" id="modal-body">
						<p>选项A：</p>
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
		        </div>
			</div>
		</div>			
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<script>
$(".data-poload").on('click',function(){
	$.ajax({
		url: "/admin/question_bank/get",
		data: { "id": $(this).attr('qid')},
		success:function(data){
			$("#modal-title").text(data['title']);
			$("#modal-body").html(data['body']);
		}
	});
	
	$("#myModal").modal('show');
	return false;
});
</script>