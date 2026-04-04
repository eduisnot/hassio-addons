# qBittorrent - Home Assistant Add-on

qBittorrent add-on based on the **official [linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent) image** for Home Assistant OS.

---

## 📁 Folder structure

| Host path | Purpose |
|---|---|
| `/share/qbittorrent/config` | qBittorrent configuration (persistent) |
| `/share/qbittorrent/webgui` | Custom WebUI files (optional) |
| Configurable via panel | Download and media folders |

> All folders are created automatically on start-up.

---

## ⚙️ Configuration

All options are available under **Supervisor → qBittorrent → Configuration** — no file editing needed.

### Available options

| Option | Default | Description |
|---|---|---|
| `WEBUI_PORT` | `8080` | WebUI port |
| `TORRENTING_PORT` | `6881` | Torrenting port (TCP/UDP) |
| `PUID` | `1000` | Process user ID |
| `PGID` | `1000` | Process group ID |
| `TZ` | `Europe/Madrid` | Timezone |
| `media_folders` | see below | List of folders exposed to qBittorrent |

---

## 📂 Managing media folders

The `media_folders` option lets you add or remove folders directly from the **Configuration** panel — no template editing required. Each entry is a path that must start with `/media` or `/share`.

**Default value:**
```
- /media/multimedia/downloads
- /media/multimedia/Movies
```

**How it works:**
- All listed folders are created automatically if they do not exist.
- The **first entry** in the list becomes qBittorrent's default save path.
- Changes take effect after **restarting the add-on**.
- Configuration is saved persistently in `/share/qbittorrent/config` and survives restarts and updates.

**Example — adding a TV Shows folder:**
```yaml
media_folders:
  - /media/multimedia/downloads
  - /media/multimedia/Movies
  - /media/multimedia/TVShows
```

> ⚠️ Paths outside `/media` and `/share` are silently ignored for security reasons.

---

## 🚀 First access

1. Start the add-on from **Supervisor → qBittorrent → Start**
2. Open the WebUI at `http://<your-ha-ip>:8080`
3. **Default credentials:**
   - Username: `admin`
   - Password: `adminadmin`
4. ⚠️ **Change the password immediately** under *Tools → Options → Web UI*

---

## 🖥️ Custom WebUI

To use an alternative WebUI (e.g. VueTorrent):

1. Download the alternative WebUI files
2. Copy them to `/share/qbittorrent/webgui/`
3. In qBittorrent → *Options → Web UI* → enable **"Use alternative Web UI"**
4. Set the path to: `/share/qbittorrent/webgui`

---

## 🌐 Network ports

| Port | Protocol | Description |
|---|---|---|
| `8080` | TCP | qBittorrent WebUI |
| `6881` | TCP | Torrenting |
| `6881` | UDP | Torrenting |

> If you change `WEBUI_PORT` or `TORRENTING_PORT`, remember to update the port mapping in the add-on configuration as well.

---

## 🔁 Persistence

All configuration is stored in `/share/qbittorrent/config`, which means:
- Settings **survive restarts and updates** of the add-on.
- You can **back up** everything by simply copying `/share/qbittorrent/`.
- Media folder choices are saved in the add-on options and restored automatically.

---

## 📋 Notes

- This add-on does **not modify** the official linuxserver image; it simply integrates it into the Home Assistant ecosystem.
- Supported architectures: `amd64`, `aarch64`, `armhf`, `armv7`
- Base image: `lscr.io/linuxserver/qbittorrent:latest`
