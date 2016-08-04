<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/datepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-datetimepicker.min.css" />

<script type="text/javascript" src="/static/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/static/js/tinymce_setup.js"></script>
<script type="text/javascript" src="/static/filebrowser/js/AddFileBrowser.js"></script>

<div class="page-header">
	<h1>编辑资讯</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form method="post" id="validation-form" class="form-horizontal" action="/admin/news/edit" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${ model.id }">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-select-1"> 频道</label>
				
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="channelid" class="col-xs-10 col-sm-5" 
							id="form-field-select-1" data-placeholder="选择一个频道">
							<c:forEach var="channel" items="${ channelList }">
								<c:if test="${ channel.id == model.channel.id }">
									<option selected="selected" value="${ channel.id }">${ channel.name }</option>
								</c:if>
								<c:if test="${ channel.id != model.channel.id }">
									<option value="${ channel.id }">${ channel.name }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 主标题</label>
				
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="title" value="${ model.title }"
							type="text" id="form-field-1" placeholder="主标题" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-2"> 副标题</label>
				
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="subtitle" value="${ model.subtitle }"
							type="text" id="form-field-2" placeholder="副标题" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-3"> 作者</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="author" value="${ model.author }"
							type="text" id="form-field-3" placeholder="作者" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="date-timepicker1"> 发布日期</label>
				
				<div class="col-xs-12 col-sm-4">
					<div class="clearfix input-group">
						<input name="publishDate" data-date-format="YYYY年MM月DD日 HH:mm:ss" readonly="readonly"
							value="<fmt:formatDate value='${model.publishDate}' pattern='yyyy年MM月dd日 HH:mm:ss'/>"
							id="date-timepicker1" type="text" class="form-control" />
						<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;">
							<i class="fa fa-calendar"></i>
						</span>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="id_featured_image"> Logo</label>
				
				<div class="col-xs-12 col-sm-4">
					<div class="clearfix input-group">
						<input id="id_featured_image" readonly="readonly" 
							readonly="readonly" type="text" class="form-control" name="logo" value="${ model.logo }" />
						<span class="input-group-addon" style="vertical-align: middle;cursor: pointer;">
							<i class="fa fa-picture-o"></i>
						</span>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 推荐产品</label>
				
				<div class="col-sm-9">
					<label>
						<input name="product" type="checkbox" class="ace input-lg" />
						<span class="lbl"> 产品 1</span>
					</label>
					<label>
						<input name="product" type="checkbox" class="ace input-lg" />
						<span class="lbl"> 产品 2</span>
					</label>
					<label>
						<input name="product" type="checkbox" class="ace input-lg" />
						<span class="lbl"> 产品 3</span>
					</label>
					<label>
						<input name="product" type="checkbox" class="ace input-lg" />
						<span class="lbl"> 产品 4</span>
					</label>
					<label>
						<input name="product" type="checkbox" class="ace input-lg" />
						<span class="lbl"> 产品 5</span>
					</label>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 使用状态</label>
				
				<div class="col-sm-9">
					<input name="flag" id="id-button-borders" type="checkbox" class="ace ace-switch" 
						<c:if test="${ model.flag == 1 }">
							checked="checked"
						</c:if>
					/>
					<span class="lbl middle"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 资讯内容</label>
				
				<div class="col-sm-9">
					<div class="clearfix">
						<textarea id="duallist" name="content" rows="15" cols="80" style="width: 95%">
							${ model.content }
						</textarea>
					</div>
				</div>
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info" type="submit" onclick="return onvalid()">
						<i class="ace-icon fa fa-check bigger-110"></i>提交
					</button>
					&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset">
						<i class="ace-icon fa fa-undo bigger-110"></i>重置
					</button>
				</div>
			</div>
		</form:form>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<script type="text/javascript">
function onvalid(){
	$('#validation-form').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules: {
			channelid: {
				required: true
			},
			title: {
				required: true
			},
			subtitle: {
				required: true
			},
			author: {
				required: true
			},
			publishDate: {
				required: true
			},
			logo: {
				required: true
			},
			content: {
				required: true
			}
		},
		messages: {
			channelid: "请选择频道",
			title: "请输入标题",
			subtitle: "请输入频道名称",
			author: "请输入作者",
			publishDate: "请选择发布时间",
			logo: "请选择频道Logo",
			content: "请输入发布内容"
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