(function($){

  $.fn.StickyScroll=function(options){
  
	var defaults = {  
		unstick:true,
		easing:'linear',
		duration:500,
		queue:false
	}
	
	var options=$.extend(defaults, options);
    var $getObject=$(this).selector;
    
	if(options.unstick==true){  
		this.css('position','relative');
		jQuery($getObject+' .ScrollFix').css('position','absolute');
		jQuery($getObject+' .ScrollFix').css('cursor','pointer');
		jQuery($getObject+' .ScrollFix').click(function(){
			jQuery($getObject).animate(
				{top:"0px"},
				{queue:options.queue,easing:options.easing,duration:options.duration}
			);
			jQuery(window).unbind();
			jQuery('.ScrollFix').remove();
		});
	}
  	jQuery(window).scroll(function(){
        if(jQuery(window).scrollTop()>(jQuery($getObject).parent().offset().top) &&
          (jQuery($getObject).parent().height() + jQuery($getObject).parent().position().top-30)>(jQuery(window).scrollTop()+jQuery($getObject).height())){
        	jQuery($getObject).animate({ top: (jQuery(window).scrollTop()-jQuery($getObject).parent().offset().top)+"px"}, 
            {queue:options.queue,easing:options.easing,duration:options.duration});
        }
        else if(jQuery(window).scrollTop()<(jQuery($getObject).parent().offset().top)){
        	jQuery($getObject).animate({top:"0px"},
            {queue:options.queue,easing:options.easing,duration:options.duration});
        }
	});
  };
})( jQuery );
