<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
	<meta charset="UTF-8">
	<meta http-equiv="expires" content="-1" />
<link href="/static/jquery-easyui-1.3.4/themes/default/easyui.css" rel="stylesheet" type="text/css" />
<link href="/static/jquery-easyui-1.3.4/themes/icon.css" rel="stylesheet" type="text/css" />
<script src="/static/js/jquery-1.9.1.min.js"></script>
<script src="/static/jquery-easyui-1.3.4/jquery.easyui.min.js" type="text/javascript"></script>
<script src="/static/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>


</head>
<body>

	<body class="easyui-layout">
	<!-- header开始 -->
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
	<h2>管理系统</h2>
	</div>
	<!-- header结束 -->
	<!-- 左侧导航菜单开始 -->
	<div data-options="region:'west',split:true,title:'菜单'" style="width:250px;padding:10px;">
		<div class="easyui-accordion" data-options="fit:true" border="false">
			<div title="机构管理" data-options="selected:true" style="padding:10px;">

				<ul id ="tree" ></ul>
					</div>
			<div title="用户管理" style="padding:10px">
				<p>Content1</p>
			</div>
			<div title="Title2" style="padding:10px">
				<p>Content2</p>
			</div>
		</div>
	</div>
	<!-- 左侧导航菜单结束-->
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<!-- 中间Main菜单开始 -->
	<div data-options="region:'center',title:'Center'">
		<div class ="easyui-tabs" fit ="true" border ="false" id ="tabs">
			<div title ="机构列表" >
				<div>
					<table id="tt" style="width:auto;height:auto"></table>
				</div>
			</div>
		</div> 
	</div>
	<div id="openRoleDiv" class="easyui-window" closed="true"  title="添加机构" style="width:500px;height:350px;">
    	<iframe scrolling="auto" id='openXXXIframe' frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
    </div>
    <div id="updateRoleDiv" class="easyui-window" closed="true"  title="修改机构" style="width:500px;height:350px;">
    	<iframe scrolling="auto" id='openYYYIframe' frameborder="0"  src="" style="width:100%;height:100%;"></iframe>
    </div>
	<!-- 中间Main菜单结束 -->
</body>
<script type="text/javascript">

function initTree(){
	var treeData=[{ 
		text:"机构管理", 
		children:[{ 
			text:"机构列表", 
			attributes:{
				url:"" 
			} 
			},{
			text:"一级菜单2", 
			attributes:{ 
				url:"" 
			}
			}] 
		}]; 
	$("#tree").tree({
		data:treeData, 
		lines: true, 
		onClick: function(node){ 
			if(node.attributes){ 
				open(node.text,node.attributes.url); 
			} 
		} 
	});
};

$(function(){
	initTree();
	treeGrid();
});

function treeGrid(){
	
	$('#tt').treegrid({
		title : '',
		method:'get',
		url : '/admin/organization/getOrgList',
		idField : 'id',
		treeField : 'name',
		parentField : 'pid',
		rownumbers : true,
		pagination : false,
		sortName : 'seq',
		sortOrder : 'asc',
		columns:[[{field:'name',title:'机构名',width:180,formatter: function(value,row,index){
			return "<input type='checkbox' onclick=show('" + row.id + "') id='check_"+row.id+"' "+(row.checked?'checked':'')+"/>" + row.name;
		}
},
		  			{field:'description',title:'描述',width:60,align:'right'},
					{field:'organizationType',title:'机构类型',width:80},
					{field:'address',title:'地址',width:80},
					{field:'contact',title:'联系方式',width:80},
					{field:'publishDate',title:'创建日期',width:120},
					{title:'&nbsp;操作&nbsp;',width:80}
					]],
		toolbar:[{	id:'btnadd',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						$('#openXXXIframe')[0].src='/admin/organization/add';

						$('#openRoleDiv').dialog('open');
					}}
				,{
					id:'btncut',
					text:'修改',
					iconCls:'icon-edit',
					handler:function(){
						var rows = $('#tt').treegrid('getSelections');
						debugger;
						$('#openYYYIframe')[0].src='/admin/organization/update?id='+ rows[0].id;
						
						$('#updateRoleDiv').dialog('open');
					}
				},'-',{
					id:'btnsave',
					text:'删除',
					iconCls:'icon-cut',
					handler:function(){
						var rows = $('#tt').treegrid('getSelections');
						
					    if (rows && rows.length == 1) {
					        var showmsg = "";
					      //  if (rows[0].children.length != 0) {
					      //      // 下面有子节点
					      //      showmsg = "项目下面可能存在细则，是否也一起删除 ？";
					      //  } else {
					      //      showmsg = "是否删除此细则 ？";
					      //  }
					       showmsg = "是否删除此细则 ？";
					        parent.$.messager.confirm('提示', showmsg, function(r) {
					            if (r) {
					            	debugger;
					                $.ajax({
					                    url : "/admin/organization/del?id=" + rows[0].id,
					                    dataType : "json",
					                    success : function(data) {
					                    	window.parent.location.href='/admin/organization/list';
					                    }
					                });
					            }
					        });
					    } else {
					        parent.$.messager.alert('提示', "请选择一条要删除的项目！");
					    }
					
				}}],
		onBeforeLoad : function(row, param) {
			parent.$.messager.progress({
				text : '数据加载中....'
			});
		},
		onLoadSuccess : function(row, data) {
			parent.$.messager.progress('close');
		}
	});
};

function show(checkid){
	var realSelect;
	var rows = $('#tt').treegrid('getSelections');
	var flag = false;
	while(flag){
		if(typeof(rows[0].leaf) != "undefined"){
			
			//不是叶子节点
			realSelect = rows[0].id;
			
		}else{
			
		}
	}
    var s = '#check_'+checkid;
    //alert( $(s).attr("id"));
    // alert($(s)[0].checked);
    /*选子节点*/
     var nodes = $("#tt").treegrid("getChildren",checkid);
     for(i=0;i<nodes.length;i++){
        $(('#check_'+nodes[i].id))[0].checked = $(s)[0].checked;
     }

  }  
   
	
function open(text,url){
	if($("#tabs").tabs('exists',text)){
		$('#tabs').tabs('select',text); 
	} else{
		
		$('#tabs').tabs('add',{
			title:text, 
			closable: true,
			href:"/admin/organization/getOrgList",
			content:""
			}); 
		} 
}; 
</script>
</html>

