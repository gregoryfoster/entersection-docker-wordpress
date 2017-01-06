#!/bin/bash

WORDPRESS_PLUGINS=(
    addthis
    admin-commenters-comments-count
    amazon-machine-tags
    antispam-bee
    ?-audio-player
    broken-link-checker
    co-authors-plus
    comment-approved-notifier
    comment-form-quicktags
    custom-field-template
    fancybox-for-wordpress
    flash-video-player
    force-strong-passwords
    google-analyticator
    google-sitemap-generator
    oembed-for-comments
    search-meter
    ?-search-suggest
    ?-shortcode-manager
    spider-random-post
    subscribe-to-comments-reloaded
    twitter-for-wordpress
    wordfence
    wordpress-https
    ?-wp-recaptcha
    wp-recentcomments
    wp-relativedate
    wp-super-cache
    ?-ylsy_search_excerpt
    zemanta
)

# Use WP-CLI to install the plugin load
if [ -n $WORDPRESS_PLUGINS ]; then
for plugin_id in ${WORDPRESS_PLUGINS[@]}; do
	echo "$plugin_id";
  wp plugin install $plugin_id --activate --path=/var/www/html --color --allow-root
done
fi