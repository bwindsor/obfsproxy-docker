FROM alpine:3.8
MAINTAINER Ben

RUN set -xe \
    && apk add --no-cache build-base curl python python-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install obfsproxy \
    && apk del build-base curl python-dev

ENV LOG_MIN_SEVERITY info
ENV LISTEN_ADDR 0.0.0.0
ENV LISTEN_PORT 4911

CMD obfsproxy --log-min-severity=$LOG_MIN_SEVERITY \
              obfs3 \
              socks \
              $LISTEN_ADDR:$LISTEN_PORT