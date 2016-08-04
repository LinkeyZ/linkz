<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/datepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet" href="/static/css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="/static/filebrowser/js/AddFileBrowser.js"></script>
<div class="page-header">
	<h1>
		添加试题
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form id="form1" action="" method="post">
		
		<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 试题类型 </label>
				<div class="col-sm-9" >
					<label>
						<input checked="checked" name="type" type="radio" class="ace" value="1" />
						<span class="lbl"> 单选题</span>
					</label>
					<label>
						<input name="type" type="radio" class="ace" value="2" />
						<span class="lbl"> 多选题</span>
					</label>
					<label>
						<input name="type" type="radio" class="ace" value="3" />
						<span class="lbl"> 判断题</span>
					</label>					
				</div>
		</div>
		
		<div class="form-group">		
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 试题类型 </label>
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
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1">试题内容： </label>
				<div class="col-sm-9">
					<input name="content"
						type="text" id="form-field-1" placeholder="试题内容" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
            <div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" >选项A： </label>
				<div class="col-sm-9">
					<input name="choiceA"
						type="text"  placeholder="选项A：" class="col-xs-10 col-sm-5" />
				</div>
			</div>	
			
		    <div class="form-group">            
				<label class="col-sm-3 control-label no-padding-right" >选项B：</label>
				<div class="col-sm-9">
					<input name="choiceB"
						type="text"  placeholder="选项B：" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-3 control-label no-padding-right" >选项C： </label>
				<div class="col-sm-9">
					<input name="choiceC"
						type="text"  placeholder="选项C：" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-3 control-label no-padding-right" >选项D： </label>
				<div class="col-sm-9">
					<input name="choiceD"
						type="text"  placeholder="选项D：" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" >选项E： </label>
				<div class="col-sm-9">
					<input name="choiceE"
						type="text"  placeholder="选项E：" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">	
				<label class="col-sm-3 control-label no-padding-right" >选项F： </label>
				<div class="col-sm-9">
					<input name="choiceF"
						type="text"  placeholder="选项F： " class="col-xs-10 col-sm-5" />
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
		</form>	
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
