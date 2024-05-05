#! /bin/bash

echo "开始下载l4d2"
/home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/l4d2server +login anonymous +app_update 222860 validate +quit

echo "下载且校验完成"