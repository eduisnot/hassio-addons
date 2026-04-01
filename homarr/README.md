# 🌐 Home Assistant Add-on: Homarr v1 Server 🚀

Welcome to the **Homarr v1 Server for Home Assistant** App on this repository. This add-on allows you to run the Homarr v1 dashboard as a standalone service.

## Features

- **Independent**: Runs Homarr as a self-contained service inside Home Assistant OS.
- **Direct Access**: Available at `http://<your-home-assistant-ip>:7575`.
- **Persistent Storage**: Configuration and data are preserved across restarts, saved at \share\homarrv1

## About Homarr v1

Homarr v1+ is a complete redesign of the popular self-hosted dashboard, built to centralize access to your services and frequently used websites. It features a modern architecture with improved performance, stronger security, and enhanced customization options. Read more about Homarr [here](https://homarr.dev/).

For more detailed setup and configuration instructions, visit [Homarr's official documentation](https://homarr.dev/docs/getting-started/).

❗When a new version of Homarr is released, you can try updating the add-on by rebuilding it from the Home Assistant add-on page. Keep in mind that this may not always work as expected. If you encounter issues after upgrading, please open an issue in GitHub.


## Quick Start

1. **Install the Add-on**: Add this to your addon folder or add this repository to your Home Assistant add-on store.
2. **Run**: Start the add-on to launch Homarr v1 on port 7575.
3. **Access**: Open `http://<your-home-assistant-ip>:7575` in your browser to access your dashboard.

Your files are stored in `/share/homarrv1` within your Home Assistant instance.
