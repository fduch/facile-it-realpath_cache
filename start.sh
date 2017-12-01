#!/bin/bash
if [ $# -lt 2 ]
then
	echo "Usage: $0 <configuration name> <nginx mode>"
	echo "Configuration name allowed: production, production-no-opcache, production-no-realpath-cache"
	echo "Nginx mode allowed: document_root, realpath_root"
	exit
fi

case "$1" in

production|production-no-opcache|production-no-realpath-cache)  
	echo "Using <$1> configuration"
	PHP_CONFIG=$1
	;;
*) 
	echo "Usage: $0 <configuration name> <nginx mode>"
	echo "Configuration name allowed: production, production-no-opcache, production-no-realpath-cache"
	echo "Nginx mode allowed: document_root, realpath_root"
	exit
	;;
esac

case "$2" in

document_root|realpath_root)
	echo "Using <$2> nginx mode"
	NGINX_CONFIG=$2
	;;
*)
	echo "Usage: $0 <configuration name> <nginx mode>"
	echo "Configuration name allowed: production, production-no-opcache, production-no-realpath-cache"
	echo "Nginx mode allowed: document_root, realpath_root"
	exit
	;;
esac

docker run -it --rm --name php_cache_demo \
-v $(pwd)/logs:/var/log/supervisord \
-v $(pwd)/configs/$1.ini:/etc/php/7.0/fpm/conf.d/99-custom.ini \
-v $(pwd)/configs/nginx/includes/${NGINX_CONFIG}_fastcgi.conf:/etc/nginx/includes/fastcgi.conf \
-p 80:80 \
fduch/realpath_cache
