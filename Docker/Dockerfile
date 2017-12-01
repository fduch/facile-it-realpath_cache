FROM ubuntu:16.04

MAINTAINER Alex Medvedev <alex.medwedew@gmail.com>
LABEL maintainer="Alex Medvedev <alex.medwedew@gmail.com>" \
      org.label-schema.docker.dockerfile="Docker/Dockerfile" \
      org.label-schema.name="Ubuntu 16.04 + Nginx 1.10.3 + PHP 7.0 using FPM/FastCGI" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/fduch/facile-it-realpath_cache.git"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
RUN /usr/sbin/update-locale

RUN apt-get install -y \
	vim \
	curl \
	supervisor \
	php7.0 \
	php7.0-opcache \
	nginx

RUN rm -v /etc/nginx/nginx.conf

COPY resources/nginx.conf /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN apt-get autoremove && apt-get clean

RUN mkdir -p /run/php

COPY resources/releases /var/www/html
RUN ln -sf /var/www/html/release1 /var/www/current
RUN chown -R www-data:www-data /var/www

COPY script /home
RUN chmod +x /home/release-switch.sh /home/release-watch.sh

COPY resources/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

WORKDIR /home

EXPOSE 80