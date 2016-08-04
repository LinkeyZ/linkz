<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/linkz/static/js/jquery-1.9.1.min.js"></script>

<!--[if IE]>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='/linkz/static/js/jquery.min.js' charset='utf-8'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/linkz/static/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='/linkz/static/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="/linkz/static/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="/linkz/static/js/excanvas.min.js"></script>
<![endif]-->

<!-- JQuery-UI -->
<script src="/linkz/static/js/jquery-ui.custom.min.js"></script>
<script src="/linkz/static/js/jquery.ui.touch-punch.min.js"></script>
<script src="/linkz/static/js/jquery.easypiechart.min.js"></script>
<script src="/linkz/static/js/jquery.sparkline.min.js"></script>
<script src="/linkz/static/js/flot/jquery.flot.min.js"></script>
<script src="/linkz/static/js/flot/jquery.flot.pie.min.js"></script>
<script src="/linkz/static/js/flot/jquery.flot.resize.min.js"></script>

<!-- 多选择插件 -->
<script src="/linkz/static/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="/linkz/static/js/jquery.raty.min.js"></script>
<script src="/linkz/static/js/bootstrap-multiselect.min.js"></script>
<script src="/linkz/static/js/select2.min.js"></script>
<script src="/linkz/static/js/typeahead.jquery.min.js"></script>

<!-- dataTables插件 -->
<script src="/linkz/static/js/dataTables/jquery.dataTables.min.js" charset="utf-8"></script>
<script src="/linkz/static/js/dataTables/jquery.dataTables.bootstrap.min.js" charset="utf-8"></script>
<script src="/linkz/static/js/dataTables/extensions/TableTools/js/dataTables.tableTools.min.js" charset="utf-8"></script>
<script src="/linkz/static/js/dataTables/extensions/ColVis/js/dataTables.colVis.min.js" charset="utf-8"></script>

<script src="/linkz/static/js/bootbox.min.js"></script>
<script src="/linkz/static/js/jquery.colorbox.min.js"></script>

<!-- 上传文件 -->
<link rel="stylesheet" type="text/css" href="/linkz/static/filebrowser/uploadify/uploadify.css">
<script type="text/javascript" src="/linkz/static/filebrowser/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<script type="text/javascript" src="/linkz/static/filebrowser/uploadify/swfobject.js"></script>

<script src="/linkz/static/js/date-time/moment.min.js"></script>

<script src="/linkz/static/js/date-time/moment-with-locales.min.js"></script>

<script src="/linkz/static/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="/linkz/static/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="/linkz/static/js/date-time/daterangepicker.min.js"></script>
<script src="/linkz/static/js/date-time/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="/linkz/static/css/colorpicker.css">
<link rel="stylesheet" type="text/css" href="/linkz/static/css/datepicker.css">
<link rel="stylesheet" type="text/css" href="/linkz/static/css/bootstrap-datetimepicker.min.css">
<!-- jquery validate -->"
<script type="text/javascript" src="/linkz/static/js/jquery.validate.min.js">

<!-- ace scripts -->
<script src="/linkz/static/js/ace-elements.min.js"></script>
<script src="/linkz/static/js/ace.min.js"></script>

<!-- zTree -->
<script type="text/javascript" src="/linkz/static/zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/linkz/static/zTree/js/jquery.ztree.excheck-3.5.js"></script>

<!-- nestable -->
<script type="text/javascript" src="/linkz/static/js/jquery.nestable.min.js"></script>


<!-- inline scripts related to this page -->
<script type="text/javascript" charset="utf-8">
function confirm_delete() {
	var msg = "您真的确定要删除吗？\n\n请确认！"; 
	if (confirm(msg) == true){ 
		return true;
	} else { 
		return false; 
	} 
};

function confirm_test() {
	//e.preventDefault();
	var record = bootbox.confirm("Are you sure you want to delete", function (res) {
		if(res == true) { 
        	return true; 
		} else { 
		  return false; 
		} 
	});
};

var index = 0;
function addPanel(title, url){
	index++;
	if ($("#tt").tabs('exists', title)) {
		$('#tt').tabs('select', title);
		//var tab = $('#tt').tabs('refresh');
	} else {
		$('#tt').tabs('add', {
			title: title,
			href: url,
			closable: true
		});
	}
}
function removePanel(){
	var tab = $('#tt').tabs('getSelected');
	if (tab){
		var index = $('#tt').tabs('getTabIndex', tab);
		$('#tt').tabs('close', index);
	}
}



jQuery(function($) {
	
	var initZtree = (typeof setting != "undefined" && typeof zNodes != "undefined");
	if(initZtree){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	}
	
	$('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
		$(this).prev().focus();
	});
	
	/**
	<a style="padding:5px 16px;" href="javascript:FileBrowser.show('id_featured_image', 
	'/admin/media-library/browse?pop=1&amp;type=Image');" class="fb_show">
    	<img src="/linkz/static/filebrowser/img/filebrowser_icon_show.gif" alt="" />
	</a>
	**/
	
	$('#id_featured_image').click(function() {
		FileBrowser.show('id_featured_image', '/admin/media-library/browse?pop=1&type=Image');
	});
	
	/** 
	$('#id-input-file-1 , #id-input-file-2').ace_file_input({
		no_file:'No File ...',
		btn_choose:'Choose',
		btn_change:'Change',
		droppable:false,
		onchange:null,
		thumbnail:false //| true | large
		//whitelist:'gif|png|jpg|jpeg'
		//blacklist:'exe|php'
		//onchange:''
		//
	});
	**/
	

	
	var hasFlash = ((typeof navigator.plugins != "undefined" && typeof navigator.plugins["Shockwave Flash"] == "object") || (window.ActiveXObject && (new ActiveXObject("ShockwaveFlash.ShockwaveFlash")) != false));
	if (hasFlash) {
		$('#id_file').uploadify({
			//'buttonText' 		: "选择文件",
			'script' 			: '/admin/media-library/upload/file${params}',
			'uploader' 			: '/linkz/static/filebrowser/uploadify/uploadify.swf',
			'checkScript'       : '/admin/media-library/check/file${params}',
			'cancelImg'         : '/linkz/static/filebrowser/uploadify/cancel.png',
			'auto' 				: false,
			'folder'            : 'wow',
            'multi' 			: true,
            'fileDesc'          : '*.html;*.py;*.js;*.css;*.jpg;*.jpeg;*.gif;*.png;*.tif;*.tiff;*.mp3;*.mp4;*.wav;*.aiff;*.midi;*.m4p;*.mov;*.wmv;*.mpeg;*.mpg;*.avi;*.rm;*.pdf;*.doc;*.rtf;*.txt;*.xls;*.csv;',
            'fileExt'           : '*.html;*.py;*.js;*.css;*.jpg;*.jpeg;*.gif;*.png;*.tif;*.tiff;*.mp3;*.mp4;*.wav;*.aiff;*.midi;*.m4p;*.mov;*.wmv;*.mpeg;*.mpg;*.avi;*.rm;*.pdf;*.doc;*.rtf;*.txt;*.xls;*.csv;',
			'sizeLimit'         : 10485760,
			'scriptAccess'      : 'always',
            'queueSizeLimit'    : 50,
            'simUploadLimit'    : 1,
			'width'             : 300,
	        'height'            : 60,
			'hideButton'        : false,
            'wmode'             : 'transparent',
            'removeCompleted'   : true,
            'onAllComplete' 	: function(event,data) {location = '/admin/media-library/browse${params}';},
            translations		: {
                browseButton: 'BROWSE',
                error: 'An Error occured',
                completed: 'Completed',
                replaceFile: '你想替换文件',
                unitKb: 'KB',
                unitMb: 'MB'
            }
		});
		$('input:submit').click(function(){
            $('#id_file').uploadifyUpload();
            return false;
        });
        $('a.deletelink').click(function(evt){
			$('#id_file').uploadifyClearQueue();
			return false;
        });
	}
	
	// colorbox
	var $overflow = '';
	var colorbox_params = {
		rel: 'colorbox',
		reposition:true,
		scalePhotos:true,
		scrolling:false,
		previous:'<i class="ace-icon fa fa-arrow-left"></i>',
		next:'<i class="ace-icon fa fa-arrow-right"></i>',
		close:'&times;',
		current:'{current} of {total}',
		maxWidth:'100%',
		maxHeight:'100%',
		onOpen:function(){
			$overflow = document.body.style.overflow;
			document.body.style.overflow = 'hidden';
		},
		onClosed:function(){
			document.body.style.overflow = $overflow;
		},
		onComplete:function(){
			$.colorbox.resize();
		}
	};

	$('[data-rel="colorbox"]').colorbox(colorbox_params);
	$("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>");//let's add a custom loading icon
	
	
	$(document).one('ajaxloadstart.page', function(e) {
		$('#colorbox, #cboxOverlay').remove();
	});
	
	
		
	$("#bootbox-confirm--").on("click", function(e) {
		e.preventDefault();
		
		bootbox.confirm({
			message: "您真的确定要删除吗？",
			title: "Confirm title",
			buttons: {
			  confirm: {
				 label: "确认",
				 className: "btn-primary btn-sm"
			  },
			  cancel: {
				 label: "取消",
				 className: "btn-sm"
			  }
			},
			callback: function(result) {
				return true;
			}
		  }
		);
	});
	
	
	var demo1 = $('select[name="multiSelect"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
	var container1 = demo1.bootstrapDualListbox('getContainer');
	container1.find('.btn').addClass('btn-white btn-info btn-bold');

	//in ajax mode, remove remaining elements before leaving page
	$(document).one('ajaxloadstart.page', function(e) {
		$('[class*=select2]').remove();
		$('select[name="multiSelect"]').bootstrapDualListbox('destroy');
		$('.rating').raty('destroy');
		$('.multiselect').multiselect('destroy');
	});
	
	
	// initiate dataTables plugin
	//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX) 
	var oTable1 = $('#dynamic-table').dataTable( {
		bAutoWidth: false,
		//"aoColumns": [
		//  { "bSortable": false },
		//  null, null,null, null, null,
		//  { "bSortable": false }
		//],
		"aoColumnDefs": [
		   {"bSortable": false, "aTargets": ['unsortable']}
		 ],
		"aaSorting": [],

		//,
		//"sScrollY": "200px",
		//"bPaginate": false,

		//"sScrollX": "100%",
		//"sScrollXInner": "120%",
		//"bScrollCollapse": true,
		//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
		//you may want to wrap the table inside a "div.dataTables_borderWrap" element

		"iDisplayLength": 10, //每页显示10条数据
		
		"sPaginationType" : "full_numbers", // 分页风格
		"oLanguage" : {
			"sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "抱歉， 没有找到",
            "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
            "sInfoEmpty": "没有数据",
            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
            "sZeroRecords": "没有检索到数据",
			"sSearch": "名称:",
			"sProcessing": "正在加载数据...",
            "oPaginate": {
	            "sFirst": "首页",
	            "sPrevious": "前一页",
	            "sNext": "后一页",
	            "sLast": "尾页"
            }
		},
		"bProcessing": true //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
        //"bServerSide": true //开启服务器模式，使用服务器端处理配置datatable。注意：sAjaxSource参数也必须被给予为了给datatable源代码来获取所需的数据对于每个画。 这个翻译有点别扭。开启此模式后，你对datatables的每个操作 每页显示多少条记录、下一页、上一页、排序（表头）、搜索，这些都会传给服务器相应的值。
    } );
	//oTable1.fnAdjustColumnSizing();


	//TableTools settings
	TableTools.classes.container = "btn-group btn-overlap";
	TableTools.classes.print = {
		"body": "DTTT_Print",
		"info": "tableTools-alert gritter-item-wrapper gritter-info gritter-center white",
		"message": "tableTools-print-navbar"
	}

	//initiate TableTools extension
	var tableTools_obj = new $.fn.dataTable.TableTools( oTable1, {
		"sSwfPath": "/linkz/static/js/dataTables/extensions/TableTools/swf/copy_csv_xls_pdf.swf", //in Ace demo dist will be replaced by correct assets path
		
		"sRowSelector": "td:not(:last-child)",
		"sRowSelect": "multi",
		"fnRowSelected": function(row) {
			//check checkbox when row is selected
			try { $(row).find('input[type=checkbox]').get(0).checked = true }
			catch(e) {}
		},
		"fnRowDeselected": function(row) {
			//uncheck checkbox
			try { $(row).find('input[type=checkbox]').get(0).checked = false }
			catch(e) {}
		},

		"sSelectedClass": "success",
        "aButtons": [
			{
				"sExtends": "copy",
				"sToolTip": "复制",
				"sButtonClass": "btn btn-white btn-primary btn-bold",
				"sButtonText": "<i class='fa fa-copy bigger-110 pink'></i>",
				"fnComplete": function() {
					this.fnInfo( '<h3 class="no-margin-top smaller">复制数据表</h3>\
						<p>'+(oTable1.fnSettings().fnRecordsTotal())+' 条数据</p>',
						1500
					);
				}
			},
			
			{
				"sExtends": "xls",
				"sToolTip": "导出为Excel",
				"sButtonClass": "btn btn-white btn-primary  btn-bold",
				"sButtonText": "<i class='fa fa-file-excel-o bigger-110 green'></i>",
				"sCharSet": "utf8"
			},
			/**
			{
				"sExtends": "pdf",
				"sToolTip": "导出为PDF",
				"sButtonClass": "btn btn-white btn-primary  btn-bold",
				"sButtonText": "<i class='fa fa-file-pdf-o bigger-110 red'></i>"
				//"sCharSet": "utf8"
			},
			
			
			{
				"sExtends": "print",
				"sToolTip": "打印",
			 	"sRowSelect": "os",
				"sButtonClass": "btn btn-white btn-primary  btn-bold",
				"sButtonText": "<i class='fa fa-print bigger-110 grey'></i>",
				
				"sMessage": "<div class='navbar navbar-default'><div class='navbar-header pull-left'><a class='navbar-brand' href='#'><small>Optional Navbar &amp; Text</small></a></div></div>",
				
				"sInfo": "<h3 class='no-margin-top'>打印浏览</h3>\
						  <p>Please use your browser's print function to\
						  print this table.\
						  <br />Press <b>escape</b> when finished.</p>"
			}
			**/
        ]
    } );
	//we put a container before our table and append TableTools element to it
    $(tableTools_obj.fnContainer()).appendTo($('.tableTools-container'));
	
	//also add tooltips to table tools buttons
	//addding tooltips directly to "A" buttons results in buttons disappearing (weired! don't know why!)
	//so we add tooltips to the "DIV" child after it becomes inserted
	//flash objects inside table tools buttons are inserted with some delay (100ms) (for some reason)
	setTimeout(function() {
		$(tableTools_obj.fnContainer()).find('a.DTTT_button').each(function() {
			var div = $(this).find('> div');
			if(div.length > 0) div.tooltip({container: 'body'});
			else $(this).tooltip({container: 'body'});
		});
	}, 200);
	
	
	
	//ColVis extension
	var colvis = new $.fn.dataTable.ColVis( oTable1, {
		"buttonText": "<i class='fa fa-search'></i>",
		"aiExclude": [0, 6],
		"bShowAll": true,
		//"bRestore": true,
		"sAlign": "right",
		"fnLabel": function(i, title, th) {
			return $(th).text();//remove icons, etc
		}
		
	}); 
	
	//style it
	$(colvis.button()).addClass('btn-group').find('button').addClass('btn btn-white btn-info btn-bold');
	
	//and append it to our table tools btn-group, also add tooltip
	$(colvis.button())
	.prependTo('.tableTools-container .btn-group')
	.attr('title', 'Show/hide columns').tooltip({container: 'body'});
	
	//and make the list, buttons and checkboxed Ace-like
	$(colvis.dom.collection)
	.addClass('dropdown-menu dropdown-light dropdown-caret dropdown-caret-right')
	.find('li').wrapInner('<a href="javascript:void(0)" />') //'A' tag is required for better styling
	.find('input[type=checkbox]').addClass('ace').next().addClass('lbl padding-8');


	
	/////////////////////////////////
	//table checkboxes
	$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
	
	//select/deselect all rows according to table header checkbox
	$('#dynamic-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) tableTools_obj.fnSelect(row);
			else tableTools_obj.fnDeselect(row);
		});
	});
	
	//select/deselect a row when the checkbox is checked/unchecked
	$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
		var row = $(this).closest('tr').get(0);
		if(!this.checked) tableTools_obj.fnSelect(row);
		else tableTools_obj.fnDeselect($(this).closest('tr').get(0));
	});
	
	
	$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
		e.stopImmediatePropagation();
		e.stopPropagation();
		e.preventDefault();
	});
	
	
	//And for the first simple table, which doesn't have TableTools or dataTables
	//select/deselect all rows according to table header checkbox
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
	
	//select/deselect a row when the checkbox is checked/unchecked
	$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
		var $row = $(this).closest('tr');
		if(this.checked) $row.addClass(active_class);
		else $row.removeClass(active_class);
	});

	

	/********************************/
	//add tooltip for small view action buttons in dropdown menu
	$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
	
	//tooltip placement on right or left
	function tooltip_placement(context, source) {
		var $source = $(source);
		var $parent = $source.closest('table');
		var off1 = $parent.offset();
		var w1 = $parent.width();

		var off2 = $source.offset();
		//var w2 = $source.width();

		if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
		return 'left';
	}
	
	// TableTools end
	
	$('.easy-pie-chart.percentage').each(function(){
		var $box = $(this).closest('.infobox');
		var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
		var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
		var size = parseInt($(this).data('size')) || 50;
		$(this).easyPieChart({
			barColor: barColor,
			trackColor: trackColor,
			scaleColor: false,
			lineCap: 'butt',
			lineWidth: parseInt(size/10),
			animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
			size: size
		});
	})

	$('.sparkline').each(function(){
		var $box = $(this).closest('.infobox');
		var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
		$(this).sparkline('html',
						 {
							tagValuesAttribute:'data-values',
							type: 'bar',
							barColor: barColor ,
							chartRangeMin:$(this).data('min') || 0
						 });
	});


  //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
  //but sometimes it brings up errors with normal resize event handlers
  $.resize.throttleWindow = false;

  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
  var data = [
	{ label: "social networks",  data: 38.7, color: "#68BC31"},
	{ label: "search engines",  data: 24.5, color: "#2091CF"},
	{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
	{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
	{ label: "other",  data: 10, color: "#FEE074"}
  ]
  function drawPieChart(placeholder, data, position) {
 	  $.plot(placeholder, data, {
		series: {
			pie: {
				show: true,
				tilt:0.8,
				highlight: {
					opacity: 0.25
				},
				stroke: {
					color: '#fff',
					width: 2
				},
				startAngle: 2
			}
		},
		legend: {
			show: true,
			position: position || "ne", 
			labelBoxBorderColor: null,
			margin:[-30,15]
		}
		,
		grid: {
			hoverable: true,
			clickable: true
		}
	 })
 }
 drawPieChart(placeholder, data);

 /**
 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
 so that's not needed actually.
 */
 placeholder.data('chart', data);
 placeholder.data('draw', drawPieChart);


  //pie chart tooltip example
  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
  var previousPoint = null;

  placeholder.on('plothover', function (event, pos, item) {
	if(item) {
		if (previousPoint != item.seriesIndex) {
			previousPoint = item.seriesIndex;
			var tip = item.series['label'] + " : " + item.series['percent']+'%';
			$tooltip.show().children(0).text(tip);
		}
		$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
	} else {
		$tooltip.hide();
		previousPoint = null;
	}
	
 });

	/////////////////////////////////////
	$(document).one('ajaxloadstart.page', function(e) {
		$tooltip.remove();
	});




	var d1 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.5) {
		d1.push([i, Math.sin(i)]);
	}

	var d2 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.5) {
		d2.push([i, Math.cos(i)]);
	}

	var d3 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.2) {
		d3.push([i, Math.tan(i)]);
	}
	

	var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
	$.plot("#sales-charts", [
		{ label: "Domains", data: d1 },
		{ label: "Hosting", data: d2 },
		{ label: "Services", data: d3 }
	], {
		hoverable: true,
		shadowSize: 0,
		series: {
			lines: { show: true },
			points: { show: true }
		},
		xaxis: {
			tickLength: 0
		},
		yaxis: {
			ticks: 10,
			min: -2,
			max: 2,
			tickDecimals: 3
		},
		grid: {
			backgroundColor: { colors: [ "#fff", "#fff" ] },
			borderWidth: 1,
			borderColor:'#555'
		}
	});


	$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
	function tooltip_placement(context, source) {
		var $source = $(source);
		var $parent = $source.closest('.tab-content')
		var off1 = $parent.offset();
		var w1 = $parent.width();

		var off2 = $source.offset();
		//var w2 = $source.width();

		if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
		return 'left';
	}


	$('.dialogs,.comments').ace_scroll({
		size: 300
    });
	
	
	//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
	//so disable dragging when clicking on label
	var agent = navigator.userAgent.toLowerCase();
	if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
	  $('#tasks').on('touchstart', function(e){
		var li = $(e.target).closest('#tasks li');
		if(li.length == 0)return;
		var label = li.find('label.inline').get(0);
		if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
	});

	$('#tasks').sortable({
		opacity:0.8,
		revert:true,
		forceHelperSize:true,
		placeholder: 'draggable-placeholder',
		forcePlaceholderSize:true,
		tolerance:'pointer',
		stop: function( event, ui ) {
			//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
			$(ui.item).css('z-index', 'auto');
		}
		}
	);
	$('#tasks').disableSelection();
	$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
		if(this.checked) $(this).closest('li').addClass('selected');
		else $(this).closest('li').removeClass('selected');
	});


	//show the dropdowns on top or bottom depending on window height and menu position
	$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
		var offset = $(this).offset();

		var $w = $(window)
		if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
			$(this).addClass('dropup');
		else $(this).removeClass('dropup');
	});
	
	/////
});


$.extend({
	  getUrlVars: function(){
	    var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++)
	    {
	      hash = hashes[i].split('=');
	      vars.push(hash[0]);
	      vars[hash[0]] = hash[1];
	    }
	    return vars;
	  },
	  getUrlVar: function(name){
	    return $.getUrlVars()[name];
	  }
	})
</script>
