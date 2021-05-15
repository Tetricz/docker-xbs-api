# Maintainer https://github.com/Tetricz
# https://hub.docker.com/_/alpine
ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION} as builder
# https://github.com/xbrowsersync/api/releases
ARG XBS_VERSION=v1.1.13

RUN apk add --no-cache nodejs npm gettext python3 make && \
 wget -q -O api.tar.gz https://github.com/xbrowsersync/api/archive/refs/tags/${XBS_VERSION}.tar.gz && \
 tar -xzf api.tar.gz && \
 mkdir /api && mv api-*/* /api/
RUN cd /api && npm install --only=production

FROM alpine:${ALPINE_VERSION}

COPY --from=builder /api /api
COPY ./entrypoint.sh ./entrypoint.sh
COPY ./reference/*.json ./ref_settings.json
RUN apk add --no-cache nodejs gettext \
 && chmod +x ./*.sh
ENV XBS_DB_HOST="" \
    XBS_DB_NAME="xbrowsersync" \
    XBS_DB_USER="" \
    XBS_DB_PASS="" \
    MESSAGE="Hosted using Docker."

EXPOSE 8080

ENTRYPOINT [ "/entrypoint.sh" ]