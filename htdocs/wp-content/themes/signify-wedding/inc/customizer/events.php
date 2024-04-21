<?php
/**
* The template for adding Events Settings in Customizer
*
* @package Signify
*/

/**
 * Add featured content options to theme options
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function signify_events_options( $wp_customize ) {
	$wp_customize->add_section( 'signify_events', array(
			'panel' => 'signify_theme_options',
			'title' => esc_html__( 'Events', 'signify-wedding' ),
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_option',
			'default'           => 'disabled',
			'sanitize_callback' => 'signify_sanitize_select',
			'choices'           => signify_section_visibility_options(),
			'label'             => esc_html__( 'Enable on', 'signify-wedding' ),
			'section'           => 'signify_events',
			'type'              => 'select',
		)
	);
	
	signify_section_header_options( 'signify_events', 'events', 'signify_is_events_active' );

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_number',
			'default'           => 3,
			'sanitize_callback' => 'signify_sanitize_number_range',
			'active_callback'   => 'signify_is_events_active',
			'description'       => esc_html__( 'Save and refresh the page if No. of items', 'signify-wedding' ),
			'input_attrs'       => array(
				'style' => 'width: 45px;',
				'min'   => 0,
			),
			'label'             => esc_html__( 'No of items', 'signify-wedding' ),
			'section'           => 'signify_events',
			'type'              => 'number',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_enable_title',
			'default'           => 1,
			'sanitize_callback' => 'signify_sanitize_checkbox',
			'active_callback'   => 'signify_is_events_active',
			'label'             => esc_html__( 'Display Title', 'signify-wedding' ),
			'section'           => 'signify_events',
			'type'              => 'checkbox',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_display_date',
			'default'           => 1,
			'sanitize_callback' => 'signify_sanitize_checkbox',
			'active_callback'   => 'signify_is_events_active',
			'label'             => esc_html__( 'Display Event Date', 'signify-wedding' ),
			'section'           => 'signify_events',
			'type'              => 'checkbox',
		)
	);

	$number = get_theme_mod( 'signify_events_number', 3 );

	for ( $i=1; $i <= $number; $i++ ) {
		signify_register_option( $wp_customize, array(
				'name'              => 'signify_events_page_'. $i,
				'sanitize_callback' => 'signify_sanitize_post',
				'active_callback'   => 'signify_is_events_active',
				'label'             => esc_html__( 'Page', 'signify-wedding' ) . ' ' . $i ,
				'section'           => 'signify_events',
				'type'              => 'dropdown-pages',
			)
		);
	}

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_text',
			'sanitize_callback' => 'sanitize_text_field',
			'active_callback'   => 'signify_is_events_active',
			'label'             => esc_html__( 'Button Text', 'signify-wedding' ),
			'section'           => 'signify_events',
			'type'              => 'text',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_link',
			'default'           => '#',
			'sanitize_callback' => 'esc_url_raw',
			'active_callback'   => 'signify_is_events_active',
			'label'             => esc_html__( 'Button Link', 'signify-wedding' ),
			'section'           => 'signify_events',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_events_target',
			'sanitize_callback' => 'signify_sanitize_checkbox',
			'active_callback'   => 'signify_is_events_active',
			'label'             => esc_html__( 'Open Link in New Window/Tab', 'signify-wedding' ),
			'section'           => 'signify_events',
			'type'              => 'checkbox',
		)
	);
}
add_action( 'customize_register', 'signify_events_options', 10 );

/** Active Callbacks **/
if ( ! function_exists( 'signify_is_events_active' ) ) :
	/**
	* Return true if events is active
	*
	* @since  Signify Pro 1.0
	*/
	function signify_is_events_active( $control ) {
		$enable = $control->manager->get_setting( 'signify_events_option' )->value();

		return signify_check_section( $enable );
	}
endif;
