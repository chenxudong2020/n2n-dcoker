FROM ubuntu:18.04

ENV URL="https://github.com/chenxudong2020/n2n-dcoker/raw/refs/heads/master/n3n_3.4.4-86-gb0b6944-1_amd64.deb"

RUN cd /root && apt update -y && apt install wget python3 -y && \
    wget -O n2n.deb ${URL} && \
    dpkg -i n2n.deb
 

EXPOSE 7654/udp 
EXPOSE 7654/tcp

VOLUME [ "/etc/n3n" ]
 
ENTRYPOINT ["n3n-supernode"]
CMD ["start"]
