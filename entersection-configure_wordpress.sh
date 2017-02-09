#!/bin/bash

# Use WP-CLI to update the siteurl and home options to use the IP address
# of the Docker machine this container's port 80 is forwarded to.
wp option set siteurl http://localhost --path=/var/www/html --allow-root
wp option set home http://localhost --path=/var/www/html --allow-root


# Use WP-CLI to delete unnecessary stock plugins
PLUGINS_TO_DELETE=(
    akismet
    hello-dolly
)

if [ -n $PLUGINS_TO_DELETE ]; then
for plugin_id in ${PLUGINS_TO_DELETE[@]}; do
	echo "$plugin_id";
  wp plugin delete $plugin_id --path=/var/www/html --color --allow-root
done
fi


# Use WP-CLI to install the Entersection plugin load
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

if [ -n $PLUGINS_TO_INSTALL ]; then
for plugin_id in ${PLUGINS_TO_INSTALL[@]}; do
	echo "$plugin_id";
  wp plugin install $plugin_id --activate --path=/var/www/html --color --allow-root
done
fi


# Use WP-CLI to delete the stock themes
THEMES_TO_DELETE=(
    twentyfifteen
    twentysixteen
    twentyseventeen
)

if [ -n $THEMES_TO_DELETE ]; then
for theme_id in ${THEMES_TO_DELETE[@]}; do
	echo "$theme_id";
  wp theme delete $theme_id --path=/var/www/html --color --allow-root
done
fi
