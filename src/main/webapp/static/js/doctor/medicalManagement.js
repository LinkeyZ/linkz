$(document).ready(function() {

	
	//下拉列表
	$(".select_input").click(function(event) {
		var this_class=$(this).attr("class");
		if(this_class.indexOf('input_div_text_gray')!=-1){
			$(".con .con_detail .select .select_input").removeClass('input_div_text_blue');
			$(".con .con_detail .select .select_input").addClass('input_div_text_gray');
			$(".con .con_detail .select .select_choose").css("display","none");

			$(this).removeClass('input_div_text_gray');
			$(this).addClass('input_div_text_blue');
			$(this).siblings('.select_choose').css("display","block");
		}
		else{
			$(this).removeClass('input_div_text_blue');
			$(this).addClass('input_div_text_gray');
			$(this).siblings('.select_choose').css("display","none");
		}		
	});

	//点击任意地方关闭下拉列表
	$('html,body').click(function(e){
		if($(e.target).is($(".select_input"))){
			return;
		}
		else{
			$(".select_input").removeClass('input_div_text_blue');
			$(".select_input").addClass('input_div_text_gray');
			$(".select_input").siblings('.select_choose').css("display","none");
		} 
	});
	
	$(".compare ul li a").click(function(event) {
		$(this).parent().addClass('cur').parent.siblings().children('a').removeClass('cur');
	});

	$(".select .select_choose li").click(function(event) {
		var show_value=$(this).html();
		$(this).closest('.select_choose').prev().val(show_value);
	});
	
	//检测报告添加框
	$("#add_huayan").click(function(){
		$(window.parent.document).find(".heian").show();
		$(window.parent.document).find("#add_huayan_kuang").show();
	});

	//医学影像添加框
	$("#add_yingxiang").click(function(){
		$(window.parent.document).find(".heian").show();
		$(window.parent.document).find("#add_yingxiang_kuang").show();
	});
	
	//诊疗添加框
	$("#add_zhenliao").click(function(){
		$(window.parent.document).find(".heian").show();
		$(window.parent.document).find("#add_zhenliao_kuang").show();
	});
	
});

//上传报告
function uploadFile(recordId){
	 $("#fileForm_"+recordId).submit();
}
//下载报告
function downloadReportFile(fileId){
		$.ajax({
			type:"post",
			url: "/doctor/mm/checkFileExist?fileId="+fileId,
			success:function(msg){
				if(msg.msg=="error"){
					alert("文件不存在！");
				}else if(msg!="error"){
					var url= "/doctor/mm/downloadReportFile?fileId="+fileId
					window.location=url;
				}
			}
		});		
}

//预览
function viewReportFile(fileId){
	 
	$.ajax({
		type:"post",
		url:"/doctor/mm/checkFileExist?fileId="+fileId,
		success:function(msg){
			if(msg.msg=="error"){
				alert("文件不存在！");	
			}else if(msg!="error"){
			   var tempwindow=window.open('_blank');
			   tempwindow.location='/doctor/mm/browse?fileId='+fileId;
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
function search(pathUrl,userId){
	
	var startTime = $("#startTime").val();
	var endTime =  $("#endTime").val();
	 
	window.location.href=pathUrl+"?userId="+userId+"&startTime="+startTime+"&endTime="+endTime;
}
