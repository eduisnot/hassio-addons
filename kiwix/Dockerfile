FROM ghcr.io/kiwix/kiwix-serve:latest

# Copiamos nuestro script de arranque dentro del contenedor
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/bin/sh", "/run.sh"]
