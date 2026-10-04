# Scrutiny

Scrutiny is a S.M.A.R.T. disk health monitoring dashboard for Home Assistant OS.

It automatically detects disks visible to Home Assistant OS, collects S.M.A.R.T. metrics, stores historical data, and provides a web interface for checking drive health, temperatures, errors, wear levels, and other device-specific attributes.

## Features

- Automatic disk discovery.
- SATA, NVMe, USB, eMMC, and virtual-disk detection where S.M.A.R.T. is available.
- Historical S.M.A.R.T. metrics and drive health trends.
- Embedded Scrutiny WebUI, API, collector, and InfluxDB database.
- Persistent configuration and metrics stored in Home Assistant OS add-on configuration storage.
- Automatic collection after startup and on a daily schedule.

## Installation

1. Add this repository to Home Assistant.
2. Install the **Scrutiny** app.
3. Disable **Protection mode** in the app settings.
4. Start the app.
5. Open the WebUI.

On first start, Scrutiny scans the available host disks and imports their S.M.A.R.T. information automatically.

## WebUI

The dashboard is available from the **Open Web UI** button in Home Assistant, or at:

```text
http://HOME_ASSISTANT_IP:8080
```

## Important

This app requires elevated access to host disk devices in order to read S.M.A.R.T. information.

Only install apps from repositories you trust. Keep this repository private if you do not intend to distribute the app.

## Configuration storage

Scrutiny configuration, SQLite inventory data, and InfluxDB historical data are persisted by Home Assistant OS in:

```text
/addon_configs/<repository>_scrutiny/
```

Inside the container, this storage is mounted at:

```text
/config
```

## Support

- Scrutiny project: <https://github.com/AnalogJ/scrutiny>
- Scrutiny documentation: <https://github.com/AnalogJ/scrutiny/tree/master/docs>
