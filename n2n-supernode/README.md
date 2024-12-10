# n2n-dcoker
docker run -itd --name=n2n --restart=always -p 7654:7654/tcp -p 7654:7654/udp -v /usr/n3n/:/etc/n3n/ registry.cn-hangzhou.aliyuncs.com/dubux/n2n:v3



默认配置文件 /etc/n3n/supernode.conf 具体参考 https://github.com/n42n/n3n 其他安装包：https://github.com/n42n/n3n/releases

如果需要走tcp中转需要在edge配置文件中加入
[connection]
bind=50001
connect_tcp=true