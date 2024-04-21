<?php
/**
 * The template for displaying the Events
 *
 * @package Signify
 */


if ( ! function_exists( 'signify_events_display' ) ) :
	/**
	* Add Events
	*
	* @uses action hook signify_before_content.
	*
	* @since Signify Pro 1.0
	*/
	function signify_events_display() {
		$enable = get_theme_mod( 'signify_events_option', 'disabled' );

		if ( signify_check_section( $enable ) ) {
			$sub_title      = get_theme_mod( 'signify_events_sub_title' );
			$title          = get_theme_mod( 'signify_events_title' );
			$description    = get_theme_mod( 'signify_events_description' );
			$background     = get_theme_mod( 'signify_events_bg_image' );
			$layout         = 'layout-three';

			$classes[] = 'page';

			if ( $background ) {
				$classes[] = 'has-background-image';
			}

			if ( ! $title && ! $sub_title && ! $description ) {
				$classes[] = 'no-section-heading';
			}

			$style = 'style-two';

            $classes[] = $style;

            if ( 'style-two' === $style ) {
            	$classes[] = $layout;
            }
			
			$output ='
				<div id="events-section" class="events-section section ' . esc_attr( implode( ' ', $classes ) ) . '">
					<div class="wrapper">';
						ob_start();

						signify_section_header( $sub_title, $title, $description );

						$output .= ob_get_clean();
						
						$output .='
						<div class="events-content-wrapper section-content-wrapper';

						if ( 'style-two' === $style ) {
			            	$output .= ' ' . esc_attr( $layout );
						}

						$output .='">';

						$output .='<div class="events-article-wrapper">';
					
						$output .= signify_post_page_category_events_style_two();
						
						$output .='</div><!-- .events-article-wrapper -->';

			$target = get_theme_mod( 'signify_events_target' ) ? '_blank': '_self';
			$link   = get_theme_mod( 'signify_events_link', '#' );
			$text   = get_theme_mod( 'signify_events_text' );
			$output .='</div><!-- .section-content-wrap -->';

			if ( $text ) {
				$output .= '
				<p class="view-more">
					<a class="button" target="' . $target . '" href="' . esc_url( $link ) . '">' . esc_html( $text ) . '</a>
				</p>';
			}
					$output .='</div><!-- .wrapper -->
				</div><!-- #events-section -->';

			echo $output;
		}
	}
endif;

if ( ! function_exists( 'signify_post_page_category_events_style_two' ) ) :
	/**
	 * Display Page/Post/Category Events for style two
	 *
	 * @since Signify Pro 1.0
	 */
	function signify_post_page_category_events_style_two() {
		global $post;

		$quantity   = get_theme_mod( 'signify_events_number', 3 );
		$no_of_post = 0; // for number of posts
		$post_list  = array();// list of valid post/page ids
		$output     = '';

		$args = array(
			'post_type'           => 'page',
			'orderby'             => 'post__in',
			'ignore_sticky_posts' => 1 // ignore sticky posts
		);

		//Get valid number of posts
		for( $i = 1; $i <= $quantity; $i++ ){
			$post_id = get_theme_mod( 'signify_events_page_' . $i ) ;

			if ( $post_id ) {
				$post_list = array_merge( $post_list, array( $post_id ) );

				$no_of_post++;
			}
		}

		$args['post__in'] = $post_list;

		if ( 0 == $no_of_post ) {
			return;
		}

		$args['posts_per_page'] = $no_of_post;

		$loop = new WP_Query( $args );

		while ( $loop->have_posts() ) {
			$loop->the_post();

			$title_attribute = the_title_attribute( 'echo=0' );

				$output .= '
				<article id="event-post-' . esc_attr( $loop->current_post + 1 ) . '" class="event-list-item post hentry post">
					<div class="hentry-inner">';

					$output .= signify_post_thumbnail( 'thumbnail', 'html', false );

					$output .= '<div class="entry-container">';
							$output .= '<div class="event-list-description">';

							if ( get_theme_mod( 'signify_events_enable_title', 1 ) ) {
								$output .= '
								<div class="event-title">
									<h2 class="entry-title">
										' . the_title( '<a href="' . esc_url( get_permalink() ) . '" rel="bookmark">','</a>', false ) . '
									</h2>
								</div>';
							}

							if ( get_theme_mod( 'signify_events_display_date', 1 ) ) {
								$event_date_day        = get_the_date( 'j' );
								$event_date_month      = get_the_date( 'M' );
								$event_date_year       = get_the_date( 'Y' );
								$event_date_day_meta   = get_post_meta( $post->ID, 'signify-event-date-day', true );
								$event_date_month_meta = get_post_meta( $post->ID, 'signify-event-date-month', true );
								$event_date_year_meta  = get_post_meta( $post->ID, 'signify-event-date-year', true );

								if ( '' !== $event_date_day_meta ) {
									$event_date_day = $event_date_day_meta;
								}

								if ( '' !== $event_date_month_meta ) {
									$event_date_month = $event_date_month_meta;
								}

								if ( '' !== $event_date_year_meta ) {
									$event_date_year = $event_date_year_meta;
								}

								$event_date_month = date( 'M', mktime(0, 0, 0, absint( $event_date_month ), 10 ) );

								$output .= '<div class="entry-meta"><span class="posted-on"><a href="' . esc_url( get_permalink() ) . '" rel="bookmark"><time class="entry-date">
										<span class="date-week-day">' . esc_html( $event_date_day ) . '</span>
										<div class="date-month-year">
											<span class="date-month">' . esc_html( $event_date_month ) . '</span>
											<span class="date-year">' . esc_html( $event_date_year ) . '</span>
										</div>
									</time></a></span></div>';
							}

							$text = get_theme_mod( 'signify_events_individual_text_' . absint( $loop->current_post + 1 )  );

							$content = apply_filters( 'the_content', get_the_content() );
							$content = str_replace( ']]>', ']]&gt;', $content );

							$output .= '<div class="entry-summary">' . wp_kses_post( $content );

							if ( $text ) {
								$output .=  '<a href="' . esc_url( get_permalink() ) . '" rel="bookmark" class="more-link">' . esc_html( $text ) . '</a>';
							}

							$output .= '</div><!-- .entry-summary --></div><!-- .event-list-description -->';			

							$output .= '
						</div><!-- .entry-container -->
					</div><!-- .hentry-inner -->
				</article><!-- .event-post-' . esc_attr( $loop->current_post + 1 ) . ' -->';
			} //endwhile

		wp_reset_postdata();

		return $output;
	}
endif; // signify_post_page_category_events
