#!/usr/bin/with-contenv bashio
set -e

export PUID="$(bashio::config 'PUID')"
export PGID="$(bashio::config 'PGID')"
export TZ="$(bashio::config 'TZ')"
export WEBUI_PORT="$(bashio::config 'WEBUI_PORT')"
export TORRENTING_PORT="$(bashio::config 'TORRENTING_PORT')"

exec /init
