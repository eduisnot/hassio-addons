#!/bin/bash

INTERNAL_ASSETS="/www/assets"
HAOS_CONFIG="/config"

# 1. Si la carpeta en /addon_configs está vacía, la inicializamos con la plantilla de Homer
if [ -z "$(ls -A "$HAOS_CONFIG")" ]; then
    echo "Inicializando /addon_configs/homer-dashboard con la plantilla por defecto..."
    cp -r "$INTERNAL_ASSETS"/* "$HAOS_CONFIG"/
fi

# 2. Reemplazamos la carpeta interna de Homer con un enlace directo a la carpeta de HAOS
rm -rf "$INTERNAL_ASSETS"
ln -s "$HAOS_CONFIG" "$INTERNAL_ASSETS"

# 3. Lanzamos el servidor web original saltándonos el script conflictivo
echo "Iniciando servidor web de Homer Dashboard..."
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
