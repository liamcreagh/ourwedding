<?php
/*
 * This is the child theme for Signify theme.
 */

/**
 * Enqueue default CSS styles
 */
function signify_wedding_enqueue_styles() {
	// Include parent theme CSS.
    wp_enqueue_style( 'signify-style', get_template_directory_uri() . '/style.css', null, date( 'Ymd-Gis', filemtime( get_template_directory() . '/style.css' ) ) );

    // Include child theme CSS.
    wp_enqueue_style( 'signify-wedding-style', get_stylesheet_directory_uri() . '/style.css', array( 'signify-style' ), date( 'Ymd-Gis', filemtime( get_stylesheet_directory() . '/style.css' ) ) );

    // Include Custom JS.
    wp_enqueue_script( 'signify-wedding-script', get_stylesheet_directory_uri() . '/assets/js/functions.js', array( 'jquery' ), date( 'Ymd-Gis', filemtime( get_stylesheet_directory() . '/assets/js/functions.js' ) ), true );

    // Load rtl css.
	if ( is_rtl() ) {
		wp_enqueue_style( 'signify-rtl', get_template_directory_uri() . '/rtl.css', array( 'signify-style' ), filemtime( get_stylesheet_directory() . '/rtl.css' ) );
	}

	// Enqueue child block styles after parent block style.
	wp_enqueue_style( 'signify-wedding-block-style', get_stylesheet_directory_uri() . '/assets/css/child-blocks.css', array( 'signify-block-style' ), date( 'Ymd-Gis', filemtime( get_stylesheet_directory() . '/assets/css/child-blocks.css' ) ) );
}
add_action( 'wp_enqueue_scripts', 'signify_wedding_enqueue_styles' );

/**
 * Add child theme editor styles
 */
function signify_wedding_editor_style() {
	add_editor_style( array(
			'assets/css/child-editor-style.css',
			signify_fonts_url(),
			get_theme_file_uri( 'assets/css/font-awesome/css/font-awesome.css' ),
		)
	);
}
add_action( 'after_setup_theme', 'signify_wedding_editor_style', 11 );

/**
 * Enqueue editor styles for Gutenberg
 */
function signify_wedding_block_editor_styles() {
	// Enqueue child block editor style after parent editor block css.
	wp_enqueue_style( 'signify-wedding-block-editor-style', get_stylesheet_directory_uri() . '/assets/css/child-editor-blocks.css', array( 'signify-block-editor-style' ), date( 'Ymd-Gis', filemtime( get_stylesheet_directory() . '/assets/css/child-editor-blocks.css' ) ) );
}
add_action( 'enqueue_block_editor_assets', 'signify_wedding_block_editor_styles', 11 );

/**
 * Loads the child theme textdomain and update notifier.
 */
function signify_wedding_setup() {
    load_child_theme_textdomain( 'signify-wedding', get_stylesheet_directory() . '/languages' );
}
add_action( 'after_setup_theme', 'signify_wedding_setup', 11 );

/**
 * Change default header image
 */
function signify_wedding_header_default_image( $args ) {
	$args['default-image']      = get_theme_file_uri( 'assets/images/header-image-wedding.jpg' );
	$args['default-text-color'] = '#ffffff';

	return $args;
}
add_filter( 'signify_custom_header_args', 'signify_wedding_header_default_image' );

/**
 * Register Google fonts Poppin for BusinessFociu
 *
 * @since Signify Wedding 1.0
 *
 * @return string Google fonts URL for the theme.
 */
function signify_fonts_url() {
	$fonts_url = '';
	$fonts     = array();
	$subsets   = 'latin,latin-ext';

	/* translators: If there are characters in your language that are not supported by Open+Sans, translate this to 'off'. Do not translate into your own language. */
	if ( 'off' !== _x( 'on', 'Open Sans font: on or off', 'signify-wedding' ) ) {
		$fonts[] = 'Open Sans:400,700';
	}

	/* translators: If there are characters in your language that are not supported by Lato, translate this to 'off'. Do not translate into your own language. */
	if ( 'off' !== _x( 'on', 'Playfair Display font: on or off', 'signify-wedding' ) ) {
		$fonts[] = 'Playfair Display:300,400,600,700,900';
	}

	$query_args = array(
		'family' => urlencode( implode( '|', $fonts ) ),
		'subset' => urlencode( $subsets ),
	);

	if ( $fonts ) {
		$fonts_url = add_query_arg( $query_args, 'https://fonts.googleapis.com/css' );
	}

	require_once get_theme_file_path( 'inc/wptt-webfont-loader.php' );

	$fonts_url = wptt_get_webfont_url( $fonts_url );

	return esc_url_raw( $fonts_url );
}

/**
 * Add Header Layout Class to body class
 *
 * @since 1.0.0
 *
 * @param array $classes Classes for the body element.
 * @return array (Maybe) filtered body classes.
 */
function signify_wedding_body_classes( $classes ) {
	// Added color scheme to body class.
	$classes['color-scheme'] = 'color-scheme-wedding';

	$classes['absolute-header'] = 'transparent-header-color-scheme';

	return $classes;
}
add_filter( 'body_class', 'signify_wedding_body_classes', 100 );

/**
 * Override parent theme sections to add timeline and events
 * @param  string $selector [description]
 * @return [type]           [description]
 */
function signify_sections( $selector = 'header' ) {
	get_template_part( 'template-parts/header/header-media' );
	get_template_part( 'template-parts/slider/display-slider' );
	get_template_part( 'template-parts/service/display-service' );
	get_template_part( 'template-parts/hero-content/content-hero' );
	get_template_part( 'template-parts/testimonial/display-testimonial' );
	get_template_part( 'template-parts/portfolio/display-portfolio' );
	get_template_part( 'template-parts/featured-content/display-featured' );	
	get_template_part( 'template-parts/timeline/content-timeline' );	
	get_template_part( 'template-parts/events/content-event' );	
}

/**
 * Signify Header Sections customizer display
 *
 * @since 1.0.0
 */
function signify_section_header_options( $section, $section_prefix, $active_callback ) {
	global $wp_customize;

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_' . $section_prefix . '_sub_title',
			'sanitize_callback' => 'wp_kses_post',
			'active_callback'   => $active_callback,
			'label'             => esc_html__( 'Section Tagline', 'signify-wedding' ),
			'section'           => $section,
			'type'              => 'text',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_' . $section_prefix . '_title',
			'sanitize_callback' => 'wp_kses_post',
			'active_callback'   => $active_callback,
			'label'             => esc_html__( 'Section Title', 'signify-wedding' ),
			'section'           => $section,
			'type'              => 'text',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_' . $section_prefix . '_description',
			'sanitize_callback' => 'wp_kses_post',
			'active_callback'   => $active_callback,
			'label'             => esc_html__( 'Section Description', 'signify-wedding' ),
			'section'           => $section,
			'type'              => 'textarea',
		)
	);
}

if ( ! function_exists( 'signify_section_header' ) ) :
	/**
	 * Display header of a section
	 */
	function signify_section_header( $tagline, $title, $description ) {
		if ( $title || $tagline || $description ) : ?>
			<div class="section-heading-wrapper">
				<?php if ( $tagline ) : ?>
					<div class="section-subtitle">
						<?php echo wp_kses_post( $tagline); ?>
					</div><!-- .section-description-wrapper -->
				<?php endif; ?>

				<?php if ( $title ) : ?>
					<div class="section-title-wrapper">
						<h2 class="section-title"><?php echo wp_kses_post( $title ); ?></h2>
					</div>
				<?php endif; ?>

				<?php if ( $description ) : ?>
					<div class="section-description">
						<p><?php echo wp_kses_post( $description ); ?></p>
					</div><!-- .section-description-wrapper -->
				<?php endif; ?>
			</div>
		<?php endif;
	}
endif;

/**
 * Include Timeline
 */
require get_theme_file_path( 'inc/customizer/timeline.php' );

/**
 * Include Events
 */
require get_theme_file_path( 'inc/customizer/events.php' );

/**
 * Include Events Display
 */
require get_theme_file_path( 'inc/events.php' );

/**
 * Include Timeline Display
 */
require get_theme_file_path( 'inc/timeline.php' );
