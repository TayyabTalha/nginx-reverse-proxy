FROM nginx:mainline-alpine
LABEL maintainer="Terry <terry@fullduplex.co.uk>"

ENV upstream "" 

COPY ./start.sh /start.sh
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./site.conf /etc/nginx/sites-available/default.conf

WORKDIR /var/www

RUN set -ex; \
apk --update upgrade --no-cache; \
apk add --no-cache \
  curl \
  zlib \
  ca-certificates \
  openssl 

RUN apk add --update \
bash \
openssh-client \
supervisor


RUN mkdir -p /etc/nginx && \
mkdir -p /etc/nginx/sites-available && \
mkdir -p /etc/nginx/sites-enabled && \
mkdir -p /run/nginx && \
ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf && \
mkdir -p /var/log/supervisor && \
chmod 755 /start.sh && \
chown -R nginx:nginx .

EXPOSE 80

CMD ["/start.sh"]
