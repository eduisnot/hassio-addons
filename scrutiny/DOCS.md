# Scrutiny Documentation

## Overview

Scrutiny monitors S.M.A.R.T. data from the disks available to Home Assistant OS.

The app uses the official Scrutiny omnibus image. It includes:

- Scrutiny WebUI and API.
- The local S.M.A.R.T. collector.
- SQLite inventory storage.
- InfluxDB for historical metrics.

The collector runs automatically after startup and then on its configured schedule.

## Required permissions

This app needs direct access to host disk devices.

The add-on configuration exposes `/dev` to the container and uses full host access. This allows Scrutiny to discover disks automatically without requiring a fixed list such as `/dev/sda` or `/dev/nvme0n1`.

Disable **Protection mode** before starting the app:

1. Open **Settings** > **Apps** > **Scrutiny**.
2. Open the **Info** tab.
3. Disable **Protection mode**.
4. Start or restart the app.

Do not use this add-on from an untrusted repository.

## First startup

1. Install the app.
2. Disable Protection mode.
3. Start the app.
4. Wait one or two minutes.
5. Open the WebUI.
6. Check the add-on log if no drives are shown.

The first startup runs the collector automatically. Subsequent collections run daily at 03:00 by default.

## Configuration

The Home Assistant app options are:

| Option | Default | Description |
|---|---:|---|
| `collector_cron_schedule` | `0 3 * * *` | Cron schedule for S.M.A.R.T. collection |
| `collector_run_startup` | `true` | Run a collection when the app starts |
| `debug` | `false` | Enable verbose collector logs |
| `timezone` | `Europe/Madrid` | Container time zone |

The initial configuration is:

```yaml
collector_cron_schedule: "0 3 * * *"
collector_run_startup: true
debug: false
timezone: "Europe/Madrid"
```

A restart is required after changing app options.

## Persistent data

Home Assistant OS persists the app data outside the container:

```text
/addon_configs/<repository>_scrutiny/
```

The most relevant locations are:

```text
/addon_configs/<repository>_scrutiny/
├── scrutiny/
│   ├── scrutiny.db
│   ├── scrutiny.yaml
│   └── collector.yaml
└── influxdb/
```

Inside the container, these paths are available as:

```text
/opt/scrutiny/config
/opt/scrutiny/influxdb
```

Include the add-on configuration directory in your backup strategy if you want to preserve disk history.

## Disk detection

Scrutiny relies on `smartctl --scan` to discover available devices.

Supported disks depend on whether the host, storage controller, virtual-machine setup, USB bridge, and drive firmware expose S.M.A.R.T. data.

### NVMe

NVMe drives should appear automatically when HAOS has direct access to the physical NVMe controller.

If an NVMe disk is missing, inspect the add-on log and verify that HAOS itself can see the disk.

### USB enclosures

Some USB-to-SATA or USB-to-NVMe enclosures do not forward S.M.A.R.T. commands correctly. In that case, Scrutiny may detect the disk but fail to retrieve complete data.

You may need to define a device type override in:

```text
/config/scrutiny/collector.yaml
```

Example for a USB SATA bridge:

```yaml
devices:
  - device: /dev/sda
    type: sat
```

Restart the app after changing this file.

### Virtual machines

If HAOS runs in a virtual machine, Scrutiny can monitor physical disks only when the host passes through the actual disk or storage controller to the VM.

A normal virtual disk, such as `/dev/vda`, often does not expose real hardware S.M.A.R.T. information. In that case, run a Scrutiny collector directly on the hypervisor or another host with access to the physical disks.

## Troubleshooting

### No disks are listed

1. Verify that Protection mode is disabled.
2. Restart the app.
3. Enable `debug: true` in the app configuration.
4. Restart the app again.
5. Check the app logs for `smartctl --scan` output.

### Permission denied

If the log includes `Operation not permitted` or `Permission denied`:

1. Confirm that Protection mode is disabled.
2. Restart the app.
3. Confirm that the device is visible to HAOS.
4. Check whether HAOS runs inside a VM without physical disk passthrough.

### Device type is incorrect

Create or edit:

```text
/config/scrutiny/collector.yaml
```

For example:

```yaml
devices:
  - device: /dev/sda
    type: sat
```

For controller-specific examples, consult the upstream Scrutiny collector troubleshooting guide.

## Useful links

- Scrutiny repository: <https://github.com/AnalogJ/scrutiny>
- Device collector troubleshooting: <https://github.com/AnalogJ/scrutiny/blob/master/docs/TROUBLESHOOTING_DEVICE_COLLECTOR.md>
- Smartmontools: <https://www.smartmontools.org/>
