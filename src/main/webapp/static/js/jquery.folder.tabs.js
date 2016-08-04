function resetTabs(){
    $("#tabs a").attr("id",""); //Reset id's      
}
$(window).load(function() {
	var myTabIndex = $("input[name='myTabIndex']").val();
    $("#content > div").hide(); // Initially hide all content
    
    $("#content > div:first").fadeIn(); // Show first tab content
    $("#center > ul").hide(); //Hide all content
    $("#calendar"+myTabIndex).fadeIn(); 

    $("#tabs a").on("click",function(e) {
        if ($(this).attr("id") == "current"){ //detection for current tab
         return       
        }
        else{             
        resetTabs();
        $(this).attr("id","current"); // Activate this
        $("#"+$(this).attr('name')).fadeIn(); // Show content for current tab
        }
    });

    for (i = 1; i <= $("#tabs li").length; i++) {
    	  var myUrlTab = "#tab"+i; 
      if (myTabIndex == i) {
          resetTabs();
          $("a[name='tab"+myTabIndex+"']").attr("id","current"); // Activate url tab
          $(myUrlTab).fadeIn(); // Show url tab content     
      }
    }
});