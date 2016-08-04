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
		<form id="validation-form" class="form-horizontal" role="form" action="/admin/questionnaire_type/add" method="post">
			<input type="hidden" name="orgaid" value="${ principal.orgaInfo.id }">
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="questionnaireCode"> 问卷编码 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="questionnaireCode"
							type="text" id="questionnaireCode" placeholder="问卷编码" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 问卷名称 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="name"
							type="text" id="form-field-1" placeholder="名称" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-select-2"> 问卷类型</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select name="type" class="col-xs-10 col-sm-5"
							id="form-field-select-2" data-placeholder="选择问卷类型">
						<c:forEach items="${ questionnaireTypeList }" var="item">
							<option value="${ item.id }">${ item.name }</option>
						</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="hr hr-16 hr-dotted"></div>
			
			<div class="form-group">
				<h1 class="col-sm-3 control-label no-padding-right"> 
					试题查询条件
				</h1>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="questionnaireCode"> 搜索关键字</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="questionnaireCode"
							type="text" id="questionnaireCode" placeholder="试题名称" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-select-2"> 试题题型</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select name="type" class="col-xs-10 col-sm-5"
							id="form-field-select-2" data-placeholder="选择试题题型">
							<option selected="selected" value="0">选择试题题型</option>
							<option value="1">单选</option>
							<option value="2">多选</option>
							<option value="3">填空</option>
							<option value="4">单选+填空</option>
							<option value="5">多选+填空</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-select-3"> 试题类型</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select name="questionType" class="col-xs-10 col-sm-5"
							id="form-field-select-3">
							<option selected="selected" value="0">选择试题类型</option>
							<c:forEach var="item" items="${ questionTypeList }">
								<option value="${ item.id }">${ item.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-3 control-label no-padding-right">
					<button class="btn btn-info" type="submit" onclick="return onvalid()">
						<i class="ace-icon fa fa-check bigger-110"></i>
						查询
					</button>
				</div>
			</div>
			
			<table id="sample-table-1" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</th>
						<th>试题编码</th>
						<th>试题名称</th>
						<th class="hidden-480">试题类型</th>
						<th>试题题型</th>
						<th class="hidden-480">操作</th>
					</tr>
				</thead>
				
			</table>
			
			<div class="hr hr-16 hr-dotted"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 使用状态 </label>
				
				<div class="col-sm-9">
					<input checked="checked" name="status" id="id-button-borders" type="checkbox" class="ace ace-switch" />
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

function get_question_list() {
	
}
</script>

















