$(window).load(function() {
	$('.dd').nestable();
	$('.dd-handle a').on('mousedown', function(e) {
		e.stopPropagation();
	});
	$('[data-rel="tooltip"]').tooltip();
	$.initProv("#pro", "#city");
	$.initProv("#up-pro", "#up-city");
	$("ol[name='chd_node']").find("button[data-action='collapse']").hide();
	$("ol[name='chd_node']").find("button[data-action='expand']").show();
	$(".chosen-select").chosen(); 
	$(".chosen-select-city").chosen(); 
	
	$('#save-form,#validation-form').on('shown.bs.modal', function () {
		$(this).find('.chosen-container').each(function(){
			$(this).find('a:first-child').css('width' , '180px');
			$(this).find('.chosen-drop').css('width' , '180px');
			$(this).find('.chosen-search input').css('width' , '170px');
		});
	});	
	$("#pro_chosen,#up_pro_chosen").css('width' , '187px');
	
	$(".chosen-select").chosen().change(function(){
		$(".chosen-select-city").trigger("chosen:updated");
	});
	
	//图片上传
	$('#id-input-file-3,#id-input-file-1').ace_file_input({
		no_file:'No File ...',
		btn_choose:'Choose',
		btn_change:'Change',
		droppable:false,
		onchange:null,
		thumbnail:true, //| true | large
		whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
	}).on('change', function(){
	});
	$('#id-input-file-4,#id-input-file-2').ace_file_input({
		style:'well',
		btn_choose:'拖放文件，或单击以选择',
		btn_change:null,
		no_icon:'icon-cloud-upload',
		droppable:true,
		thumbnail:'small',
		whitelist:'gif|png|jpg|jpeg|icon',
		preview_error : function(filename, error_code) {

		}

	}).on('change', function(){
	});
	
	$("#pro,#up-pro").change(function() {
	   var select = $(this);
	   if($(select).val()>=0){
		   $("input[name='province']").val($("option:selected",select).text());
	       $("input[name='city']").val($("option:selected",$(select).nextAll("select")).text());
	   }
    });
	
	$("#city,#up-city").change(function() {
		$("input[name='city']").val($("option:selected",$(this)).text());
	});
	
	//通过ajax加载子机构
	$(document).on("click","button[data-action='expand']",function(){
		var dd_list = $(this).parent().children("ol");
		var dd_item = $(this).parent("li");
		
		var id = $(this).parent().attr("data-id");
		if($(dd_list).children("li").length <= 0){
			$.ajax({
				type:"POST",
				url:"list?t=" + new Date().getTime(),
				data:{orginid:id},
				success:function(data){
					if(data.length>0){
						$.each(data,function(i,v){
							var corp = $("#clone-dd-item").clone();
							$(corp).attr("data-id",v.id);
							$(corp).attr("id","");
							$("a[type='addUser']",corp).attr("href","/admin/user/add?organid="+v.id);
							$("a[type='add']",corp).attr("orgid",v.id);
							$("a[type='update']",corp).attr("orgid",v.id);
							$("a[type='del']",corp).attr("orgid",v.id);
							$("a[type='check']",corp).attr("orgid",v.id);
							$(".orgname",corp).text(v.name);
							$("button[data-action='expand']",corp).show();
							$("button[data-action='collapse']",corp).hide();
							dd_list.append(corp);
						});
					}else{
						//没有子机构
						$(dd_list).remove();
						$("button[data-action='expand']",dd_item).hide();
						$("button[data-action='collapse']",dd_item).hide();
						$(".description",dd_item).show();
					}
				}
			});
		}
	});
	
	//添加子机构
	$(document).on("click","a[type='add']",function(){
		var parentid = $(this).attr("orgid");
		$("input[name='parentId']").val(parentid);
		$("input[name='province']").val("");
		$("input[name='city']").val("");
		$('#modal-form-save').modal('show');
	});
	
	//查看机构信息
	$(document).on("click","a[type='check']",function(){
		var id = $(this).attr("orgid");
		$.ajax({
			type:'GET',
			url: "update?t=" + new Date().getTime(),
			data: {orgid:id},
			success:function(data){
				if(data.status == 0){
					var organ = data.data;
					var box = $("#modal-form-check");
					$("input[name='id']",box).val(organ.id);
					$("input[name='name']",box).val(organ.name);
					$("input[name='linkman']",box).val(organ.linkman);
					$("textarea[name='description']",box).val(organ.description);
					$("textarea[name='serviceIntroduction']",box).val(organ.servieDescription);
					$("input[name='contact']",box).val(organ.contact);
					$("input[name='publishDate']",box).val(new Date(organ.publishDate).pattern("yyyy-MM-dd HH:mm:ss"));
					$("input[name='address']",box).val(organ.address);
					$("input[name='pro']",box).val(organ.province);
					$("input[name='city']",box).val(organ.city);
					if(organ.organizationType!=null){
						$("input[name='organizationType']",box).val(organ.organizationType.name);
					}
					$("textarea[name='recommend']",box).val(organ.recommend);
					if(organ.logoImage !=null && organ.logoImage !=""){
						$("img[name='logofile']",box).attr("src","/static/media/uploads/organlogo/"+organ.logoImage);
						$("span[name='logofile_nofile']",box).hide();
					}else{
						$("img[name='logofile']",box).hide();
						$("span[name='logofile_nofile']",box).show();
					}
					if(organ.appShouImage !=null && organ.appShouImage !=""){
						$("img[name='appShouImage']",box).attr("src","/static/media/uploads/organlogo/"+organ.appShouImage);
						$("span[name='appShouImage_nofile']",box).hide();
					}else{
						$("img[name='appShouImage']",box).hide();
						$("span[name='appShouImage_nofile']",box).show();
					}
					if(organ.showImage !=null && organ.showImage !=""){
						var images = new Array();
						images = organ.showImage.split(",");
						$.each(images,function(i,v){
							var img = "<img name='showfiles' width='120' height='120' src='/static/media/uploads/organlogo/"+v+"' class='img-thumbnail'/>";
							$("div[name='showfiles']",box).append(img);
						});
						$("span[name='showfiles_nofile']",box).hide();
					}else{
						$("span[name='showfiles_nofile']",box).show();
					}
					$(box).modal('show');
				}else{
					alert("发生系统错误请联系管理员");
					location.reload();
				}
			},
			error:function(){
				alert("发生系统错误请联系管理员");
				location.reload();
			}
		});
	});
	
	//弹出修改的box
	$(document).on("click","a[type='update']",function(){
		var id = $(this).attr("orgid");
		$("input[name='province']").val("");
		$("input[name='city']").val("");
		$.ajax({
			type:'GET',
			url: "update?t=" + new Date().getTime(),
			data: {orgid:id},
			success:function(data){
				if(data.status == 0){
					var organ = data.data;
					var box = $("#modal-form");
					$("input[name='id']",box).val(organ.id);
					$("input[name='name']",box).val(organ.name);
					$("input[name='linkman']",box).val(organ.linkman);
					$("textarea[name='description']",box).val(organ.description);
					$("textarea[name='serviceIntroduction']",box).val(organ.servieDescription);
					if(organ.description != null && organ.description != ""){
						tinyMCE.get("form-field-description").setContent(organ.description);
					}
					if(organ.servieDescription != null && organ.servieDescription != ""){
						tinyMCE.get("form-field-service").setContent(organ.servieDescription);
					}
					
					$("input[name='contact']",box).val(organ.contact);
					$("input[name='address']",box).val(organ.address);
					if(organ.province != null && organ.province != ""){
						$("#up-pro").val(organ.provinceIndex).trigger('change');
						$("#up-city").val(organ.cityIndex).trigger('change');
						$(".chosen-select",box).trigger("chosen:updated");
						$(".chosen-select-city",box).trigger("chosen:updated");
					}
					if(organ.organizationType != null){
						$("select[name='organizationType']").val(organ.organizationType.id);
					}
					$('#modal-form').modal('show');
					$("textarea[name='recommend']",box).val(organ.recommend);
					
				}else{
					alert("发生系统错误请联系管理员");
					location.reload();
				}
			},
			error:function(){
				alert("发生系统错误请联系管理员");
				location.reload();
			}
		});
	});
	
	//删除
	$(document).on("click","a[type='del']",function(){
		if(confirm_delete()){
			var id = $(this).attr("orgid");
			$.ajax({
				type:'GET',
				url:"del?t=" + new Date().getTime(),
				data:{orgid:id},
				success:function(data){
					alert(data.msg);
					location.reload();
				}
			});
		}
	});
	
	
	$('#validation-form').validate({
		rules:{
			name:{
				required:true
			}
		},
		messages:{
			name:{
				required:"<i style='color:#d68273;' class='fa fa-exclamation'>必填项</i>"
			}
		},
		highlight:function(e){
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight:function(e){
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		}
	});
	$('#save-form').validate({
		rules:{
			name:{
				required:true
			}
		},
		messages:{
			name:{
				required:"<i style='color:#d68273;' class='fa fa-exclamation'>必填项</i>"
			}
		},
		highlight:function(e){
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight:function(e){
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		}
	});
	
});
/**     
 * 对Date的扩展，将 Date 转化为指定格式的String     
 * 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q) 可以用 1-2 个占位符     
 * 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)     
 * eg:     
 * (new Date()).pattern("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423     
 * (new Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04     
 * (new Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04     
 * (new Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04     
 * (new Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18     
 */       
Date.prototype.pattern=function(fmt) {        
    var o = {        
    "M+" : this.getMonth()+1, //月份        
    "d+" : this.getDate(), //日        
    "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时        
    "H+" : this.getHours(), //小时        
    "m+" : this.getMinutes(), //分        
    "s+" : this.getSeconds(), //秒        
    "q+" : Math.floor((this.getMonth()+3)/3), //季度        
    "S" : this.getMilliseconds() //毫秒        
    };        
    var week = {        
    "0" : "日",        
    "1" : "一",        
    "2" : "二",        
    "3" : "三",        
    "4" : "四",        
    "5" : "五",        
    "6" : "六"       
    };        
    if(/(y+)/.test(fmt)){        
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));        
    }        
    if(/(E+)/.test(fmt)){        
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "星期" : "周") : "")+week[this.getDay()+""]);        
    }        
    for(var k in o){        
        if(new RegExp("("+ k +")").test(fmt)){        
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));        
        }        
    }        
    return fmt;        
};