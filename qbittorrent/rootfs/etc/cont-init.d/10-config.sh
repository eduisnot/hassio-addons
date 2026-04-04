#!/bin/sh
set -e

OPTIONS="/data/options.json"

# ─── Read options ─────────────────────────────────────────────────────────────
WEBUI_PORT=$(jq -r '.WEBUI_PORT // 8080' "${OPTIONS}")
TORRENTING_PORT=$(jq -r '.TORRENTING_PORT // 6881' "${OPTIONS}")
PUID=$(jq -r '.PUID // 1000' "${OPTIONS}")
PGID=$(jq -r '.PGID // 1000' "${OPTIONS}")
TZ=$(jq -r '.TZ // "Europe/Madrid"' "${OPTIONS}")
CPU_PERCENT=$(jq -r '.cpu_percent // 80' "${OPTIONS}")
MEMORY_MB=$(jq -r '.memory_mb // 512' "${OPTIONS}")

# Write to a temp env file so the service script can read them
cat > /var/run/qbt-env << EOF
WEBUI_PORT=${WEBUI_PORT}
TORRENTING_PORT=${TORRENTING_PORT}
PUID=${PUID}
PGID=${PGID}
TZ=${TZ}
CPU_PERCENT=${CPU_PERCENT}
MEMORY_MB=${MEMORY_MB}
EOF

echo "[qbt-init] WebUI port      : ${WEBUI_PORT}"
echo "[qbt-init] Torrenting port : ${TORRENTING_PORT}"
echo "[qbt-init] CPU limit       : ${CPU_PERCENT}%"
echo "[qbt-init] Memory limit    : ${MEMORY_MB} MB"

# ─── Persistent config dir ────────────────────────────────────────────────────
CONFIG_DIR="/share/qbittorrent"
mkdir -p "${CONFIG_DIR}/config"
mkdir -p "${CONFIG_DIR}/webgui"

# ─── Create user-configured media folders ─────────────────────────────────────
FIRST_FOLDER=""
FOLDER_COUNT=$(jq '.media_folders | length' "${OPTIONS}")
i=0
while [ "${i}" -lt "${FOLDER_COUNT}" ]; do
    folder=$(jq -r ".media_folders[${i}]" "${OPTIONS}")
    case "${folder}" in
        /media/*|/share/*)
            mkdir -p "${folder}"
            echo "[qbt-init] Folder ready: ${folder}"
            [ -z "${FIRST_FOLDER}" ] && FIRST_FOLDER="${folder}"
            ;;
        *)
            echo "[qbt-init] WARNING: Skipping '${folder}' — only /media/* and /share/* allowed."
            ;;
    esac
    i=$((i + 1))
done

if [ -z "${FIRST_FOLDER}" ]; then
    FIRST_FOLDER="/media/multimedia/downloads"
    mkdir -p "${FIRST_FOLDER}"
    echo "[qbt-init] Fallback save path: ${FIRST_FOLDER}"
fi

echo "FIRST_FOLDER=${FIRST_FOLDER}" >> /var/run/qbt-env
echo "[qbt-init] Default save path: ${FIRST_FOLDER}"

# ─── Bootstrap qBittorrent.conf ───────────────────────────────────────────────
QB_CONF="${CONFIG_DIR}/config/qBittorrent/qBittorrent.conf"
if [ ! -f "${QB_CONF}" ]; then
    echo "[qbt-init] First run — writing qBittorrent.conf"
    mkdir -p "$(dirname "${QB_CONF}")"
    cat > "${QB_CONF}" << EOF
[AutoRun]
enabled=false

[BitTorrent]
Session\DefaultSavePath=${FIRST_FOLDER}
Session\TempPath=${FIRST_FOLDER}/temp
Session\TempPathEnabled=false
Session\Port=${TORRENTING_PORT}
Session\Interface=
Session\InterfaceName=

[Core]
AutoDeleteAddedTorrentFile=Never

[LegalNotice]
Accepted=true

[Meta]
MigrationVersion=6

[Preferences]
Connection\PortRangeMin=${TORRENTING_PORT}
Downloads\SavePath=${FIRST_FOLDER}
Downloads\TempPath=${FIRST_FOLDER}/temp
Downloads\TempPathEnabled=false
General\Locale=en
General\UseRandomPort=false
WebUI\Address=*
WebUI\AlternativeUIEnabled=false
WebUI\BanDuration=3600
WebUI\CSRFProtection=true
WebUI\ClickjackingProtection=true
WebUI\HTTPS\Enabled=false
WebUI\HostHeaderValidation=true
WebUI\LocalHostAuth=true
WebUI\MaxAuthenticationFailCount=5
WebUI\Port=${WEBUI_PORT}
WebUI\RootFolder=
WebUI\SecureCookie=true
WebUI\ServerDomains=*
WebUI\SessionTimeout=3600
WebUI\Username=admin
EOF
    echo "[qbt-init] Config written. Login: admin / adminadmin  <- CHANGE IT!"
else
    sed -i "s|^Downloads\\\\SavePath=.*|Downloads\\\\SavePath=${FIRST_FOLDER}|" "${QB_CONF}" || true
    sed -i "s|^Session\\\\DefaultSavePath=.*|Session\\\\DefaultSavePath=${FIRST_FOLDER}|" "${QB_CONF}" || true
    echo "[qbt-init] Existing config updated."
fi

# ─── Symlink /config → persistent dir ─────────────────────────────────────────
if [ -L "/config" ]; then
    : # already symlinked
elif [ -d "/config" ]; then
    cp -a /config/. "${CONFIG_DIR}/config/" 2>/dev/null || true
    rm -rf /config
    ln -sf "${CONFIG_DIR}/config" /config
else
    ln -sf "${CONFIG_DIR}/config" /config
fi

# ─── Apply memory limit ───────────────────────────────────────────────────────
if [ "${MEMORY_MB}" -gt 0 ] 2>/dev/null; then
    MEM_KB=$(( MEMORY_MB * 1024 ))
    ulimit -v "${MEM_KB}" 2>/dev/null || true
fi

echo "[qbt-init] Init complete."
