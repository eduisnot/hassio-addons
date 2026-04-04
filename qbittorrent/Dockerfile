ARG BUILD_FROM=lscr.io/linuxserver/qbittorrent:latest
FROM ${BUILD_FROM}

# ─── Metadata ─────────────────────────────────────────────────────────────────
LABEL \
    io.hass.name="qBittorrent" \
    io.hass.description="qBittorrent torrent client with WebUI - official linuxserver image" \
    io.hass.arch="aarch64|amd64|armhf|armv7" \
    io.hass.type="addon" \
    io.hass.version="1.0.0" \
    maintainer="Home Assistant Community"

# ─── Install bashio for HA scripts ───────────────────────────────────────────
RUN apk add --no-cache \
        bash \
        curl \
    && curl -fsSL https://raw.githubusercontent.com/hassio-addons/bashio/master/lib/bashio.sh \
        -o /usr/lib/bashio/bashio.sh \
    && chmod +x /usr/lib/bashio/bashio.sh \
    || true

# ─── Copy add-on files ────────────────────────────────────────────────────────
COPY rootfs /

# ─── Set execute permissions ──────────────────────────────────────────────────
RUN chmod a+x /etc/services.d/qbittorrent/run 2>/dev/null || true

# ─── Default environment variables ───────────────────────────────────────────
ENV \
    PUID=1000 \
    PGID=1000 \
    TZ=Europe/Madrid \
    WEBUI_PORT=8080 \
    TORRENTING_PORT=6881

# ─── Volumes ──────────────────────────────────────────────────────────────────
# /share/qbittorrent          → Main config directory and custom WebUI
# /media/multimedia/descargas → Downloads folder
# /media/multimedia/Movies    → Movies folder
VOLUME ["/share/qbittorrent", "/media/multimedia/descargas", "/media/multimedia/Movies"]

# ─── Exposed ports ────────────────────────────────────────────────────────────
EXPOSE 8080 6881 6881/udp

# ─── Entrypoint ───────────────────────────────────────────────────────────────
# The linuxserver image uses /init as its entrypoint
CMD ["/init"]
