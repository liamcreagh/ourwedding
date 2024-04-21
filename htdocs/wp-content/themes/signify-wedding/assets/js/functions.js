
/*
 * Custom scripts
 * Description: Adding padding top for header to match with custom header
 */

( function( $ ) {
	var windowWidth = $(window).width();
    $( window ).on( 'load resize', function () {
        if( $( 'body' ).hasClass( 'has-header-media' ) || $( 'body' ).hasClass( 'color-scheme-wedding' )) {
            headerheight = $('.site-header-main').height();
            $('.color-scheme-wedding.has-header-media #masthead + .custom-header, .color-scheme-wedding #masthead + #feature-slider-section .hentry-inner').css('padding-top', headerheight );
        }
    });
} )( jQuery );
