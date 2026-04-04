# Home Assistant Add-on: FileBrowser Quantum

FileBrowser Quantum is a web-based file manager using the `gtstef/filebrowser:latest` image. The UI listens internally on port 80 and is exposed externally on port 8383. [page:0]

This add-on stores its settings in `/share/filebrowser` and exposes the main Home Assistant folders inside the container, including `/ha_config`, `/ssl`, `/addons`, `/backup`, `/share`, `/media`, and `/addon_configs`. [page:2]
