<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/datepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="/static/filebrowser/js/AddFileBrowser.js"></script>
<div class="page-header">
	<h1>${ title }</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<sec:authentication property="principal" var="principal" />
		<form id="validation-form" class="form-horizontal" role="form" action="/admin/questionnaire_type/edit" method="post">
			<input type="hidden" name="orgaid" value="${ principal.orgaInfo.id }">
			<input type="hidden" name="id" value="${ item.id }">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 试题类型名称 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="name" value="${ item.name }"
							type="text" id="form-field-1" placeholder="名称" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 备注</label>
				<div class="col-sm-9">
					<textarea name="remarks" class="col-xs-10 col-sm-5" placeholder="备注">${ item.remarks }</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 使用状态 </label>
				
				<div class="col-sm-9">
					<input name="status" id="id-button-borders" type="checkbox" class="ace ace-switch" 
						<c:if test="${ item.flag == 1 }">
							checked="checked"
						</c:if>
					/>
					<span class="lbl middle"></span>
				</div>
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit" onclick="return onvalid()">
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>
					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						重置
					</button>
				</div>
			</div>
		</form>	
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
<!-- inline scripts related to this page -->

<script type="text/javascript">
function onvalid(){
	$('#validation-form').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules: {
			name: {
				required: true,
				maxlength: 15
			}
		},
		messages: {
			name: "请输入问卷类型名称"
		},
		highlight: function(e) {
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight: function(e) {
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		},
		errorPlacement:function(error,element){
			error.insertAfter(element.parent());
		}
	});	
	return $("#validation-form").valid();
}
</script>

















