var setting2 = {data: {simpleData: {enable: true}}};
$(window).load(function() {
	
	$("input[name='username']",$("#validation-form")).val("");
	$("input[name='password']").val("");
	
	$("input[name='username']",$("#validation-form")).blur(function(){
		var username = $("input[name='username']").val();
		$.ajax({
			type:"POST",
			url:"ajax/check_username",
			data: {username:username},
			success:function(data){
				if(data){
					$("label[name='accountError']").hide();
					$("input[name='password']").closest(".form-group").show();
					$("select[name='typeid']").closest(".form-group").show();
					$("input[name='selectStatus']").closest(".form-group").show();
					
				}else{
					$("label[name='accountError']").show();
					$("input[name='password']").closest(".form-group").hide();
					$("select[name='typeid']").closest(".form-group").hide();
					$("input[name='selectStatus']").closest(".form-group").hide();
				}
			}
		});
	});
	
	$(document).on("change","select[name^='multiSelect_helper']",function(){
		var array = new Array(); 
		var role ;
		$("select[name='multiSelect_helper2']").find('option').each(function(index, item) {
			array.push($(item).val());
		});
		role = array.join(",");
		$.ajax({
			type:"POST",
			url:"ajax/getModules?t="+ new Date().getTime(),
			data: {multiSelect:role},
			success:function(data){
				$.fn.zTree.destroy("moduleTree");
				if(data.length>0){
					var moduleTree = eval(data);
					$.fn.zTree.init($("#moduleTree"), setting2, moduleTree);
				}
			}
		});
	});
	
	$('#validation-form').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules:{
			username:{
				required:true
				//remote:"ajax/check_username"
			},
			password:{
				required:true
			},
			organ:{
				required:true,
			}
		},
		messages:{
			username:{
				required:"<i class='fa fa-exclamation'></i>必填项"
				//remote:"<i class='fa fa-exclamation'></i>此用户名已存在"
			},
			password:{
				required:"<i class='fa fa-exclamation'></i>必填项"
			},
			organ:{
				required:"<i class='fa fa-exclamation'></i>必填项",
			}
		},
		highlight:function(e){
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight:function(e){
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		},
		errorPlacement:function(error,element){
			error.insertAfter(element.parent());
		}
	});
	$('#validation-form-update').validate({
		errorElement:'div',
		errorClass:'help-block',
		rules:{
			username:{
				required:true,
				remote:{
					url:"ajax/check_user",
					type:"POST",
					data:{
						username:function(){
							return $("input[name='username']").val();
						},
						id:function(){
							return $("input[name='id']").val();
						}
					}
				}
			},
			organ:{
				required:true,
			}
		},
		messages:{
			username:{
				required:"<i class='fa fa-exclamation'></i>必填项",
				remote:"<i class='fa fa-exclamation'></i>此用户名已存在"
			},
			organ:{
				required:"<i class='fa fa-exclamation'></i>必填项",
			}
		},
		highlight:function(e){
			$(e).closest(".form-group").removeClass('has-info').addClass('has-error');
		},
		unhighlight:function(e){
			$(e).closest('.form-group').removeClass('has-error').addClass('has-info');
		},
		errorPlacement:function(error,element){
			error.insertAfter(element.parent());
		}
	});
});
var demo1 = $('select[name="multiSelect"]').bootstrapDualListbox();
function drawRoleSel(organid){
	var select = $('select[name="multiSelect"]');
	$(select).find("option").remove();
	$.ajax({
		type:"POST",
		url:"ajax/getRoles?t=" + new Date().getTime(),
		data:{organid:organid},
		success:function(data){
			$.each(data,function(i,v){
				$(select).append("<option value='"+v.id+"'>"+v.name+"</option>");
			});
			demo1.bootstrapDualListbox('refresh');
		}
	});
	var treeObj = $.fn.zTree.getZTreeObj("moduleTree");
	var nodes = treeObj.getNodes();
	for (var i = nodes.length-1; i >= 0; i--) {
	    treeObj.removeNode(nodes[i]);
	}
}