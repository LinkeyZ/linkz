<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mmednet.project.media.param.MediaParam"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
	<h1>
		媒体库管理
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			概述 &amp; 统计
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<a href="/admin/media-library/upload${params}" class="btn btn-app btn-purple btn-sm">
			<i class="ace-icon fa fa-cloud-upload bigger-200"></i>
			上传
		</a>
		
		<a href="/admin/media-library/mkdir${params}" class="btn btn-app btn-purple btn-sm">
			<i class="ace-icon fa fa-folder bigger-200"></i>
			创建
		</a>
		
		<div class="clearfix">
			<div class="pull-right tableTools-container"></div>
		</div>
		
		<div class="table-header">
			文件列表管理
		</div>
		
		<div>
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th></th>
						<th>效果图</th>
						<th>文件名</th>
						<th class="hidden-480">大小</th>
						<th class="hidden-480">日期</th>
						<th>备注</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${filelist}" var="t" varStatus="status">
						<tr>
							<c:choose>
					  			<c:when test="${t.isDirectory == 'true'}">
					  				<c:if test="${param.pop == 2 || param.pop == 1}">
					  					<td><img src="/static/filebrowser/img/filebrowser_icon_select_disabled.gif"/></td>
					  				</c:if>
					  				<td><img src="/static/filebrowser/img/filebrowser_type_folder.gif"/></td>
					  				<td></td>
					  				<td><a href="${t.url}">${t.name}</a></td>
					  			</c:when>
					  			<c:otherwise>
					  				<c:if test="${param.pop == 2}">
					  					<script language="javascript" type="text/javascript" src="/static/filebrowser/js/tiny_mce_popup.js"></script>
<script language="javascript" type="text/javascript" src="/static/filebrowser/js/FB_TinyMCE.js"></script>
					  					<td>
						  					<a href="javascript:FileBrowserDialogue.fileSubmit('${t.url}')">
						  						<img src="/static/filebrowser/img/filebrowser_icon_select.gif"/>
						  					</a>
					  					</td>
					  				</c:if>
					  				<c:if test="${param.pop == 1}">
					  					<td>
					  						<a href="javascript://" onclick="FileSubmit('${t.url}', 
					  								'${t.url}', 
					  								'${t.url}', 
					  								'Image');" title="Select">
					  							<img src="/static/filebrowser/img/filebrowser_icon_select.gif"/>
					  						</a>
					  					</td>
					  				</c:if>
					  				<td><img src="/static/filebrowser/img/filebrowser_type_image.gif"/></td>
					  				<td>
					  					<!-- target="_blank" -->
					  					<a href="${t.url}" data-rel="colorbox">
					  						<img width="150" height="150" alt="150x150" src="${t.url}" class="img-thumbnail"/>
					  					</a>
					  				</td>
					  				<td><a href="${t.url}" target="_blank">${t.name}</a></td>
					  			</c:otherwise>
					  		</c:choose>
					  		<td>${t.size}</td>
					  		<td>${t.date}</td>
					  		<td></td>
					  		<td>
					  			<div class="hidden-sm hidden-xs action-buttons" id="bootbox-confirm">
					  				<a id="bootbox-regular" class="green" href="/admin/media-library/rename${params}&filename=${t.name}">
										<i class="ace-icon fa fa-pencil bigger-130"></i>
									</a>
									
									<a class="red" href="/admin/media-library/del${params}&filename=${t.name}" 
										onclick="javascript:return confirm_delete()">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>
									</a>
								</div>
					  		</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>
