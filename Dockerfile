FROM alpine:edge as builder
MAINTAINER twxl1993 <twxl1993@gmail.com>

WORKDIR /tmp
RUN buildDeps=" \
               build-base \
               cmake \
               git \
               linux-headers \
               openssl-dev \
               libpcap-dev \
               "; \
               \
               set -x \
                && apk add --update --no-cache --virtual .build-deps $buildDeps \
                && git clone https://github.com/ntop/n2n.git \
                && cd n2n \
                && git checkout 7d5aa1f \
                && cmake . \
                && make supernode edge tools \
                && make install && rm -rf /tmp/* \
                && apk del .build-deps

FROM alpine:edge
COPY --from=builder /usr/local/sbin/supernode /usr/sbin
COPY --from=builder /usr/local/sbin/edge      /usr/sbin
COPY --from=builder /usr/local/bin/n2n-benchmark /usr/sbin
COPY --from=builder /usr/local/bin/n2n-decode    /usr/sbin

EXPOSE 7654/udp

ENTRYPOINT ["supernode"]
CMD ["-l", "7654"]
