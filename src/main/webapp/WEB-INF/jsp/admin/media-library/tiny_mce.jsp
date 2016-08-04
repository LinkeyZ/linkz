<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图文编辑器</title>
<%
String root_path = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath();
%>
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
function CustomFileBrowser(field_name, url, type, win) {
    tinyMCE.activeEditor.windowManager.open({
        file: window.__filebrowser_url + '?pop=2&type=' + type,
        width: 820,  // Your dimensions may differ - toy around with them!
        height: 500,
        resizable: "yes",
        scrollbars: "yes",
        inline: "yes",  // This parameter only has an effect if you use the inlinepopups plugin!
        close_previous: "no"
    }, {
        window: win,
        input: field_name,
        editor_id: tinyMCE.selectedInstance.editorId
    });
    return false;
}
//O2k7 skin
tinyMCE.init({
	// General options
	mode : "specific_textareas",
	elements : "elm2",
	theme : "advanced",	
	
	skin : "o2k7",
	
	// general settings
    width: '1000px',
    height: '450px',
    indentation : '10px',
    fix_list_elements : true,
    remove_script_host : true,
    accessibility_warnings : false,
    object_resizing: false,
    //cleanup: false, // SETTING THIS TO FALSE WILL BREAK EMBEDDING YOUTUBE VIDEOS
    forced_root_block: "p",
    remove_trailing_nbsp: true,
	
	// callbackss
    file_browser_callback: "CustomFileBrowser",

	// theme_advanced
    theme_advanced_toolbar_location: "top",
    theme_advanced_toolbar_align: "left",
    theme_advanced_statusbar_location: "",
    // Theme options
    theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
    theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
    theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
    theme_advanced_path: false,
    theme_advanced_blockformats: "p,h1,h2,h3,h4,pre",
    theme_advanced_styles: "[all] clearfix=clearfix;[p] small=small;[img] Image left-aligned=img_left;[img] Image left-aligned (nospace)=img_left_nospacetop;[img] Image right-aligned=img_right;[img] Image right-aligned (nospace)=img_right_nospacetop;[img] Image Block=img_block;[img] Image Block (nospace)=img_block_nospacetop;[div] column span-2=column span-2;[div] column span-4=column span-4;[div] column span-8=column span-8",
    theme_advanced_resizing : true,
    theme_advanced_resize_horizontal : false,
    theme_advanced_resizing_use_cookie : true,
    theme_advanced_styles: "Image left-aligned=img_left;Image left-aligned (nospace)=img_left_nospacetop;Image right-aligned=img_right;Image right-aligned (nospace)=img_right_nospacetop;Image Block=img_block",
    advlink_styles: "intern=internal;extern=external",
    theme_advanced_background_colors : "FF00FF,FFFF00,000000",

	// Example content CSS (should be your site CSS)
	content_css : "/static/css/content.css",

	// Drop lists for link/image/media/template dialogs
	template_external_list_url : "/static/lists/template_list.js",
	external_link_list_url : "/static/lists/link_list.js",
	external_image_list_url : "/static/lists/image_list.js",
	media_external_list_url : "/static/lists/media_list.js",
	
	// plugins
    plugins : "safari,pagebreak,style,table,advhr,advimage,advlink,emotions,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras",
    advimage_update_dimensions_onchange: true,

	// Replace values for the template plugin
	template_replace_values : {
		username : "Some User",
		staffid : "991234"
	},
	language:'zh-cn'
});
</script>
</head>
<body>
<textarea id="elm2" name="elm2" rows="15" cols="80" style="width: 80%">
你好, 世界!!!
</textarea>
</body>
</html>