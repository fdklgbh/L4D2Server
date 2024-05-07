# L4D2Server
## 求生之路2 Linux服务器 docker版

插件或者其他什么需要安装后自行复制文件到对应目录

可以执行文件命令,或者其他方法
```bat
首先进入你的插件文件夹(Windows目录下有left4dead2, 没有就改成你自己的实际路径)
scp -r ./left4dead2 你的用户名:IP:xxx/L4D2Server/l4d2server
```


1. 必须保证已经安装docker
2. 首先执行install.sh(可以修改port=27015,把27015改成你自己想要的端口)
3. 执行结束后,执行run.sh
   1. 记得打开对应端口(默认设置的27015)
4. 更新的话,执行update.sh

### 关于脚本:
   1. install.sh 会创建临时容器安装游戏到l4d2server文件夹中
   2. run.sh 会后台启动服务
      1. 执行后需要停止,执行`docker stop l4d2`
      2. 停止后需要启动,执行`docker start l4d2`
      3. 查看日志,执行`docker logs l4d2 -f` -f是实时查看日志
      4. 要删除这个容器,执行`docker rm -f l4d2`
   3. update.sh 
      
      用于更新游戏,注意备份文件(没有试过更新会不会把你的文件覆盖掉)
      1. 首先停掉容器l4d2
      2. 再创建临时容器更新游戏
      3. 最后重新启动容器l4d2
****
**注意**

刚启动游戏服务,多进去几次,我这里不知道为什么才开始有点卡
<br>如果执行过程中提示没权限,加sudo</br>
也可能启动后,日志没有输出以下信息,可以直接尝试连接,不知道为什么可以
```bat
Connection to Steam servers successful.
   VAC secure mode disabled.
```
