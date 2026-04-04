ARG BUILD_FROM=lscr.io/linuxserver/qbittorrent:latest
FROM ${BUILD_FROM}

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
