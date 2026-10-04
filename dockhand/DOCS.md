# Documentation: Dockhand Local

This add-on runs the official **Dockhand** image to manage your Docker containers and stacks directly inside Home Assistant OS.

## Installation

1. Install the add-on from the **Local Add-ons** section.
2. Go to the add-on **Info** tab.
3. **CRITICAL:** Disable **Protection Mode** (Secure Mode). This allows Dockhand to access the host's `/var/run/docker.sock`.
4. Enable **Show in sidebar** for easy access.
5. Click **Start**.

## Configuration

No extra configuration is required. The add-on is ready to use out of the box and automatically mounts the `/share` folder to store your persistent Docker Compose stacks data.
