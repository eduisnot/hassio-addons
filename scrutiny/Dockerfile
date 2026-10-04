ARG BUILD_FROM=ghcr.io/analogj/scrutiny:nightly-omnibus
FROM ${BUILD_FROM}

RUN mkdir -p /config/scrutiny /config/influxdb \
    && rm -rf /opt/scrutiny/config /opt/scrutiny/influxdb \
    && ln -s /config/scrutiny /opt/scrutiny/config \
    && ln -s /config/influxdb /opt/scrutiny/influxdb
