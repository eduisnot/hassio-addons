# Kiwix Addon for Home Assistant OS

Kiwix server for reading offline content (Wikipedia, Project Gutenberg, Stack Overflow, etc.) in `.zim` format.

## Installation (if downloaded this from GitHub / Jump this if using the repository on HAOS)

1. Copy the `kiwix` folder to `/addons/kiwix/` of your Home Assistant OS.

2. **Supervisor → Add-on Store → ⋮ → Check for updates**.

3. Install "Kiwix" from "Local Add-ons".

## Where to put the .zim files

The `.zim` files should be placed in \share\kiwix

```

```
```

Accessible ie. from Samba as `\\homeassistant\share\kiwix\`.


⚠️ **Important**: Upon startup, Kiwix looks for `.zim` files in `/data` within the container, which is mapped to `/share` of your Home Assistant. Therefore, `.zim` files must be placed directly in `/share/kiwix/` and Kiwix will serve them all automatically.

If you add new `.zim` files, restart the add-on for it to detect them.

## Access

`http://<your-home-ip>:8080`

## Downloading Content

Download `.zim` files from: https://download.kiwix.org/zim/