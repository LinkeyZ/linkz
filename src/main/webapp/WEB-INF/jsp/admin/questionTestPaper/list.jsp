<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<script type="text/javascript">
	function getHref(paperId){
		var href = "/admin/testPaper/updateQuestions?paperId="+paperId;
		$("#updateId"+paperId).attr("href",href);
		$.ajax({ //一个Ajax过程 
			type: "post", //以post方式与后台沟通 
			url : "/admin/testPaper/writePaperIdSesstion", //与此php页面沟通 
			dataType:'json',//从php返回的值以 JSON方式 解释 
			data: "paperId="+paperId
			});
	};
</script>

<div class="page-header">
	<h1>
		问卷管理
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/testPaper/add?pn=1" class="btn btn-primary">
			<i class="ace-icon fa glyphicon-plus align-top bigger-125"></i>
			添加问卷
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
						<th>ID</th>
						<th>名称</th>
						<th>创建人</th>
						<th>录入时间</th>
						<th>是否可用</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
		           <c:forEach items="${list}" var="t" varStatus="status">
		             <tr>
		                <td class="center">
							<label class="pos-rel">
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>
		                <td>${t.id}</td>
		                <td>${t.title}</td>
		                <td>${t.createMan }</td> 
		                <td><fmt:formatDate value="${t.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		                <td>
		                	<c:choose>
		                	    <c:when test="${t.isvalid == -1}">不可用</c:when>
		                	    <c:when test="${t.isvalid == 0 }">可用</c:when>
		                	    <c:otherwise>未配置</c:otherwise>
		                	</c:choose>
		                </td>
		                <td>
							<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
								<a class="green" href="/admin/testPaper/paperDetail?id=${t.id }">
									<i class="ace-icon fa fa-pencil bigger-130"></i>试题详情
								</a>
								<a class="red" id="updateId${t.id }" onclick="getHref(${t.id})">
									<i class="ace-icon fa fa-trash-o bigger-130"></i>修改
								</a>
								<a class="green" href="/admin/testPaper/del?id=${t.id}">
									<i class="ace-icon fa fa-pencil bigger-130"></i>删除
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