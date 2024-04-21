<?php
/**
 * The template for displaying the Timeline
 *
 * @package Signify
 */


if ( ! function_exists( 'signify_timeline_display' ) ) :
	/**
	* Add Timeline
	*
	* @uses action hook signify_before_content.
	*
	* @since 1.0
	*/
	function signify_timeline_display() {
		$enable = get_theme_mod( 'signify_timeline_option', 'disabled' );

		if ( signify_check_section( $enable ) ) {
			$subtitle       = get_theme_mod( 'signify_timeline_subtitle' );
			$footer_text    = get_theme_mod( 'signify_timeline_footer_text' );
			$title          = get_theme_mod( 'signify_timeline_title' );
			$description    = get_theme_mod( 'signify_timeline_description' );
			$content_select = get_theme_mod( 'signify_timeline_type', 'category' );
			$story_image    = get_theme_mod( 'signify_timeline_image' );

			echo '<!-- refreshing cache -->';

			$classes[] = 'section';
			$classes[] = 'timeline-section';
			$classes[] = $content_select;

			$output ='
				<div id="timeline-section" class="' . esc_attr( implode( ' ', $classes ) ) . '">
					<div class="wrapper">';
						if ( $subtitle || $title || $description ) {

							$output .='<div class="section-heading-wrapper">';

							if ( $subtitle ) {
								$output .='<div class="section-subtitle">' . esc_html( $subtitle) . '</div>';
							}

							if ( $title ) {
								$output .='<div class="section-title-wrapper"><h2 class="section-title">' . wp_kses_post( $title ) . '</h2></div>';
							}

							if ( $description )  {
								$output .='<div class="section-description"><p>' . wp_kses_post( $description ) . '</p></div>';
							}

							$output .='</div><!-- .section-heading-wrap -->';
						}

						$output .='
						<div class="section-content-wrapper timeline-content-wrapper">';

							if( $story_image ) {
								$output .='<div class="story-image"><img src="'. esc_url( $story_image ) . '"></div>';
							}

							$output .='
							<div class="content-wrapper">';

							// Select content
							$output .= signify_post_page_category_timeline();

				$output .='</div><!-- .content-wrapper -->';

				$output .='
						</div><!-- .section-content-wrapper -->
					</div><!-- .wrapper -->
				</div><!-- #timeline-section -->';

			echo $output;
		}
	}
endif;

if ( ! function_exists( 'signify_post_page_category_timeline' ) ) :
	/**
	 * Display Page/Post/Category Timeline
	 *
	 * @since 1.0
	 */
	function signify_post_page_category_timeline() {
		global $post;

		$quantity     = get_theme_mod( 'signify_timeline_number', 4 );
		$no_of_post   = 0; // for number of posts
		$post_list    = array();// list of valid post/page ids
		$type         = get_theme_mod( 'signify_timeline_type', 'category' );
		$output       = '';

		$args = array(
			'ignore_sticky_posts' => 1 // ignore sticky posts
		);

		//Get valid number of posts
		for( $i = 1; $i <= $quantity; $i++ ){
			$post_id = get_theme_mod( 'signify_timeline_page_' . $i );
			$args['post_type'] = 'page';

			if ( $post_id ) {
				$post_list = array_merge( $post_list, array( $post_id ) );

				$no_of_post++;
			}
		}

		$args['post__in'] = $post_list;
		$args['orderby']  = 'post__in';

		if ( 0 == $no_of_post ) {
			return;
		}

		$args['posts_per_page'] = $no_of_post;

		$loop = new WP_Query( $args );

		while ( $loop->have_posts() ) {
			$loop->the_post();

			$title_attribute = the_title_attribute( 'echo=0' );
			$output .= '
				<article id="timeline-post-' . esc_attr( $loop->current_post + 1 ) . '" class="post hentry post">
					<div class="hentry-inner">
						<div class="post-thumbnail">
							<a href="' . esc_url( get_the_permalink() ) . '">';

							if ( has_post_thumbnail() ) {
								$output .= get_the_post_thumbnail( null );
							}

							$output .='
							</a>
						</div>';

				$event_date =  get_theme_mod( 'signify_events_timeline_date_' . absint( $loop->current_post + 1 ) );

				$output .=	'<div class="entry-container">';

				if( get_theme_mod( 'signify_timeline_display_date', 1 ) || get_theme_mod( 'signify_timeline_display_title', 1 ) ) {
					$output .= '<header class="entry-header">';
				}	

				if ( get_theme_mod( 'signify_timeline_display_title', 1 ) ) {
					$output .= '
								<h2 class="entry-title">
									' . the_title( '<a href="' . esc_url( get_permalink() ) . '" rel="bookmark">','</a>', false ) . '
								</h2>';
				}
				
				if( get_theme_mod( 'signify_timeline_display_date', 1 ) ) {
					$output .= '<div class="entry-meta">
									'. signify_posted_on( false ) . '
								</div>';
				}

				if( get_theme_mod( 'signify_timeline_display_date', 1 ) || get_theme_mod( 'signify_timeline_display_title', 1 ) ) {
					$output .= '</header>';
				}

				$output .= '<div class="entry-content">' . get_the_content() . '</div>';

				$output .= '
						</div><!-- .entry-container -->
					</div><!-- .hentry-inner -->
				</article><!-- .timeline-post -->';
			} //endwhile

		wp_reset_postdata();

		return $output;
	}
endif; // signify_post_page_category_timeline


if ( ! function_exists( 'signify_custom_timeline' ) ) :
	/**
	 * Display Custom Timeline
	 *
	 * @since 1.0
	 */
	function signify_custom_timeline() {
		$quantity = get_theme_mod( 'signify_timeline_number', 4 );
		$output   = '';

		for ( $i = 1; $i <= $quantity; $i++ ) {
			$target = get_theme_mod( 'signify_timeline_target_' . $i ) ? '_blank' : '_self';

			$link = get_theme_mod( 'signify_timeline_link_' . $i, '#' );

			//support qTranslate plugin
			if ( function_exists( 'qtrans_convertURL' ) ) {
				$link = qtrans_convertURL( $link );
			}

			$title = get_theme_mod( 'signify_timeline_title_' . $i );

			if ( class_exists( 'Polylang' ) ) {
				$title = pll__( esc_attr( $title ) );
			}

			$output .= '
				<article id="event-post-' . esc_html( $i ) . '" class="post hentry image">
					<div class="hentry-inner">';

			$image = get_theme_mod( 'signify_events_timeline_image_' . $i );

			$output .= '<div class="post-thumbnail">';

			if ( $image ) {
				$output .= '<a href="' . esc_url( $link ) . '">
								<img class="wp-post-image" src="' . esc_url( $image ) . '" >
							</a>';
			}

			$output .= '</div><!-- .post-thumbnail -->';

			$output .= '
					<div class="entry-container">';

					$event_date = get_theme_mod( 'signify_events_timeline_date_' . absint( $i ) );

					if ( $title || $event_date ) {
						$output .= '
								<header class="entry-header">';

						if( $title ) {
							$output .= '<h2 class="entry-title">
											' . wp_kses_post( $title ) . '
										</h2>';
						}

						if ( $event_date ) {
							$output .= '<div class="entry-meta"><span class="posted-on"><a target="' . $target . '" href="' . esc_url( $link ) . '" rel="bookmark"><time class="entry-date">' . esc_html( $event_date ) . '</time></a></span></div>';
						}

						$output .= '</header>';
					}									

					$content = get_theme_mod( 'signify_timeline_content_' . $i );

					if ( $content ) {
						$output .= '<div class="entry-content">
									<p>' . $content . '</p>
								</div><!-- .entry-summary -->';
					}

				$output .='
					</div><!-- .entry-container -->
				</article><!-- .event-post-' . esc_attr( $i ) . ' -->';
		}
		return $output;
	}
endif; //signify_custom_timeline
