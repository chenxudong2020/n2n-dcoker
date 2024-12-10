FROM ubuntu:18.04

ENV URL="https://github.com/n42n/n3n/releases/download/3.4.4/n3n_3.4.4-1_amd64.deb"

RUN cd /root && apt update -y && apt install wget python3 -y && \
    wget -O n2n.deb ${URL} && \
    dpkg -i n2n.deb
 

EXPOSE 7654/udp 
EXPOSE 7654/tcp

VOLUME [ "/etc/n3n" ]
 
ENTRYPOINT ["n3n-supernode"]
CMD ["start"]
