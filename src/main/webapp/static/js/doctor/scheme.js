$(document).ready(function() {
	//下拉列表
	$("body").on("click",".select_input" , function(event) {
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

	$("body").on("click",".select .select_choose li",function(event) {
		var show_value=$(this).html();
		$(this).closest('.select_choose').prev().val(show_value);
	});
	
	$("body").on("click",".minus_i",function(){
		$(this).closest("tr").remove();
	});
	
	$("body").on("click",".add_i",function(){
		var cloneTr = $(this).closest("tr").clone();
		$("input",cloneTr).val("");
		$(this).closest("table").append(cloneTr);
		$(this).attr("class","minus_i");
	});
	
	$("#submit").on("click",function(){
		$("input[name='assaySchemes[0].name']").each(function(n,m){
			$(this).attr("name","assaySchemes["+n+"].name");
		});
		$("input[name='assaySchemes[0].anticipativeTarget']").each(function(n,m){
			$(this).attr("name","assaySchemes["+n+"].anticipativeTarget");
		});
		$("input[name='assaySchemes[0].frequency']").each(function(n,m){
			$(this).attr("name","assaySchemes["+n+"].frequency");
		});
		$("input[name='assaySchemes[0].remind']").each(function(n,m){
			$(this).attr("name","assaySchemes["+n+"].remind");
		});
		$("input[name='monitorSchemes[0].name']").each(function(n,m){
			$(this).attr("name","monitorSchemes["+n+"].name");
		});
		$("input[name='monitorSchemes[0].anticipativeTarget']").each(function(n,m){
			$(this).attr("name","monitorSchemes["+n+"].anticipativeTarget");
		});
		$("input[name='monitorSchemes[0].frequency']").each(function(n,m){
			$(this).attr("name","monitorSchemes["+n+"].frequency");
		});
		$("input[name='monitorSchemes[0].remind']").each(function(n,m){
			$(this).attr("name","monitorSchemes["+n+"].remind");
		});
		$("input[name='medicineSchemes[0].name']").each(function(n,m){
			$(this).attr("name","medicineSchemes["+n+"].name");
		});
		$("input[name='medicineSchemes[0].medicationInterval']").each(function(n,m){
			$(this).attr("name","medicineSchemes["+n+"].medicationInterval");
		});
		$("input[name='medicineSchemes[0].dosage']").each(function(n,m){
			$(this).attr("name","medicineSchemes["+n+"].dosage");
		});
		$("input[name='medicineSchemes[0].remind']").each(function(n,m){
			$(this).attr("name","medicineSchemes["+n+"].remind");
		});
		$("input[name='medicineSchemes[0].caution']").each(function(n,m){
			$(this).attr("name","medicineSchemes["+n+"].caution");
		});
		$("input[name='healthProductsSchemes[0].name']").each(function(n,m){
			$(this).attr("name","healthProductsSchemes["+n+"].name");
		});
		$("input[name='healthProductsSchemes[0].medicationInterval']").each(function(n,m){
			$(this).attr("name","healthProductsSchemes["+n+"].medicationInterval");
		});
		$("input[name='healthProductsSchemes[0].dosage']").each(function(n,m){
			$(this).attr("name","healthProductsSchemes["+n+"].dosage");
		});
		$("input[name='healthProductsSchemes[0].remind']").each(function(n,m){
			$(this).attr("name","healthProductsSchemes["+n+"].remind");
		});
		$("input[name='healthProductsSchemes[0].caution']").each(function(n,m){
			$(this).attr("name","healthProductsSchemes["+n+"].caution");
		});
		$("#saveScheme").submit();
	});

});