#! /bin/bash

docker run --rm -it --name=l4d2tmp -v  "./l4d2server:/home/steam/l4d2server" cm2network/steamcmd ./steamcmd.sh +force_install_dir /home/steam/l4d2server +login anonymous +app_update 222860 validate +quit
