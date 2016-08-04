<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/admin/includes/base-head.jsp"></c:import>
<!-- page specific plugin styles -->
<link rel="stylesheet" href="/static/css/bootstrap-duallistbox.min.css" />
<div class="page-header">
</div><!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
			<div>
			<div class="table-header">${ tableHeader }</div>
			<div>
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label class="pos-rel">
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</th>
						<th class="center">成员名称</th>
						<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${page.items}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<input name="multiSelect" type="checkbox" class="ace" />
									<span class="lbl"></span>
								</label>
							</td>
							<td class="center">${member.user.username}</td>
							<td class="center">
								<c:if test="${member.groupsId.owner eq member.user.username }">
									对群主禁用
								</c:if>
								<c:if test="${member.groupsId.owner ne member.user.username }">
									<a class="red" type="del" memberid="${member.id}" href="#">
										<i class="ace-icon fa fa-trash-o bigger-130"></i>移出该组
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->
<c:import url="/WEB-INF/jsp/admin/includes/base-footer.jsp"></c:import>

<!-- page specific plugin scripts -->
<script src="/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/static/js/jquery.raty.min.js"></script>

<script>

$("a[type='del']").on('click',function(){
	if(confirm_delete()){
		var id = $(this).attr("memberid");
		$.ajax({
			type:'GET',
			url:"remove?t=" + new Date().getTime(),
			data:{id:id},
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		});
	}
});

function confirm_delete() {
	var msg = "您确定要将该用户移出群组？\n\n请确认！"; 
	if (confirm(msg) == true){ 
		return true;
	} else { 
		return false; 
	} 
};

</script>
