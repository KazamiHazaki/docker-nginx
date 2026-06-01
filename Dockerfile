FROM alpine:3.20

RUN apk add --no-cache \
    nginx \
    php83 \
    php83-fpm \
    php83-opcache \
    php83-mysqli \
    php83-pdo \
    php83-pdo_mysql \
    php83-mbstring \
    php83-json \
    php83-curl \
    php83-xml \
    php83-session \
    php83-tokenizer \
    php83-dom \
    php83-fileinfo \
    php83-ctype \
    php83-phar \
    php83-openssl \
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
