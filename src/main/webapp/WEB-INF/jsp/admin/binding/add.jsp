<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>添加绑定关系
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" action="/admin/binding/add" method="post">
			<sec:authentication property="principal" var="authentication"/>
			<c:if test="${ status == 1 }">
			<input type="hidden" name="doctorid" value="${ authentication.userid }"/>
			<input type="hidden" name="doctorName" value="${ authentication.username }"/>
			</c:if>
			<c:if test="${ status == 2 }">
			<input type="hidden" name="userid" value="${ authentication.userid }"/>
			<input type="hidden" name="userName" value="${ authentication.username }"/>
			</c:if>
			<input  type="hidden" name="status" value="${ status }">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 用户名 </label>
				<div class="col-sm-9">
					<input name="userName" value="${ authentication.username }"
						type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist">
				<c:if test="${ status == 0 }">无法建立关系</c:if>
				<c:if test="${ status == 1 }">医生</c:if>
				<c:if test="${ status == 2 }">普通用户</c:if>
				</label>
				
				<c:if test="${ status != 0 }">
				<div class="col-sm-8">
					<select multiple="multiple" size="10" name="multiSelect" id="duallist">
						<c:forEach var="user" items="${ userlist }">
							<option value="${ user.id }@${ user.username }">${ user.username }</option>
						</c:forEach>
					</select>
	
					<div class="hr hr-16 hr-dotted"></div>
				</div>
				</c:if>
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit">
						<i class="ace-icon fa fa-check bigger-110"></i>
						Submit
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						Reset
					</button>
				</div>
			</div>
			
		</form>	
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>

<!-- inline scripts related to this page -->
