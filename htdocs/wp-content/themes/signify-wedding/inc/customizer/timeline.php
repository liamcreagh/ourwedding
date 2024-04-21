<?php
/**
* The template for adding Timeline Settings in Customizer
*
* @package Signify
*/

/**
 * Add timeline options to theme options
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function signify_timeline_options( $wp_customize ) {
	$wp_customize->add_section( 'signify_timeline', array(
			'panel' => 'signify_theme_options',
			'title' => esc_html__( 'Timeline', 'signify-wedding' ),
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_option',
			'default'           => 'disabled',
			'sanitize_callback' => 'signify_sanitize_select',
			'choices'           => signify_section_visibility_options(),
			'label'             => esc_html__( 'Enable on', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'              => 'select',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_subtitle',
			'sanitize_callback' => 'wp_kses_post',
			'active_callback'   => 'signify_is_timeline_active',
			'label'             => esc_html__( 'Tagline', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'              => 'text',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_title',
			'sanitize_callback' => 'wp_kses_post',
			'active_callback'   => 'signify_is_timeline_active',
			'label'             => esc_html__( 'Title', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'              => 'text',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_description',
			'sanitize_callback' => 'wp_kses_post',
			'active_callback'   => 'signify_is_timeline_active',
			'label'             => esc_html__( 'Description', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'              => 'textarea',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_image',
			'sanitize_callback' => 'signify_sanitize_image',
			'custom_control'    => 'WP_Customize_Image_Control',
			'active_callback'   => 'signify_is_timeline_active',
			'label'             => esc_html__( 'Story Image', 'signify-wedding' ),
			'section'           => 'signify_timeline',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_number',
			'default'           => 4,
			'sanitize_callback' => 'signify_sanitize_number_range',
			'active_callback'   => 'signify_is_timeline_active',
			'description'       => esc_html__( 'Save and refresh the page if No. of items', 'signify-wedding' ),
			'input_attrs'       => array(
				'style' => 'width: 45px;',
				'min'   => 0,
			),
			'label'             => esc_html__( 'No of items', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'              => 'number',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_display_title',
			'default'           => 1,
			'sanitize_callback' => 'signify_sanitize_checkbox',
			'active_callback'   => 'signify_is_timeline_active',
			'label'             => esc_html__( 'Display Title', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'   			=> 'checkbox',
		)
	);

	signify_register_option( $wp_customize, array(
			'name'              => 'signify_timeline_display_date',
			'default'           => 1,
			'sanitize_callback' => 'signify_sanitize_checkbox',
			'active_callback'   => 'signify_is_timeline_active',
			'label'             => esc_html__( 'Display Date', 'signify-wedding' ),
			'section'           => 'signify_timeline',
			'type'   			=> 'checkbox',
		)
	);

	$number = get_theme_mod( 'signify_timeline_number', 4 );

	for ( $i=1; $i <= $number; $i++ ) {
		signify_register_option( $wp_customize, array(
				'name'              => 'signify_timeline_page_'. $i,
				'sanitize_callback' => 'signify_sanitize_post',
				'active_callback'   => 'signify_is_timeline_active',
				'label'             => esc_html__( 'Page', 'signify-wedding' ) . ' ' . $i ,
				'section'           => 'signify_timeline',
				'type'              => 'dropdown-pages',
			)
		);
	}
}
add_action( 'customize_register', 'signify_timeline_options', 10 );

/** Active Callbacks **/
if ( ! function_exists( 'signify_is_timeline_active' ) ) :
	/**
	* Return true if timeline is active
	*
	* @since  Signify Pro Pro 1.0
	*/
	function signify_is_timeline_active( $control ) {
		$enable = $control->manager->get_setting( 'signify_timeline_option' )->value();

		return ( signify_check_section( $enable ) );
	}
endif;
