# Navidrome – Home Assistant OS Addon

Local addon to install [Navidrome](https://www.navidrome.org) on ​​Home Assistant OS. It uses the official deluan/navidrome docker image.

## File Structure of this Addon 

```
navidrome-addon/
├── config.yaml # Addon config
├── DOCS.md # Addon docs
└── README.md # This file
```

## Manual Installation (Local Addon)

1. Access your Home Assistant OS via SSH or Samba
2. Copy this folder to `/addons/navidrome/`
3. In Home Assistant: **Supervisor → Add-on Store → ⋮ → Check for updates**
4. Install the add-on from "Local add-ons"

## Port

The Navidrome add-on exposes port 4533 of your Home Assistant.