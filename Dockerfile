FROM php:8.0-fpm

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y \
    cron zlib1g-dev libpng-dev wget unzip \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev \
    libzip-dev

RUN docker-php-ext-configure gd \
    --with-jpeg \
    --with-freetype

RUN pecl install redis \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install sockets \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install zip \
    && docker-php-ext-install gd \
    && docker-php-ext-enable redis



RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

RUN printf '[PHP]\ndate.timezone = "Asia/Shanghai"\n' > /usr/local/etc/php/conf.d/tzone.ini



EXPOSE 9000

ENV LANG C.UTF-8

RUN  mkdir -p /usr/src/typecho &&\                                                                                                                                                                     
  wget  https://github.com/typecho/typecho/archive/master.zip -O master.zip && \                                                                                                                    
  unzip -d /usr/src/typecho/ master.zip && \                                                                                                                                                       
  rm -rf /tmp/*

COPY entrypoint.sh /entrypoint.sh                                                                                                                                                                   
RUN chmod +x /entrypoint.sh                                                                                                                                                                         
VOLUME /var/www/html
                                                                                                                                                                                                                                                                                                                                                                     
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["/entrypoint.sh" ]
CMD ["php-fpm"]
