# Readeck Addon for Home Assistant OS

Readeck is a "read-it-later" application: it saves readable web page content to read later, without ads or distractions. Similar to Pocket or Instapaper, but self-hosted.

## Installation (if you downloaded this from GitHub / Jump if using the repository directly on HAOS)

1. Copy the `readeck-addon` folder to `/addons/readeck/` on your Home Assistant OS.

2. **Admin → Add-on Store → ⋮ → Check for updates**.

3. Install "Readeck" from "Local Add-ons".

## Access

Once launched, access it at: `http://<your-home-assistant-ip>:8000`

The first time, you will be prompted to create an administrator user.

## Data

All data (SQLite database, saved articles, images) is stored in `/share/readeck/`, making it accessible and easy to back up.

## Features

- Save articles to read later
- Export to EPUB for reading on e-readers
- OPDS support for compatible e-readers
- Browser extension available
- Text highlighting in articles
- Collections and tags
