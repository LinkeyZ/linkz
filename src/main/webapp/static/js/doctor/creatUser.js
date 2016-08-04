$(document).ready(function() {
	var initZtree = (typeof setting != "undefined" && typeof zNodes != "undefined");
	if(initZtree){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	}
	
	$(".btn-group .btn_l").click(function(event) {
		var size=$(this).next().children('option').size();
		if(size!=0){
			$(this).next().children('option').each(function(index, el) {
				var selectValue=$(this).html();
				if (typeof(selectValue) == 'string') {
					$(".btn-group .btn_r").next().append('<option>' + selectValue + '</option>');
				}
			});
			$(this).next().children('option').remove();
		}
	});
	$(".btn-group .btn_r").click(function(event) {
		var size=$(this).next().children('option').size();
		if(size!=0){
			$(this).next().children('option').each(function(index, el) {
				var selectValue=$(this).html();
				if (typeof(selectValue) == 'string') {
					$(".btn-group .btn_l").next().append('<option>' + selectValue + '</option>');
				}
			});
			$(this).next().children('option').remove();
		}
	});
	 
	$("select[name='fromMultiple']").click(function(){
		var text = $(this).find("option:selected").text();
		var value = $(this).find("option:selected").attr("value");
		if(''!=text){
		  $("select[name='multiSelect']").append("<option value='"+value+"'>"+text+"</option>");
		}
		$(this).find("option:selected").remove();
	});

	$("select[name='multiSelect']").click(function(){
		var text = $(this).find("option:selected").text();
		var value = $(this).find("option:selected").attr("value");
		if(''!=text){
			  $("select[name='fromMultiple']").append("<option value='"+value+"'>"+text+"</option>");
		}
		$(this).find("option:selected").remove();
	});
});


var setting = {
		check : {
			enable : true,
			chkStyle : "radio",
			radioType : "all"
		},
		view : {
			dblClickExpand : false
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onClick,
			onCheck : onCheck
		}
	};

	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.checkNode(treeNode, !treeNode.checked, null, true);
		return false;
	}

	function onCheck(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
				.getCheckedNodes(true), v = "",id="";
		for ( var i = 0, l = nodes.length; i < l; i++) {
			v += nodes[i].name + ",";
			id += nodes[i].id+",";
		}
		if (v.length > 0)
			v = v.substring(0, v.length - 1);
		if (id.length > 0)
			id = id.substring(0, id.length - 1);
		var parentName = $("#parentSel");
		var organization = $("#organization");
		parentName.attr("value", v);
		organization.attr("value",id);
		drawRoleSel(id);
	}
	$("#logmap_tmpl").change(function(){});

	function showMenu() {
		var parentObj = $("#parentSel");
		var parentOffset = $("#parentSel").offset();
		$("#menuContent").css("margin-top","0px");
		$("#menuContent").css({
			left:parentOffset.left-180 + "px"
		}).slideDown("fast");
		$("#treeDemo_1_ico").attr("class","button ico_open");
		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "citySel"
				|| event.target.id == "menuContent" || $(event.target).parents(
				"#menuContent").length > 0)) {
			hideMenu();
		}
	}

	var demo1 = $('select[name="fromMultiple"]').bootstrapDualListbox();
	function drawRoleSel(organid){
		var select = $('select[name="fromMultiple"]');
		$(select).find("option").remove();
		$.ajax({
			type:"POST",
			url:"ajax/getRoles?t=" + new Date().getTime(),
			data:{organid:organid},
			success:function(data){
				$.each(data,function(i,v){
					 if(v.roleType==4){
					  $(select).append("<option value='"+v.id+"'>"+v.name+"</option>");
					 }
					 
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