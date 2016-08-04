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
	<h1>编辑试题</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form method="post" id="theForm" class="form-horizontal" action="/admin/questionBank/update" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${question.id}">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 试题编号</label>
				<div class="col-sm-9">
					<input value="${id}" readonly="readonly"
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
					<label class="col-sm-3 control-label no-padding-top" for="duallist"> 试题类型 </label>
					<div class="col-sm-9" >
					<label>
						<c:choose>
		        			<c:when test="${question.type == 1 }">
		        			    <input name="type"  checked="checked" class="ace" type="radio" value="1"/>
		        			    <span class="lbl"> 单选题</span>
		        			</c:when>
		        			<c:otherwise>
		        			    <input name="type" type="radio" class="ace" value="1"/>
		        			    <span class="lbl"> 单选题</span>
		        			</c:otherwise>
		        		</c:choose>
	        		</label>
	        		
	        		<label>
		        		<c:choose>
		        			<c:when test="${question.type == 2 }">
		        				<input name="type"  checked="checked" class="ace" type="radio" value="2"/>
		        				<span class="lbl"> 多选题</span>
		        			</c:when>
		        			<c:otherwise>
		        				<input name="type" type="radio" class="ace" value="2"/>
		        				<span class="lbl"> 多选题</span>
		        			</c:otherwise>
		        		</c:choose>
	        		</label>
	        		
	        		<label>
		        		<c:choose>
		        			<c:when test="${question.type == 3 }">
		        				<input name="type"  checked="checked" class="ace" type="radio" value="3"/>
		        				<span class="lbl"> 判断题</span>
		        			</c:when>
		        			<c:otherwise>
		        				<input name="type" type="radio" class="ace" value="3"/>
		        				<span class="lbl"> 判断题</span>
		        			</c:otherwise>
		        		</c:choose>
					</label>
					
					</div>
			</div>
			
			<div class="form-group">		
					<label class="col-sm-3 control-label no-padding-top" for="duallist"> 试题科目 </label>
					<div class="col-sm-9">
						<label>
							<input checked="checked" name="catalog" type="radio" class="ace" value="1" />
							<span class="lbl"> 中医</span>
						</label>
						<label>
							<input name="catalog" type="radio" class="ace" value="2" />
							<span class="lbl"> 西医</span>
						</label>
						<label>
							<input name="catalog" type="radio" class="ace" value="3" />
							<span class="lbl"> 运动</span>
						</label>	
						<label>
							<input name="catalog" type="radio" class="ace" value="4" />
							<span class="lbl"> 饮食</span>
						</label>				
					</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 试题内容</label>
				<div class="col-sm-9">
					<input  name="content" value="${question.content}" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 选项A：</label>
				<div class="col-sm-9">
					<input  name="choiceA" value="${question.choiceA }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 选项B：</label>
				<div class="col-sm-9">
					<input  name="choiceB" value="${question.choiceB }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 选项C：</label>
				<div class="col-sm-9">
					<input  name="choiceC" value="${question.choiceC }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 选项D：</label>
				<div class="col-sm-9">
					<input  name="choiceD" value="${question.choiceD }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 选项E：</label>
				<div class="col-sm-9">
					<input  name="choiceE" value="${question.choiceE }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 选项F：</label>
				<div class="col-sm-9">
					<input  name="choiceF" value="${question.choiceF }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="form-field-1"> 分值：</label>
				<div class="col-sm-9">
					<input  name="answer" value="${question.answer }" 
						type="text" id="form-field-1"  class="col-xs-10 col-sm-5" />
				</div>
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
		</form:form>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>