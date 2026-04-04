# Jellyfin add-on

This add-on runs Jellyfin using the official `jellyfin/jellyfin:latest` image. [web:284]

## Storage layout

- Configuration: `/share/jellyfin/config`
- Data: `/share/jellyfin/data`
- Cache: `/share/jellyfin/cache`
- Logs: `/share/jellyfin/log`
- Media libraries: `/media` [web:292][page:0]

When adding libraries in Jellyfin, browse content under `/media`. [page:0]

## Ports

- `8096/tcp`: HTTP web interface
- `8920/tcp`: optional HTTPS
- `7359/udp`: client discovery
- `1900/udp`: DLNA discovery [web:284]
