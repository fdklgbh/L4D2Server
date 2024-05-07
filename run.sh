#! /bin/bash

port=27015

docker run -d \
    --name l4d2 \
    -p ${port}:27015/tcp \
    -p ${port}:27015/udp \
    -v $(pwd)/l4d2server:/home/steam/l4d2server \
    cm2network/steamcmd:latest \
    /home/steam/l4d2server/srcds_run -game left4dead2 -insecure +map c1m2_streets -condebug +exec server.cfg -nomaster

echo "docker命令执行成功, 开始输出日志, Ctrl + c退出"

docker logs -f l4d2