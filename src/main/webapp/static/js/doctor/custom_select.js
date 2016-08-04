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
 
});