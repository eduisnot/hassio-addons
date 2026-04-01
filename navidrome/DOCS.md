# Navidrome Addon for Home Assistant OS

Personal music server compatible with the Subsonic/Airsonic API. Allows you to listen to your collection from any compatible client (DSub, Symfonium, Ultrasonic, Feishin, etc.).

## Local Installation (if you downloaded this from the GitHub / Jump this if using the GitHub Repository)

1. Copy the `navidrome` folder to `/addons/` of your Home Assistant OS installation (you can do this via the **Samba** addon or **SSH**).

2. Go to **Supervisor → Add-on Store → ⋮ → Check for updates**.

3. Search for "Navidrome" in the **Local add-ons** section and install it.

## Configuration

| Option | Default | Description |

|--------|-------------|-------------|

`music_folder` | `/share/music` | Path to your music collection |

`log_level` | `info` | Log level (critical/error/warn/info/debug/trace) |

`cache_size` | `100MiB` | Image cache size |

`transcode_cache_size` | `100MiB` | Transcoding cache size |

## Music

Upload your music to `/share/music` (accessible from the Samba add-on as `\\homeassistant\share\music`). Navidrome will automatically scan it at startup and periodically.

## Access

Once started, access the web interface at:

```
http://<your-ip>:4533
```

The first time, you will be prompted to create an administrator user.


## Compatible Clients

Because it's compatible with the Subsonic API, you can use:
- **Web**: custom interface on port 4533
- **Android**: DSub, Ultrasonic, Symfonium, substreamer
- **iOS**: Amperfy, play:Sub
- **Desktop**: Feishin, Sonixd, Sublime Music

## Persistent Data

The database and cache are stored in the add-on's `/data` directory, which persists across reboots and updates.