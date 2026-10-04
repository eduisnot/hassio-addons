ARG BUILD_FROM=ghcr.io/home-assistant/base:latest
FROM ${BUILD_FROM}

RUN apk add --no-cache \
    kiwix-tools

COPY run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/run.sh"]
