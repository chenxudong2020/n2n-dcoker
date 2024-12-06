FROM alpine:edge as builder
MAINTAINER twxl1993 <twxl1993@gmail.com>

WORKDIR /tmp
RUN buildDeps=" \
               wget \
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
                && git clone -b 3.0-stable https://github.com/ntop/n2n.git \
                && cd n2n \
                && cmake . \
                && make supernode edge tools \
                && make install && rm -rf /tmp/* \
                && apk del .build-deps

RUN cd /tmp && wget https://gitee.com/gnbdev/gnb_udp_over_tcp/releases/download/v1.0.0.0/gnb_udp_over_tcp.1.0.0.tar.gz \
                && tar -zxvf gnb_udp_over_tcp.1.0.0.tar.gz \
                && mv /tmp/gnb_udp_over_tcp/bin/Linux_x86_64/gnb_udp_over_tcp /usr/local/bin && rm -rf /tmp/*

FROM ubuntu:18.04
ENV NAME=""
ENV SERVER=""
ENV PASSWORD=""
ENV IP=""
COPY --from=builder /usr/local/sbin/supernode /usr/sbin
COPY --from=builder /usr/local/sbin/edge      /usr/sbin
COPY --from=builder /usr/local/bin/n2n-benchmark /usr/sbin
COPY --from=builder /usr/local/bin/gnb_udp_over_tcp /usr/sbin
COPY start.sh /usr/sbin

RUN apt update -y && apt-get install musl-tools musl-dev -y

EXPOSE 7654/udp 
EXPOSE 7655/tcp
ENTRYPOINT ["start.sh"]
