#!/usr/bin/env bash

chown dev:dev -R $PROJECT_PATCH
supervisord
php-fpm