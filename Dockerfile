FROM alpine:3.13

LABEL maintainer="github.com/Tetricz"

ENV RELEASE="https://github.com/xbrowsersync/api/archive/refs/tags/v1.1.13.tar.gz" \
    VERSION="1.1.13" \
    XBS_DB_HOST="" \
    XBS_DB_USER="" \
    XBS_DB_PASS="" \
    MESSAGE="Hosted using Docker."

COPY ./entrypoint.sh ./entrypoint.sh
COPY ./reference/*.json ./ref_settings.json

RUN apk add --no-cache nodejs npm gettext && \
 wget -q -O api.tar.gz ${RELEASE} && \
 tar -xzf api.tar.gz && \
 rm -f api.tar.gz && \
 mkdir /api && mv api-${VERSION}/* /api/ && rm -fr api-${VERSION} && \
 chmod +x ./*.sh
RUN cd /api && npm install --only=production

EXPOSE 8080

ENTRYPOINT [ "/entrypoint.sh" ]