# Homer Dashboard

Homer is a lightweight, static dashboard for collecting links to self-hosted services, local applications, and infrastructure tools.

## Access

Open the dashboard at:

```text
http://HOME_ASSISTANT_IP:8080
```

You can also use the **Open Web UI** button from the app page.

## Configuration files

Homer configuration files are stored persistently in:

```text
/app_configs/homer/
```

Inside the container, this directory is mounted at:

```text
/www/assets/
```

The main configuration file is:

```text
/app_configs/homer/config.yml
```

A starter configuration is generated on the first launch.

## Example configuration

```yaml
title: "My Homelab"
subtitle: "Local services"

services:
  - name: "Home Assistant"
    icon: "fas fa-home"
    subtitle: "Home automation"
    url: "http://homeassistant.local:8123"

  - name: "Jellyfin"
    icon: "fas fa-play"
    subtitle: "Media server"
    url: "http://jellyfin.local"

  - name: "Scrutiny"
    icon: "fas fa-hard-drive"
    subtitle: "Disk S.M.A.R.T. monitoring"
    url: "http://homeassistant.local:8082"
```

Reload the page in your browser after modifying `config.yml`.

## Custom assets

You can add custom icons, images, and CSS files to the same configuration directory.

For example:

```text
/app_configs/homer/assets/
/app_configs/homer/custom.css
```

See the upstream Homer documentation for all available configuration options:

<https://github.com/bastienwirtz/homer>
