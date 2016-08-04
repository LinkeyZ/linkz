<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="page-header">
	<h1>
		添加机构
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			overview &amp; stats
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal" role="form" action="/admin/organization/add" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 机构名 </label>
				<div class="col-sm-9">
					<input name="name"
						type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 机构属性 </label>
				<div class="col-sm-9">
					<input name="organizationType"
						type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 地址 </label>
				<div class="col-sm-9">
					<input name="address"
						type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 描述 </label>
				<div class="col-sm-9">
					<input name="description"
						type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 联系方式 </label>
				<div class="col-sm-9">
					<input name="contact"
						type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 密码 </label>

				<div class="col-sm-9">
					<input name="password"
						type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" />
					<span class="help-inline col-xs-12 col-sm-7">
						<span class="middle">Inline help text</span>
					</span>
				</div>
			</div>
			
			<div class="hr hr-16 hr-dotted"></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 角色选择 </label>
	
				<div class="col-sm-8">
					<select multiple="multiple" size="10" name="selectRoles" id="duallist">
						<c:forEach var="role" items="${roles}">
							<option value="${role.id}">${role.name}</option>
						</c:forEach>
					</select>
	
					<div class="hr hr-16 hr-dotted"></div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-top" for="duallist"> 使用状态 </label>

				<input name="selectStatus" id="id-button-borders" type="checkbox" class="ace ace-switch ace-switch-5" />
				<span class="lbl middle"></span>
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
