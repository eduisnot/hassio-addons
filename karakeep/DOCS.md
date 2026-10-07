# Karakeep Configuration & Usage Guide

Thank you for installing the Karakeep Add-on! This guide will help you understand how your data is stored and how to log in for the first time.

## First Time Login

1. Once the Add-on is started, click on **Open Web UI** (or find it in your Home Assistant sidebar if enabled).
2. Since this is a fresh installation, you will be prompted to **Sign Up** or create your first administrator account.
3. Follow the on-screen instructions to set your email and password. This account is entirely local to your Home Assistant instance.

## Data & Backups

- **Storage Location:** All your bookmarks, downloaded content, and database files are stored inside your Home Assistant directory at `/share/karakeep`.
- **Security:** A unique `NEXTAUTH_SECRET` token is securely generated on your machine during the first boot. It is hidden in a dotfile (`.nextauth_secret`) inside your data directory to prevent session highjacking.
- **Backups:** Because the data sits in the `/share` folder, your files will be included automatically whenever you perform a **Partial or Full Backup** via Home Assistant Settings.

## Network Settings

By default, the Add-on exposes port `3000` to your local network. You can access it via `http://<your-home-assistant-ip>:3000`. If you wish to change the port, you can do so under the **Configuration** tab of the Add-on page.
