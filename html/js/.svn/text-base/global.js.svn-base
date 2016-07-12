    // reference to the model of the currently active menu
    var _activeMenu;
    var _activeSection;
    var _activeSubsection;

    // SUBNAV
    // -------------
    
    // Highlights the active subnav, if any
    function initSubNav() {
	if( !_activeL3 ) {
	    doInitSubNav( _activeL2 );
	} else {
	    doInitSubNav( _activeL3 );
	}
    }

    function doInitSubNav( subsection ) {
	if( !subsection ) {
	    return;
	}
	var left = document.getElementById( 'content_left' );
	if( !left ) {
	    return;
	}
	var lis = left.getElementsByTagName( 'li' );
	for( i=0; i< lis.length ; i++ ) {
	    var li = lis[i];
	    if( li.id == subsection ) {
		li.className = 'active';
	    }
	}
    }

    // INITIALIZE MENUS
    // ---------------------
    // Initialize the menus
    function initMenus() {

       // Gather up references
       var menurow = document.getElementById( 'menurow' );
       var divs = menurow.getElementsByTagName( 'div' );

       var menuImgs = new Array( );
       var menus = new Array( );

       // Populate the element arrays
       for( var z=0; z<divs.length; z++ ) {

	    var div = divs[z];
	    var className = div.className;

	    if( className == 'menuImg' ) {
		menuImgs.push( div );
	    } else if( className == 'menu' ) {
		menus.push( div );
	    } else {
	       // no need for ref
	    }
       }
       // check

       // highlight the active
       for( i=0; i<menuImgs.length ; i++ ) {
	   var img = menuImgs[i].getElementsByTagName( 'img' )[0];
	   if( _activeSection ) {
	       if( -1 != img.src.toLowerCase().search( _activeSection.toLowerCase()+".gif" ) ) {
		   img.src = img.src.toLowerCase().replace( ".gif", "2.gif");
	       }
	   }
       }

       // Init each set
       for( i=0; i< menuImgs.length ; i++ ) {
	   var menuModel = new Object();
	   menuModel.index = i;
	   menuModel.menuImage = menuImgs[i];
	   menuModel.menu = menus[i];
	   
	   // Give each a back-reference
	   menuModel.menuImage.menuModel = menuModel;
	   menuModel.menu.menuModel = menuModel;

	   // attach events
	   initMenu( menuModel );
       }

    }

    // take an image and highlight it
    function highlightMenuImage( imageDiv ) {
       var img = imageDiv.getElementsByTagName( 'img' )[0];
       if( -1 == img.src.toLowerCase().search( "2.gif" ) ) {
	   img.src = img.src.toLowerCase().replace( ".gif", "2.gif");
       }
    }

    function dehighlightMenuImage( imageDiv ) {
       var img = imageDiv.getElementsByTagName( 'img' )[0];
       if( -1 != img.src.toLowerCase().search( "2.gif" ) ) {
	   img.src = img.src.toLowerCase().replace( "2.gif", ".gif");
       }
    }

    // Initialize a menu using the passed references
    function initMenu( menuModel ) {
	// menuModel attributes:
	// --------------------
	// index	  = index of menu
	// menuImage  = non-highlighted button
	// menu 	  = container of entire menu, including highlighted image
	// itemHead   = highlighted button inside of menu
	// items	  = actual menu, container for menu elements

	// Logic overview:
	// --------------
	// Mouse over menuImage	- show menu (hide any other active)
	// Mouse off menu 		- hide menu
	// mouse off items	 	- hide menu
	
	menuModel.menuImage.onmouseover = function( e ) { showMenu( menuModel, e) };
	menuModel.menuImage.onmouseout = function( e ) { hideMenu( menuModel, e ) };

	menuModel.menu.onmouseover = function( e ) { showMenu( menuModel, e) };
	menuModel.menu.onmouseout = function( e ) { hideMenu( menuModel, e ) };
       
    }



    // INITIALIZE MENU LISTS
    // ---------------------

    // initialize the lists within the menus
    function initMenuLists() {
       var menurow = document.getElementById( 'menurow' );
       var lis = menurow.getElementsByTagName( 'li' );
       for( i=0 ; i<lis.length ; i++ ) {
	   var li = lis[i];   
	   li.onmouseover = function() { menuItemOver( this ) };
	   li.onmouseout = function() { menuItemOut( this ) };
       }

    }

    // perform a mouse over action on a list item
    function menuItemOver( li ) {
	li.className = 'active';
    }

    // perform a mouse out action on a list item
    function menuItemOut( li ) {
	li.className = '';
    }

    // SHOW / HIDE MENUS
    // ------------------

    // Show the menu denoted by the passed model
    function showMenu( menuModel, e) {
	if( _activeMenu && _activeMenu.index != menuModel.index ) {
	    hideActiveMenu();
	}
	menuModel.menu.style.display = 'block';
	highlightMenuImage( menuModel.menuImage );
	_activeMenu = menuModel;
    }

    // Hide the currently active menu, if any
    function hideActiveMenu() {
	if( _activeMenu ) {
	    _activeMenu.menu.style.display = 'none';
	    dehighlightMenuImage( _activeMenu.menuImage );
	    _activeMenu = null;
	}
    }

    // Hide the menu for the given menu model
    function hideMenu( menuModel, e ) {
	if( !e ) {
	    e = window.event;
	}
	if( !e ) {
	   alert( "No event!" );
	}
	
	var target = null;
	if( e.toElement ) {
	    target = e.toElement;
	} else if( e.relatedTarget ) {
	    target = e.relatedTarget;
	}

	if( !_activeMenu || !isChildOf( _activeMenu.menu, target ) ) {
	    dehighlightMenuImage( menuModel.menuImage );
	    menuModel.menu.style.display = 'none';
	}

    }

    // Detect if one element is a child of another
    function isChildOf( parent, child ) {
       if( child ) {
	   while( child.parentNode ) {
	       if( (child = child.parentNode) == parent ) {
		   return true;
	       }
	   }
	      
       }
       return false;
    }

