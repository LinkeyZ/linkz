$(document).ready(function() {
	$(".ys_tab li").hover(function() {		
		$(this).children('ul').stop().slideDown(400);
	}, function() {
		$(this).children('ul').stop().slideUp(400);
	});
});