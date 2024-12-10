# n2n-dcoker
docker run -itd --name=edge --net=host --privileged  --restart=always -v /tmp/zfsv3/sata11/16638686708/data/docker/edge:/etc/n3n/ registry.cn-hangzhou.aliyuncs.com/dubux/n2n:edge


默认配置文件/etc/n3n/edge.conf 具体参考 https://github.com/n42n/n3n

一个配置参考
![image](https://github.com/user-attachments/assets/eb69440d-1702-42af-869c-bae18381cbac)

如果需要走tcp中转需要在edge配置文件中加入
[connection]
bind=50001
connect_tcp=true