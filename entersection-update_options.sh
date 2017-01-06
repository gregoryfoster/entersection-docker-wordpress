#!/bin/bash

# Use WP-CLI to update the siteurl and home options to use the IP address
# of the Docker machine this container's port 80 is forwarded to.
wp option set siteurl http://localhost --path=/var/www/html --allow-root
wp option set home http://localhost --path=/var/www/html --allow-root
