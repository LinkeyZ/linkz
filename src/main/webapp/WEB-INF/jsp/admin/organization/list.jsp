<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="/static/css/chosen.css" />
<div class="page-header">
	<h1>机构管理</h1>
</div>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div style="max-width: 800px;" class="dd" id="nestable">
			<ol class="dd-list">
			  <li class="dd-item" data-id="${organ.id}">
				<div class="dd2-content orange">${organ.name} 
					<div class="pull-right action-buttons">
						<a class="green" orgid="${organ.id}" type="addUser" href="/admin/user/add?organid=${organ.id}"> <i class="ace-icon fa fa-pencil-square-o  bigger-130"></i>添加用户</a>
					 	<a class="red" orgid="${organ.id}" type="add" href="#"> <i class="ace-icon fa fa-pencil-square-o  bigger-130"></i>添加子机构</a>
					 	<a class="blue" orgid="${organ.id}" type="update" href="#"> <i class="ace-icon fa fa-pencil bigger-130"></i>修改</a>
						<a class="green" orgid="${organ.id}" type="check" href="#"> <i class="ace-icon fa fa-search bigger-130"></i>查看</a>
					</div>
					<i class="pull-right bigger-130 icon-warning-sign orange2"></i></div>
					<ol class="dd-list" name="chd_node">
						<c:forEach var="chd" items="${organ.childOrgan}">
				  		  <li class="dd-item" data-id="${chd.id }">
							<div class="dd2-content">
								<span class="orgname">${chd.name }</span> 
								<span class="lighter grey description" style="display:none;">
									&nbsp; 不存在子机构 </span>
								<div class="pull-right action-buttons">
									<a class="green" orgid="${chd.id }" type="addUser" href="/admin/user/add?organid=${chd.id }"> <i class="ace-icon fa fa-pencil-square-o  bigger-130"></i>添加用户</a>
								 	<a class="red" orgid="${chd.id }" type="add" href="#"> <i class="ace-icon fa fa-pencil-square-o  bigger-130"></i>添加子机构</a>
								 	<a class="blue" orgid="${chd.id }" type="update" href="#"> <i class="ace-icon fa fa-pencil bigger-130"></i>修改</a>
								 	<a class="green" orgid="${chd.id}" type="check" href="#"> <i class="ace-icon fa fa-search bigger-130"></i>查看</a>
								 	<a class="red" orgid="${chd.id }" type="del" href="#"> <i class="ace-icon fa fa-trash-o bigger-130"></i>删除</a>
								</div>
							</div>
							<ol class="dd-list">
								
							</ol>
						  </li>
				        </c:forEach>
			        </ol>
			   </li>
			</ol>
		</div>
</from>
<div class="dd" style="display: none;">
  <li id="clone-dd-item" class="dd-item" data-id="">
	<div class="dd2-content">
		<span class="orgname"></span> 
		<span class="lighter grey description" style="display:none;">
			&nbsp; 不存在子机构 </span>
		<div class="pull-right action-buttons">
			<a class="green" orgid="" type="addUser" href=""> <i class="ace-icon fa fa-pencil-square-o  bigger-130"></i>添加用户</a>
		 	<a class="red" orgid="" type="add" href="#"> <i class="ace-icon fa fa-pencil-square-o  bigger-130"></i>添加子机构</a>
		 	<a class="blue" orgid="" type="update" href="#"> <i class="ace-icon fa fa-pencil bigger-130"></i>修改</a>
		 	<a class="green" orgid="" type="check" href="#"> <i class="ace-icon fa fa-search bigger-130"></i>查看</a>
		 	<a class="red" orgid="" type="del" href="#"> <i class="ace-icon fa fa-trash-o bigger-130"></i>删除</a>
		</div>
	</div>
	<ol class="dd-list">
	</ol>
  </li>
</div>
<!-- update from begin -->		
<form  role="form" id="validation-form"  action="/admin/organization/updateOrg" method="post" enctype="multipart/form-data">
<div id="modal-form" class="modal" tabindex="-2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">修改机构信息</h4>
			</div>
			<input type="hidden" name="id" value=""/>
			<div class="modal-body overflow-visible">
				<div class="row">
					<div class="col-xs-12">
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">机构名称:</label>
								<input name="name" class="input-large" type="text" id="form-field-name" placeholder="name" value="" />
						</div>
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">联系人:</label>
								<input name="linkman" class="input-large" type="text" id="form-field-name" placeholder="name" value="" />
						</div>
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-description" style="width:12%;">机构描述:</label>
								<textarea name="description" rows="3" cols="60" style="width: 80%;vertical-align:top;" id="form-field-description" placeholder="请输入机构描述"/></textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-service" style="width:12%;">服务介绍:</label>
							<textarea id="form-field-service" name="serviceIntroduction" rows="3" cols="60" style="width: 80%;vertical-align:top;" placeholder="请输入服务介绍"></textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-contact" style="width:12%;">联系方式:</label>
								<input name="contact" class="input-large" type="text" id="form-field-contact" placeholder="contact" value="" />
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="up-pro" style="width:12%;">所在地区:</label>
							<select id="up-pro" name="provinceIndex" data-placeholder="选择省份" class="chosen-select"></select>
							<select id="up-city" name="cityIndex" data-placeholder="选择市" class="chosen-select-city"></select>
							<input type="hidden" name="province"/><input type="hidden" name="city"/>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-address" style="width:12%;">详细地址:</label>
							<input name="address" class="input-large" style="width: 350px;" type="text" id="" placeholder="请输入详细地址" value="" />
							
						</div>
						
						<div class="space-4"></div>
						<div>
							<label for="form-field-typeid" style="width:12%;">机构类型:</label>
							<select class="input-large" name="organizationType" id="form-field-typeid" data-placeholder="选择用户类型">
								<c:forEach var="type" items="${ types }">
								<option value="${ type.id }">${ type.name }</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-4" style="width:12%;">推荐科室:</label>
								<textarea name="recommend" style="vertical-align:middle;" class="input-large"  placeholder="" value=""> </textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-1" style="width:13%;">机构LOGO:</label>
							<div class="clearfix">
								<input name="logofile"  type="file" id="id-input-file-1" />
							</div>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-6">app欢迎页图片:</label>
							<div class="clearfix">
								<input name="appShouImage"  type="file" id="id-input-file-3" />
							</div>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-2" style="width:13%;">图片展示:</label>
							<label>
								<input name="showfiles"  multiple="" type="file" id="id-input-file-2" />
								<input type="checkbox" name="file-format" id="id-file-format" class="ace" />
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="icon-remove"></i>
					取消
				</button>

				<button type="submit" name="save" value="提交" class="subText" >
					<i class="icon-ok"></i>
					保存更改
				</button>
			</div>
		</div>
	</div>
	</div>
</form>
<!-- update from end -->		

<!-- save from brgin -->

<form  role="form" id="save-form"  action="/admin/organization/addOrg" method="post" enctype="multipart/form-data">
<div id="modal-form-save" class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">添加子机构</h4>
			</div>
			<input type="hidden" name="parentId" value=""/>
			<div class="modal-body overflow-visible">
				<div class="row">
					<div class="col-xs-12">
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">机构名称:</label>
								<input name="name" class="input-large" type="text" id="form-field-name" placeholder="name" value="" />
						</div>
						
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">联系人:</label>
								<input name="linkman" class="input-large" type="text" id="form-field-name" placeholder="name" value="" />
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-description" style="width:12%;">机构描述:</label>
								<textarea name="description" rows="3" cols="" style="width: 20%;vertical-align:top;" id="duallist" placeholder="请输入机构描述"/></textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-service" style="width:12%;">服务介绍:</label>
							<textarea id="duallist1" name="serviceIntroduction" rows="3" cols="" style="width: 20%;vertical-align:top;" placeholder="请输入服务介绍"></textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-contact" style="width:12%;">联系方式:</label>
								<input name="contact" class="input-large" type="text" id="form-field-contact" placeholder="contact" value="" />
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="pro" style="width:12%;">所在地区:</label>
							<select id="pro" name="provinceIndex" data-placeholder="选择省份" class="chosen-select"></select>
							<select id="city" name="cityIndex" data-placeholder="选择市" class="chosen-select-city"></select>
							<input type="hidden" name="province"/><input type="hidden" name="city"/>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-address" style="width:12%;">详细地址:</label>
							<input name="address" class="input-large" style="width: 350px;" type="text" id="" placeholder="请输入详细地址" value="" />
						</div>
						<div class="space-4"></div>
						<div>
							<label for="form-field-typeid" style="width:12%;">机构类型:</label>
							<select class="input-large" name="organizationType" id="form-field-typeid" data-placeholder="选择用户类型">
								<c:forEach var="type" items="${ types }">
								<option value="${ type.id }">${ type.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-4" style="width:12%;">推荐科室:</label>
							<textarea  name="recommend" style="vertical-align:middle;" class="input-large" > </textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-3" style="width:13%;">机构LOGO:</label>
							<div class="clearfix">
								<input name="logofile"  type="file" id="id-input-file-3" />
							</div>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-6">app欢迎页图片:</label>
							<div class="clearfix">
								<input name="appShouImage"  type="file" id="id-input-file-3" />
							</div>
								
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-4" style="width:13%;">图片展示:</label>
							<label>
								<input name="showfiles"  multiple="" type="file" id="id-input-file-4" />
								<input type="checkbox" name="file-format" id="id-file-format" class="ace" />
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="icon-remove"></i>
					取消
				</button>

				<button type="submit" name="save" value="提交" class="subText" >
					<i class="icon-ok"></i>
					确认添加
				</button>
			</div>
		</div>
	</div>
	</div>
</form>
<!-- save from end -->

<!-- check from begin -->
<form  role="form" id="check-form">
<div id="modal-form-check" class="modal" tabindex="-3">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="blue bigger">机构详细信息</h4>
			</div>
			<input type="hidden" name="id" value=""/>
			<div class="modal-body overflow-visible">
				<div class="row">
					<div class="col-xs-12">
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">机构名称:</label>
								<input name="name" class="input-large" type="text" id="form-field-name" placeholder="name" value="" readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for="form-field-name" style="width:12%;">联系人:</label>
								<input name="linkman" class="input-large" type="text" id="form-field-name" placeholder="name" value="" readonly="readonly"/>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-description" style="width:12%;">机构描述:</label>
								<textarea name="description" rows="3" cols="60" style="width: 80%;vertical-align:top;"  readonly="readonly"/></textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-service" style="width:12%;">服务介绍:</label>
							<textarea name="serviceIntroduction" rows="3" cols="60" style="width: 80%;vertical-align:top;" readonly="readonly"></textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-contact" style="width:12%;">联系方式:</label>
								<input name="contact" class="input-large" type="text" id="form-field-contact" placeholder="contact" value="" readonly="readonly"/>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-createTime" style="width:12%;">创建时间:</label>
								<input name="publishDate" class="input-large" type="text" id="form-field-createTime" placeholder="contact" readonly="readonly"/>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="pro" style="width:12%;">所在地区:</label>
							<input name="pro" class="input-large" type="text" id="form-field-pro" placeholder="未选择" readonly="readonly"/>
							<input name="city" class="input-large" type="text" id="form-field-city" placeholder="未选择" readonly="readonly"/>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="form-field-address" style="width:12%;">详细地址:</label>
							<input name="address" class="input-large" style="width: 350px;" type="text" id="form-field-address" readonly="readonly" value="" />
						</div>
						
						<div class="space-4"></div>
						<div>
							<label for="form-field-typeid" style="width:12%;">机构类型:</label>
							<input name="organizationType" class="input-large" type="text" id="form-field-typeid" readonly="readonly" value="" />
						</div>
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-4" style="width:12%;">推荐科室:</label>
								<textarea name="recommend" style="vertical-align:middle;" class="input-large" id="form-field-address" value="" readonly="readonly"> </textarea>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-3" style="width:13%;">机构LOGO:</label>
							<img name="logofile" width="120" height="120" src="" class="img-thumbnail"/>
							<span name="logofile_nofile" style="display: none;">未选择机构logo</span>
						</div>
						
						<div class="space-4"></div>
						<div class="form-group">
							<label for="id-input-file-3" style="width:19%;">app欢迎页图片:</label>
								<img name="appShouImage" width="120" height="120" src="" class="img-thumbnail"/>
								<span name="appShouImage_nofile" style="display: none;">未选app欢迎页图片</span>
								
						</div>
						
						<div class="space-4"></div>
						<div class="form-group" name="showfiles">
							<label for="id-input-file-4" style="width:13%;">图片展示:</label>
							<span name="showfiles_nofile" style="display: none;">未选择展示图片</span>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-sm" data-dismiss="modal">
					<i class="icon-remove"></i>
					关闭
				</button>
			</div>
		</div>
	</div>
</div>
</form>
<!-- check form ends -->

<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script type="text/javascript" src="/static/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/static/js/tinymce_setup_orga.js"></script>
<script type="text/javascript" src="/static/filebrowser/js/AddFileBrowser.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>
<script src="/static/js/chosen.jquery.min.js"></script>
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/customjs/organization.js"></script>
<script src="/static/js/ProvinceCityDist.js"></script>
