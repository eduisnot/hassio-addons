#!/usr/bin/env bash
set -euo pipefail

ZIM_DIR="/share/kiwix"
PORT="8080"

THREADS="$(jq --raw-output '.threads // 4' /data/options.json)"
VERBOSE="$(jq --raw-output '.verbose // false' /data/options.json)"
BLOCK_EXTERNAL="$(jq --raw-output '.block_external // true' /data/options.json)"

echo "[INFO] Iniciando Kiwix"
echo "[INFO] Directorio de archivos ZIM: ${ZIM_DIR}"
echo "[INFO] Puerto HTTP: ${PORT}"
echo "[INFO] Hilos de trabajo: ${THREADS}"

if [ ! -d "${ZIM_DIR}" ]; then
    echo "[ERROR] No existe el directorio ${ZIM_DIR}"
    echo "[ERROR] Crea /share/kiwix desde el complemento Samba/terminal y añade al menos un archivo .zim."
    exit 1
fi

ZIM_COUNT="$(find "${ZIM_DIR}" -type f -iname '*.zim' | wc -l)"

if [ "${ZIM_COUNT}" -eq 0 ]; then
    echo "[ERROR] No se encontró ningún archivo .zim en ${ZIM_DIR}"
    echo "[ERROR] Copia tus archivos ZIM a /share/kiwix y reinicia el add-on."
    exit 1
fi

echo "[INFO] Se han encontrado ${ZIM_COUNT} archivo(s) ZIM:"
find "${ZIM_DIR}" -type f -iname '*.zim' -printf '[INFO] - %p\n'

KIWIX_ARGS=(
    "--port=${PORT}"
    "--address=all"
    "--threads=${THREADS}"
    "--nodatealiases"
)

if [ "${BLOCK_EXTERNAL}" = "true" ]; then
    KIWIX_ARGS+=("--blockexternal")
fi

if [ "${VERBOSE}" = "true" ]; then
    KIWIX_ARGS+=("--verbose")
fi

echo "[INFO] Kiwix estará disponible en el puerto ${PORT}"
exec kiwix-serve "${KIWIX_ARGS[@]}" "${ZIM_DIR}"
