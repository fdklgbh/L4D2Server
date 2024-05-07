#! /bin/bash

docker stop l4d2
echo "停止成功, 开始更新游戏"
docker run --rm -it --name=l4d2tmp -v  "./l4d2server:/home/steam/l4d2server" cm2network/steamcmd ./steamcmd.sh +force_install_dir /home/steam/l4d2server +login anonymous +app_update 222860 +quit

echo "开始启动游戏容器"
docker start l4d2