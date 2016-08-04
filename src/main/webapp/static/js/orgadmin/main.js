function loadSubOrg(li){
	if(li.length > 0){
		$(li).each(function(i,v) {
			var id = $(v).attr('orgid');
			$.ajax({
				type:"POST",
				url:"sublist?t=" + new Date().getTime(),
				data:{orginid:id},
				success:function(data){
					if(data.length>0){
						var ul = $('<ul class="sec_menu"></ul>');
						$.each(data,function(n,m){
							ul.append('<li orgid="'+m.id+'"><a></a>'+m.name+'</li>');
						});
						$(v).after(ul);
						$(v).addClass("curItem");
						loadSubOrg($("li",ul));
					}
				}
		    });
		});
	}
}
function getFile(name,address){
    $("."+address+"").val($(name).val());
}
$(document).ready(function(){

    $("#links").css({"min-height":$(window).height()-120});
    $("#main").css({"min-height":$(window).height()-120});
    $("."+getUrlParam("curItem")).addClass("curItem");
    loadSubOrg($(".dialog li"));

    $(document).on("click",".dialog li>a",function( ) {
        var checkElement = $(this).parent().next();
        
        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
           // $(this).find(">a").css({"background":'url("images/arrow-right.png") no-repeat center center'});
            $(this).css({"background":'url("/static/images/orgadmin/arrow-right.png") no-repeat center center'});
            checkElement.slideUp('normal');
            return false;

        }
        if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
          //  $(this).find(">a").css({"background":'url("images/arrow-down.png") no-repeat center center'})
            $(this).css({"background":'url("/static/images/orgadmin/arrow-down.png") no-repeat center center'});
            checkElement.slideDown('normal');
            return false;
        }
        if (checkElement.html() == undefined) {
            $(this).removeClass("curItem");
           // $("div.tip_menu").hide();
        }
    });
    for(var i=1;i<$("ul.fir_menu>li").length;i++){
        var checkElement = $("ul.fir_menu>li:eq("+i+")").next();
        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
            checkElement.slideUp('normal');
            return false;

        }
    }
    $(document).on("mouseenter",".dialog li",function(){
    	  	$(this).append($(".dialog>ul.fir_menu .tip_menu"));
        $(this).find(".tip_menu").show();
    });
    $(document).on("mouseleave",".dialog li",function(){
        $(this).find(".tip_menu").hide();
    });
    $("ul .tip_menu>span").click(function(){
         //alert($(this).text());
    });
    $(document).on("click",".tip_menu .add_user",function(){
		var id = $(this).parents("[orgid]").attr("orgid");
       $("body .popContent").load("add_user?organid="+id);
    });
    $(document).on("click",".tip_menu .add_mechanism",function(){
    		var id = $(this).parents("[orgid]").attr("orgid");
        $("body .popContent").load("add_mechanism?parentId="+id);
    });
    $(document).on("click",".tip_menu .modify",function(){
    		var id = $(this).parents("[orgid]").attr("orgid");
        $("body .popContent").load("modify?id="+id);
    });
    $(document).on("click",".tip_menu .check",function(){
    		var id = $(this).parents("[orgid]").attr("orgid");
        $("body .popContent").load("check?id="+id);
    });
    $(document).on("click",".tip_menu .del",function(){
    		var id = $(this).parents("[orgid]").attr("orgid");
        $("body .popContent").load("del?id="+id);
    });
});

