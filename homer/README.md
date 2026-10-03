# Homer Dashboard

A Home Assistant OS app for [Homer](https://github.com/bastienwirtz/homer), a lightweight and static dashboard for self-hosted services.

## Features

- Static and lightweight dashboard.
- YAML-based configuration.
- Persistent configuration and custom assets.
- Configurable from the Home Assistant OS app configuration directory.
- Supports AMD64 and AArch64 Home Assistant OS installations.

## Access

After starting the app, open:

```text
http://HOME_ASSISTANT_IP:8080
```

You can also use the **Open Web UI** button from the Home Assistant app page.

## Configuration

The Homer configuration directory is mapped to:

```text
/app_configs/homer/
```

Inside the container, Homer uses the same directory as:

```text
/www/assets/
```

The main configuration file is:

```text
/app_configs/homer/config.yml
```

A starter configuration is created automatically on the first startup.

## Example configuration

```yaml
title: "My Homelab"
subtitle: "Self-hosted services"

services:
  - name: "Home Assistant"
    icon: "fas fa-home"
    subtitle: "Home automation"
    url: "http://homeassistant.local:8123"

  - name: "Jellyfin"
    icon: "fas fa-play"
    subtitle: "Media server"
    url: "http://jellyfin.local"

  - name: "LibreSpeed"
    icon: "fas fa-gauge-high"
    subtitle: "Network speed test"
    url: "http://homeassistant.local:8081"
```

Reload the browser page after modifying `config.yml`.

## Custom assets

Store custom icons, images, and CSS files in the same app configuration directory.

Examples:

```text
/app_configs/homer/assets/
/app_configs/homer/custom.css
```

## Upstream project

- Homer: <https://github.com/bastienwirtz/homer>
- Homer documentation: <https://github.com/bastienwirtz/homer/wiki>
