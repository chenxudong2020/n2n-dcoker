# n2n-docker-edge
docker run -itd --name=edge --net=host --privileged  --restart=always -v /tmp/zfsv3/sata11/16638686708/data/docker/edge:/etc/n3n/ registry.cn-hangzhou.aliyuncs.com/dubux/n2n:edge


Default configuration file /etc/n3n/edge.conf, please refer to https://github.com/n42n/n3n
A configuration reference
![image](https://github.com/user-attachments/assets/eb69440d-1702-42af-869c-bae18381cbac)

If you need to use tcp transfer, you need to add it to the edge configuration file.
[connection]
bind=50001
connect_tcp=true
