# Dockhand Local Add-on for Home Assistant

A modern, fast, and lightweight Docker and Docker Compose manager integrated directly into Home Assistant OS using Ingress.

## Features

- **No Dockerfile required:** Pulls the official, up-to-date image straight from the source.
- **Full Ingress Support:** Access the modern web UI directly from your Home Assistant sidebar.
- **Stack Management:** Easily deploy and update services like Watcharr, Plex, or any Docker Compose project.
- **Data Persistence:** Automatically maps to your `/share` directory.

## Requirements

- **Protection Mode** must be turned **OFF** before starting the add-on to grant access to the host Docker socket.
