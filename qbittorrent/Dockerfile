ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install qBittorrent-nox (headless) from Alpine/Debian repos
# The BUILD_FROM image is a Home Assistant base image (Alpine-based for most archs)
RUN apk add --no-cache qbittorrent-nox || \
    (apt-get update && apt-get install -y --no-install-recommends qbittorrent-nox && rm -rf /var/lib/apt/lists/*)

# Copy s6 service scripts and helpers
COPY rootfs /

RUN chmod a+x \
    /etc/services.d/qbittorrent/run \
    /etc/services.d/qbittorrent/finish \
    2>/dev/null || true

CMD ["/init"]
