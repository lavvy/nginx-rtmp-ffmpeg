# Dockerfile for a simple Nginx stream replicator
FROM alpine:3.4
MAINTAINER David Bindloss <dbindloss+docker@gmail.com>

# Software versions
ENV NGINX_VERSION nginx-1.11.4
ENV NGINX_RTMP_MODULE_VERSION 1.1.7.10
ENV FFMPEG_VERSION=3.0.2

# Set up user
ENV USER nginx
RUN adduser -s /sbin/nologin -D -H ${USER}

# Install prerequisites and update certificates
RUN apk --update --no-cache add \
      nginx-rtmp \
      ffmpeg && \
      rm -rf /var/cache/apk/*

# Forward logs to Docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Set up config file
COPY nginx.conf /etc/nginx/nginx.conf

# Run the application
USER ${USER}

EXPOSE 1935

CMD ["nginx", "-g", "pid /tmp/nginx.pid; daemon off;"]
