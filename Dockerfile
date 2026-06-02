FROM alpine:3.20

RUN apk add --no-cache \
    nginx \
    php82 \
    php82-fpm \
    php82-opcache \
    php82-mysqli \
    php82-pdo \
    php82-pdo_mysql \
    php82-mbstring \
    php82-json \
    php82-curl \
    php82-xml \
    php82-session \
    php82-tokenizer \
    php82-dom \
    php82-fileinfo \
    php82-ctype \
    php82-phar \
    php82-openssl \
    curl \
    bash

RUN mkdir -p /run/nginx /var/www/html

COPY nginx.conf /etc/nginx/http.d/default.conf
COPY src/ /var/www/html/
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && chown -R nginx:nginx /var/www/html

EXPOSE 80

CMD ["/entrypoint.sh"]
