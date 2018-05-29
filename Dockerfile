FROM alpine:3.4

ENV DOCKERIZE_VERSION=v0.3.0 \
    REMOTE_USER_HEADER="REMOTE_USER" \
    REMOTE_USER="admin@example.com"

RUN apk update && \
    apk add wget nginx && \
    wget --no-check-certificate https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN mkdir -p /run/nginx;
ADD nginx.tmpl /etc/nginx/nginx.tmpl
CMD ["dockerize", "-template", "/etc/nginx/nginx.tmpl:/etc/nginx/nginx.conf", "nginx"]
