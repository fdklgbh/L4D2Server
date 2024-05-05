# L4D2Server
## 求生之路2 Linux服务器 docker版

1. 必须保证已经安装docker 以及docker-compose
2. 都准备完毕后,执行docker-compose -d(后台执行,容器名称是l4d2)
3. 之后在windows选择安装你的插件以及vpk(我用的JSGME.exe)
4. 执行命令推送到对应的远程目录(游戏目录在当前文件夹的l4d2server中,执行下面命令的目录在你插件目录,目录下存在left4dead2)
    ```bat
    scp -r left4dead2 你的用户名@IP:xxx/l4d2server(xxx是你克隆仓库或者下载代码下来的绝对路径,pwd查看)
    ```
5. 如果有删除的插件,可以直接删除服务器中的插件文件(后续有机会写脚本通过配置来删除),再推送(建议本地有插件文件夹备份)
