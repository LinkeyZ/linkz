<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<div class="page-header">
	<h1>上传文件</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form action="/admin/media-library/upload/file" method="post" enctype="multipart/form-data">
		    <div>
		        <fieldset class="module aligned">
		        <div class="form-row">
		            <input name="Filedata" type="file" id="id_file" />
		            <input name="folder" type="hidden" id="folder" />
		            <input name="get_params" type="hidden" id="get_params" value="?${ param }" />
		        </div>
		        </fieldset>
		        <div class="submit-row">
		            <p class="deletelink-box">
		                <a class="deletelink" href="javascript://">清除文件列表</a>
		            </p>
		            <input class="default" type="submit" name="_save" value='上传' />
		        </div>
	        </div>
	    </form>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>
