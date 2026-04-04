# qBittorrent Add-on for Home Assistant

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg

**qBittorrent** BitTorrent client for Home Assistant OS, using the official [linuxserver.io](https://linuxserver.io) image.

## Installation

1. Copy the `qbittorrent-addon` folder into your local or community add-on repository.
2. In Home Assistant, go to **Supervisor → Add-on Store → ⋮ → Repositories**.
3. Add the URL of your repository.
4. Search for **qBittorrent** and install it.

## Quick start

- WebUI available at `http://<your-ha-ip>:8080`
- Username: `admin` | Password: `adminadmin` (change it immediately!)
- Persistent config stored at `/share/qbittorrent/`
- Downloads saved to `/media/multimedia/downloads`
- Movies saved to `/media/multimedia/Movies`

See [DOCS.md](DOCS.md) for full documentation.

