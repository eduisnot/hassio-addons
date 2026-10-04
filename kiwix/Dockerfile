ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_VERSION

RUN apk add --no-cache \
    kiwix-tools \
    bash \
    jq

COPY run.sh /run.sh

RUN chmod a+x /run.sh

LABEL \
    io.hass.name="Kiwix" \
    io.hass.description="Servidor Kiwix para archivos ZIM" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.arch="${BUILD_ARCH}"

CMD ["/run.sh"]
