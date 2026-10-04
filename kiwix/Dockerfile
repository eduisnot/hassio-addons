ARG BUILD_FROM=ghcr.io/kiwix/kiwix-serve:3.8.1
FROM ${BUILD_FROM}

ARG BUILD_VERSION
ARG BUILD_ARCH

LABEL \
    io.hass.name="Kiwix" \
    io.hass.description="Servidor Kiwix para archivos ZIM" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.arch="${BUILD_ARCH}"

COPY run.sh /run.sh

RUN chmod a+x /run.sh

CMD ["/run.sh"]
