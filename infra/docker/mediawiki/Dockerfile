FROM mediawiki:latest

ENV TZ=UTC \
	# locale
	LANG=ja_JP.UTF-8 \
	LANGUAGE=ja_JP:ja \
	LC_ALL=ja_JP.UTF-8 \
	COMPOSER_ALLOW_SUPERUSER=1 \
	COMPOSER_HOME=/composer

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
	apt-get -y install git libicu-dev libonig-dev libzip-dev unzip locales && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	locale-gen ja_JP.UTF-8 && \
	localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 && \
	mkdir /var/run/php-fpm && \
	docker-php-ext-install intl pdo_mysql zip bcmath
