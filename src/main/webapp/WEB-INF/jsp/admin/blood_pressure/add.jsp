<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.min.css" />
<div class="page-header">
	<h1>
		添加血压信息
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
		<form id="validation-form" class="form-horizontal" role="form" action="/admin/bloodPressure/add" method="post">
		<input name="userId" type="hidden" value="${ authentication.userid }" />
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 收缩压 </label>
				<div class="col-xs-12 col-sm-9">
					<div class="clearfix">
					<input name="systolic"
						type="text" id="form-field-1" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 舒张压 </label>

				<div class="col-xs-12 col-sm-9">
					<div class="clearfix">
					<input name="diastolic"
						type="text" id="form-field-2" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 心率 </label>

				<div class="col-xs-12 col-sm-9">
					<div class="clearfix">
					<input name="heartrate"
						type="text" id="form-field-3" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			<div class="form-group" >
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 测量时间 </label>

				<div class="col-xs-12 col-sm-4">
					<div class="clearfix input-group">
						<input  name="createDateTime" data-date-format="YYYY-DD-MM HH:mm"
						type="text" readonly="readonly"  id="date-timepicker1" class="col-xs-10 col-sm-12" />
						<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;">
							<i class="fa fa-calendar"></i>
						</span>
						<span class="input-group-addon clearval" style="vertical-align: middle;cursor: pointer;">
							<i class="fa fa-times"></i>
						</span>
					</div>
					
				</div>
			</div>
			
			<div class="hr hr-16 hr-dotted"></div>
			
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit" onclick="return onvalid()">
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
<script type="text/javascript">
$(".clearval").bind("click",function(){
	$("#date-timepicker1").val("");
});
function onvalid(){
	$('#validation-form').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules:{
			systolic:{
				required:true,
				number:true
			},
			diastolic:{
				required:true,
				number:true
			},
			heartrate:{
				required:true,
				number:true
			},
			createDateTime:{
				required:true
			}
		},
		messages:{
			systolic:{
				required:"Please provide a systolic",
				number:"请输入合法的数字"
				},
			diastolic:{
				required:"Please provide a diastolic",
				number:"请输入合法的数字"
				},
			heartrate:{
				required:"Please provide a heartrate",
				number:"请输入合法的数字"
				},
			createDateTime:{required:"Please provide a measurementDate"}
		},
		highlight:function(e){
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight:function(e){
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		},
		errorPlacement:function(error,element){
			error.insertAfter(element.parent());
		}
	});	
	return $("#validation-form").valid();
}
	
</script>