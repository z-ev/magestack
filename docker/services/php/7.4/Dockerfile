FROM php:7.4-fpm-alpine

LABEL maintainer="Eugene Zab <e@zab.bz>"

RUN apk update && apk upgrade && apk add --no-cache \
    libjpeg-turbo-dev \
    oniguruma-dev \
    freetype-dev \
    libxml2-dev \
    libzip-dev \
    libpng-dev \
    supervisor \
    curl-dev \
    gettext \
    curl \
	bash \
	libmcrypt-dev \
	icu-dev \
    libxslt-dev \
    php7-mcrypt

RUN docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    tokenizer \
    mbstring \
	ctype \
    iconv \
	json \
    curl \
	pdo \
	xml \
	zip \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd \
	&& curl -sS https://getcomposer.org/installer -o composer-setup.php \
	&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl \
    xsl \
    soap \
    sockets \
    bcmath

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.9.2 \
    && docker-php-ext-enable xdebug

RUN pwd && ls -al

RUN addgroup -g 1000 dev \
    && adduser -u 1000 -G dev -s /bin/sh -D dev

