$("#nav > li > a").on('click',function(e){
        	      if($(this).parent().hasClass("has_sub")) {
        	        e.preventDefault();
        	      }   

        	      if(!$(this).hasClass("subdrop")) {
        	        // hide any open menus and remove all other classes
        	        $("#nav li ul").slideUp(350);
        	        $("#nav li a").removeClass("subdrop");
        	        
        	        // open our new menu and add the open class
        	        $(this).next("ul").slideDown(350);
        	        $(this).addClass("subdrop");
        	      }
        	      
        	      else if($(this).hasClass("subdrop")) {
        	        $(this).removeClass("subdrop");
        	        $(this).next("ul").slideUp(350);
        	      } 
        	      
        	  });