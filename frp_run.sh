#! /bin/bash

# port frp 外部端口
port=$1
host=$2

docker run -d \
    --name l4d2 \
    # 执行create_network.sh才可以取消下面两行注释,取消注释也不要去动它
    # --net l4d2_network \
    # --ip ${host} \ 
    -p ${port}:${port}/tcp \
    -p ${port}:${port}/udp \
    -v $(pwd)/l4d2server:/home/steam/l4d2server \
    cm2network/steamcmd:latest \
    /home/steam/l4d2server/srcds_run -game left4dead2 -insecure -port ${port} -ip ${host} +hostip ${host} +map c1m1_hotel -condebug +exec server.cfg -nomaster
 