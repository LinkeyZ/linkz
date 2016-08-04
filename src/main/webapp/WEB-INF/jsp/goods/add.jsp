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
		<form id="validation-form" class="form-horizontal" role="form"
			action="/goods/addGoods" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top"
					for="goodsName">商品名称 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="goodsName" type="text" id="goodsName"
							placeholder="商品名称" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top"
					for="goodsName">日期 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input name="date" type="text" id="date"
							placeholder="日期" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top"
					for="goodsTypeId"> 商品类型</label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select name="goodsTypeId" class="col-xs-10 col-sm-5"
							id="goodsTypeId" data-placeholder="选择一个类型">
							<c:forEach var="item" items="${ typeList }">
								<option value="${ item.goodsTypeId }">${ item.goodsTypeName }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist">
					使用状态 
				</label>

				<div class="col-sm-9">
					<input checked="checked" name="isValid" id="id-button-borders"
						type="checkbox" class="ace ace-switch" />
					 <span class="lbl middle"></span>
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
		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
<!-- inline scripts related to this page -->

<script type="text/javascript">

$(".btn.btn-danger.btn-sm").on('click',function(){	
	$("#myModal").modal('show');
	return false;
});
</script>

















