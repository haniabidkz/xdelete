#!/bin/bash
# Explicitly set the PHP binary and Composer binary paths:
export PHP_BINARY=/usr/local/bin/php
export COMPOSER_BINARY=/usr/bin/composer

# Execute the main command (php-fpm) with any arguments passed to this script
exec php-fpm "$@"
