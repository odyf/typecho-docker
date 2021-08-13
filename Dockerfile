FROM php:8.0-fpm-alpine3.13

LABEL maintainer="gao4top@gmali.com"

WORKDIR /var/www/html                                                                                                                                                                               
RUN  apk --update --no-cache add wget  unzip && \                                                                                                                                                   
  docker-php-ext-install pdo pdo_mysql bcmath  && \                                                                                                                                                 
  mkdir -p /usr/src/typecho &&\                                                                                                                                                                     
  wget  https://github.com/typecho/typecho/archive/master.zip -O master.zip && \                                                                                                                    
   unzip -d /usr/src/typecho/ master.zip && \                                                                                                                                                       
  rm -rf /tmp/* \
  cp -a /usr/src/typecho/typecho-master/* /var/www/html/ 

  VOLUME /var/www/html 