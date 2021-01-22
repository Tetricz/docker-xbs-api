FROM alpine:3.13

LABEL maintainer="github.com/Tetricz"

ENV RELEASE="https://github.com/Tetricz/api/archive/v1.1.12-tet.tar.gz" \
    VERSION="1.1.12-tet" \
    XBS_DB_HOST="" \
    XBS_DB_USER="" \
    XBS_DB_PASS="" \
    MESSAGE="Hosted using Docker."

COPY ./entrypoint.sh ./entrypoint.sh
COPY ./reference/*.json ./ref_settings.json

RUN apk add --no-cache nodejs npm gettext && \
 wget -q -O xbs-api.tar.gz ${RELEASE} && \
 tar -xzf xbs-api.tar.gz && \
 rm -f xbs-api.tar.gz && \
 mv api-${VERSION}/* / && \
 rm -fr api-${VERSION} && \
 chmod +x ./*.sh
RUN npm install --only=production

EXPOSE 8080

ENTRYPOINT [ "./entrypoint.sh" ]