# L4D2Server
## 求生之路2 Linux服务器 docker版

1. 必须保证已经安装docker
2. 先进入仓库目录执行chmod 764 *.sh(赋予脚本执行权限)
3. 首先执行install.sh(可以修改port=27015,把27015改成你自己想要的端口)
4. 执行结束后,执行run.sh
   1. 记得打开对应端口(默认设置的27015)
5. 更新的话,执行update.sh

插件或者其他什么需要安装后自行复制文件到对应目录

可以执行scp命令传输,或者其他方法(下面的脚本可以直接复制下来,Windows上新建文件.后缀改为bat,路径改为你实际的)
```bat
@REM 首先进入你的插件文件夹(Windows目录下有left4dead2, 没有就改成你自己的实际路径)
scp -r ./left4dead2 你的用户名:IP:xxx/L4D2Server/l4d2server
pause
```


### 关于脚本:
   1. 如果是使用frp来穿透联机,跳过这里的步骤,继续往下看
   2. 安装游戏: install.sh 会创建临时容器安装游戏到l4d2server文件夹中
   3. 首次启动游戏:run.sh 会后台启动服务
   4. 更新游戏 update.sh 
      
      用于更新游戏,注意备份文件(没有试过更新会不会把你的文件覆盖掉)
      1. 首先停掉容器l4d2
      2. 再创建临时容器更新游戏
      3. 最后重新启动容器l4d2
****

### 通过免费的frp来穿透联机
   1. 安装游戏:install.sh 正常执行
   2. 首次启动游戏:
      1. 如果你自己也有容器再使用,且没有自己创建网络,那么就执行frp_create_network.sh(推荐)

         如果创建过网络,也可以直接使用你自己的(脚本自己改)
      2. 创建了网络:
         1. 去掉frp_run.sh中的`--net`和`--ip`前的#号
         1. 执行frp_run.sh 传递frp外部端口,以及你这个容器的IP(自己定义,和你再执行frp_create_network.sh配置的IP,比如IP是192.168.0.0 那么你可以设置一个192.168.0.100)
      3. 如果没有创建网络
         那么就执行`docker network inspect bridge`查看Containers有多少个IPv4Address,如果有,那么就找最大的一个+1
         大致是这样的
         ```json
         "Containers": {
            "20a7d5cf8d236a8b4561e26f0570188e48d87cf4a80f8a393de6eefd2b78139e": {
                "Name": "l4d2",
                "EndpointID": "0235cef7bcfae8104c93e06871f0d08c50e0249feccdfd22493764872995deb9",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
         ```

         比如:查看的有172.17.0.2 172.17.0.3 那么最大就是172.17.0.3,+1的话就是172.17.0.4,若frp配置的外部端口是61234

         再执行`./frp_run.sh 61234 172.20.0.4`(但这种如果里面有多个容器,重启之后,容器IP就可能会变)
   3. 更新游戏 update.sh 同上

**注意**

刚启动游戏服务,进入后有些卡,退出多进去几次(我这里也有这种情况)

如果执行过程中提示没权限,加sudo

也可能启动后,日志没有输出以下信息,可以直接尝试连接,不知道为什么可以

```bat
Connection to Steam servers successful.
   VAC secure mode disabled.
```

### 一点docker的命令(可能会用到的)

下面命令中的l4d2是容器名称
- 启动容器 docker start l4d2
- 重启容器 docker restart l4d2
- 停止容器 docker restart l4d2
- 查看容器日志 docker logs l4d2
- 查看容器实时日志 docker logs -f l4d2
- 删除容器 docker rm -f l4d2

