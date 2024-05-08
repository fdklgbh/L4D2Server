#! /bin/bash

# 需要修改网段(最后一个.0不去动他,前面三个(192.168.0)不要和已有的重复)
ip=192.168.0.0
docker network create --subnet=${ip}/24 l4d2_network
