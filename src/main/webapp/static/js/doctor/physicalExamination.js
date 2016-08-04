$(document).ready(function() {
	//检测报告添加框
	$("#add_baogao").click(function(){
		$(window.parent.document).find(".heian").show();
		$(window.parent.document).find("#add_baogao_kuang").show();
	});

	
});

//上传报告
function uploadFile(recordId){
	 $("#fileForm_"+recordId).submit();
}
//下载报告
function downloadReportFile(recordId){
		$.ajax({
			type:"post",
			url: "/doctor/mm/checkFileExist?recordId="+recordId,
			success:function(msg){
				if(msg.msg=="error"){
					alert("文件不存在！");
				}else if(msg!="error"){
					var url= "/doctor/mm/downloadReportFile?recordId="+recordId
					window.location=url;
				}
			}
		});		
}

/**
 * 搜索
 * @param pathUrl
 * @param userId
 * @return
 */
function query(pathUrl,userId){
	
	var startTime = $("#startTime").val();
	var endTime =  $("#endTime").val();
	 
	window.location.href=pathUrl+"?userId="+userId+"&startTime="+startTime+"&endTime="+endTime;
}
