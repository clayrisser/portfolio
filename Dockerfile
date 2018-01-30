FROM nginx:1.13.8-alpine

ARG tag=latest

LABEL image=jamrizzi/portfolio:${tag} \
      maintainer="Jam Risser <jam@jamrizzi.com> (https://jam.jamrizzi.com)" \
      base=alpine:3.4

RUN apk add --no-cache \
      tini && \
    apk add --no-cache --virtual deps \
      rsync \
      ruby

WORKDIR /var/www/html

COPY ./ /tmp

RUN mkdir -p /usr/local/sbin && \
    mv /tmp/entrypoint.sh /usr/local/sbin/entrypoint.sh && \
    mv /tmp/nginx.conf /etc/nginx/conf.d/default.conf && \
    rsync -a /tmp/_site/ /var/www/html/ && \
    chown -R nobody:nobody /var/www/html && \
    find /var/www/html -type f -exec chmod 644 {} \; && \
    find /var/www/html -type d -exec chmod 777 {} \; && \
    chmod -R +x /usr/local/sbin

RUN apk del deps && \
    rm -rf /tmp/* /tmp/.* &>/dev/null || true

EXPOSE 4000

ENTRYPOINT ["/sbin/tini", "--", "/bin/sh", "/usr/local/sbin/entrypoint.sh"]
