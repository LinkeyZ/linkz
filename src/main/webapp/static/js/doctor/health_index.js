$(document).ready(function() {
	$("#customer_tab li:nth-child("+1+")").addClass("cur");
	$(".health_i_jc>li").hover(function() {
		$(this).children('ul').stop().slideDown(400);
	}, function() {
		$(this).children('ul').stop().slideUp(400);
	});

	$(".health_i_jc>li>ul li").hover(function() {
		$(this).children(".qs_ys").css("display","block");
	}, function() {
		$(this).children(".qs_ys").css("display","none");
	});

	$(".health_i_jc>li>ul>li a").click(function(event) {
		var index_child=$(this).parent("li").index()+1;
		var index_wrap=$(this).parent("li").parent("ul").parent("li").index()+1;
		//不是饮食管理
		if(index_wrap!=3){
			$(".qs_all>div").each(function(index, el) {
				if($(this).index()!=2){
					$(this).children('.ys_detail').children('div').removeClass('cur');
				}
				else{
					$(this).children('.ys_detail').children('div').children('div').removeClass('cur');
				}
				
			});
			$(".qs_all .qu"+index_wrap+" .ys_detail .ys_detail0"+index_child).addClass('cur');
		}	
	});

	$(".health_i_jc>li>ul>li .qs_ys li a").click(function(event) {
		var index_child=$(this).parent("li").index()+1;
		var index_parent=$(this).parent("li").parent(".qs_ys").parent("li").index()+1;
		var index_wrap=$(this).parent("li").parent(".qs_ys").parent("li").parent("ul").parent("li").index()+1;
		$(".qs_all>div").each(function(index, el) {
			//不是饮食管理
			if($(this).index()!=2){
				$(this).children('.ys_detail').children('div').removeClass('cur');
			}
			else{
				$(this).children('.ys_detail').children('div').children('div').removeClass('cur');
			}
			
		});
		$(".qs_all .qu"+index_wrap+" .ys_detail .ys0"+index_parent+" .ys_detail0"+index_child).addClass('cur');
		
	});
});