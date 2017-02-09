#!/bin/bash

PLUGINS_TO_INSTALL=(
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
    google-analytics-for-wordpress
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
    wp-mail-smtp
    ?-wp-recaptcha
    wp-relativedate
    wp-super-cache
    ?-ylsy_search_excerpt
)

# Use WP-CLI to install the plugin load
if [ -n $PLUGINS_TO_INSTALL ]; then
for plugin_id in ${PLUGINS_TO_INSTALL[@]}; do
	echo "$plugin_id";
  wp plugin install $plugin_id --activate --path=/var/www/html --color --allow-root
done
fi


PLUGINS_TO_DELETE=(
    akismet
    hello-dolly
)

# Use WP-CLI to delete unnecessary stock plugins
if [ -n $PLUGINS_TO_DELETE ]; then
for plugin_id in ${PLUGINS_TO_DELETE[@]}; do
	echo "$plugin_id";
  wp plugin delete $plugin_id --path=/var/www/html --color --allow-root
done
fi
