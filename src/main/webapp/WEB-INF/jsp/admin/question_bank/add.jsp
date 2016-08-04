<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/datepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="/static/css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript"
	src="/static/filebrowser/js/AddFileBrowser.js"></script>
<script type="text/javascript" src="/static/js/jquery.json.min.js"></script>
<div class="page-header">
	<h1>${ title }</h1>
</div>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<sec:authentication property="principal" var="principal" />
		<form id="validation-form" class="form-horizontal" role="form"
			action="/admin/question_bank/add" method="post">
			<input type="hidden" name="orgaid" value="${ principal.orgaInfo.id }">
			<input type="hidden" name="options" id="options">

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top"
					for="questionCode"> 试题编码 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="questionCode" type="text" id="questionCode"
							placeholder="试题编码" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top"
					for="form-field-1"> 试题内容 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="title" type="text" id="form-field-1"
							placeholder="试题内容" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top"
					for="form-field-select-2"> 试题题型</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select name="type" class="col-xs-10 col-sm-5"
							id="form-field-select-2" data-placeholder="选择试题题型">
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
				<label class="col-sm-3 control-label no-padding-top"
					for="form-field-select-3"> 试题类型</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select name="questionType" class="col-xs-10 col-sm-5"
							id="form-field-select-3" data-placeholder="选择一个频道">
							<c:forEach var="item" items="${ questionTypeList }">
								<option value="${ item.id }">${ item.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="hr hr-16 hr-dotted"></div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="option_a">
					选型A</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="option_a" id="option_a" type="text" placeholder="答案">

						<input name="description_a" id="description_a" type="text"
							placeholder="说明">
							
						<input name="weight_a" id="weight_a" type="text"
							placeholder="权重">
							
						<input name="sub_item_a" id="sub_item_a" type="text"
							placeholder="子试题编码">
							
						<!-- 	
						<button class="btn btn-danger btn-sm" onclick="">
							添加子试题
						</button>
						 -->
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="option_b">
					选型B</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="option_b" id="option_b" type="text" placeholder="答案">

						<input name="description_b" id="description_b" type="text"
							placeholder="说明">
							
						<input name="weight_b" id="weight_b" type="text"
							placeholder="权重">
							
						<input name="sub_item_b" id="sub_item_b" type="text"
							placeholder="子试题编码">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="option_c">
					选型C</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="option_c" id="option_c" type="text" placeholder="答案">

						<input name="description_c" id="description_c" type="text"
							placeholder="说明">
						
						<input name="weight_c" id="weight_c" type="text"
							placeholder="权重">
							
						<input name="sub_item_c" id="sub_item_c" type="text"
							placeholder="子试题编码">
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="option_d">
					选型D</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="option_d" id="option_d" type="text" placeholder="答案">

						<input name="description_d" id="description_d" type="text"
							placeholder="说明">
							
						<input name="weight_d" id="weight_d" type="text"
							placeholder="权重">
							
						<input name="sub_item_d" id="sub_item_d" type="text"
							placeholder="子试题编码">
					</div>
				</div>
			</div>

			<div class="form-group" id="appendOption_1">
				<label for="Username" class="col-sm-3 control-label no-padding-top">
					追加选项(E-Z) </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<button type="button" class="btn btn-xs btn-danger"
							onclick="appendOption();">
							<i class="icon-fire bigger-110"></i> <span
								class="bigger-110 no-text-shadow">追加</span>
						</button>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist">
					使用状态 </label>

				<div class="col-sm-9">
					<input checked="checked" name="status" id="id-button-borders"
						type="checkbox" class="ace ace-switch" /> <span
						class="lbl middle"></span>
				</div>
			</div>

			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit"
						onclick="return onvalid()">
						<i class="ace-icon fa fa-check bigger-110"></i> 提交
					</button>
					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i> 重置
					</button>
				</div>
			</div>
		</form>
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
			            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			            <span aria-hidden="true">&times;</span></button>
			            <h4 class="modal-title" id="modal-title">添加子试题</h4>
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
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
<!-- inline scripts related to this page -->

<script type="text/javascript">
var option_array = ['a', 'b', 'c', 'd'];

function onvalid(){
	$('#validation-form').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules: {
			title: {
				required: true,
				maxlength: 100
			},
			questionCode: {
				required: true,
				maxlength: 100
			}
		},
		messages: {
			title: "请输入试题类型名称",
			questionCode: "请输入试题编码"
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
	
	var optionJson = {};
	
	for (i in option_array) {
		option = $("#option_" + option_array[i]).val(); // 选型
		description = $("#description_" + option_array[i]).val(); // 说明
		sub_item = $("#sub_item_" + option_array[i]).val(); // 子试题
		weight = $("#weight_" + option_array[i]).val(); // 权重
		if (option != null && option != "undefined" && option.length != 0) {
			if (description == null || description == "undefined") {
				description = "";
			}
			optionJson[option_array[i].toUpperCase()] = option + "#" + description + "#" + weight + "#" + sub_item;
		}
	}
	
	$("#options").val(JSON.stringify(optionJson));
	//alert($("#options").val());
	
	return $("#validation-form").valid();
}

var group_arry = ["e","f",'g',"h",'i','j','k','l','m','n','o','p',"q","r","s",'t','u','v','w','x','y','z'];
var position_i = -1;
function appendOption() { 
	position_i++;
	option_array.push(group_arry[position_i]);
	var html = '';
	
	/** 选型(A-Z) **/
	html += '<div class="form-group" id="group_' + group_arry[position_i] + '">';
	html += '<label class="col-sm-3 control-label no-padding-top" for="option_';
	html += group_arry[position_i] + '">' + '选型' + group_arry[position_i].toUpperCase();
	html += '</label><div class="col-sm-9"><div class="clearfix">';
	html += '<input name="option_' + group_arry[position_i] + '" type="text" id="option_' + group_arry[position_i];
	html += '" placeholder="答案"> ';
	html += '<input name="description_' + group_arry[position_i] + '" type="text" id="description_' + group_arry[position_i];
	html += '" placeholder="说明"> ';
	html += '<input name="weight_' + group_arry[position_i] + '" type="text" id="weight_' + group_arry[position_i];
	html += '" placeholder="权重"> ';
	html += '<input name="sub_item_' + group_arry[position_i] + '" type="text" id="sub_item_' + group_arry[position_i];
	html += '" placeholder="子试题编码">';
	html += '</div></div></div>';
	 
	if(position_i == 0)	
		$("#appendOption_1").before(html);
	else
		$('#group_'+(group_arry[position_i-1])).after(html);
}
</script>
<script>
$(".btn.btn-danger.btn-sm").on('click',function(){	
	$("#myModal").modal('show');
	return false;
});
</script>

















