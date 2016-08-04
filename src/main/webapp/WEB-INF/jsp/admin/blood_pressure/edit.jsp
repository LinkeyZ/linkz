<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.min.css" />
<div class="page-header">
	<h1>
		编辑血压信息
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->
<sec:authentication property="principal" var="authentication"/>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" action="/admin/bloodPressure/edit" method="post">
		<input name="id" type="hidden" value="${ bloodPressure.id }" />
		<input name="userId" type="hidden" value="${ bloodPressure.userId }" />
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 收缩压 </label>
				<div class="col-sm-9">
					<input name="systolic"
						type="text" id="form-field-1" class="col-xs-10 col-sm-5" value="${ bloodPressure.systolic }"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 舒张压 </label>

				<div class="col-sm-9">
					<input name="diastolic"
						type="text" id="form-field-2" class="col-xs-10 col-sm-5" value="${ bloodPressure.diastolic }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 心率 </label>

				<div class="col-sm-9">
					<input name="heartrate"
						type="text" id="form-field-2" class="col-xs-10 col-sm-5" value="${ bloodPressure.heartrate }"/>
				</div>
			</div>
			<div class="form-group" >
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 测量时间 </label>

				<div class="col-sm-9">
					<input id="date-timepicker1" name="measurementDate"
						type="text" id="form-field-2" class="col-xs-10 col-sm-5" value="<fmt:formatDate value='${ bloodPressure.measurementDate }' pattern='MM/dd/yyyy HH:mm' />"/>
						 <span class="add-on">
					      <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="icon-calendar">
					      </i>
					    </span>
				</div>
			</div>
			
			<div class="hr hr-16 hr-dotted"></div>
			
			
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
