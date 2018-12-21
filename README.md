v2ray ssrpanel go版

更新记录
- 2018/12/21
     - ssrpanel-v2ray go版本 启用新的分支 easonsummer/ssrpanel-v2ray-docker:go
   
准备

细心、仔细、认真

安装docker 可以使用 curl -fsSL get.docker.com | sh 安装最新docker

config.json与config.properties 配置正确

这篇教程假设config.json在/root 里


部署命令
````
docker run -d -v /root/config.json:usr/bin/v2ray/config.json --name=v2ray --network=host --log-opt max-size=10m --log-opt max-file=3 --restart=always easonsummer/ssrpanel-v2ray-docker:go
````

验证命令
````
docker logs v2ray
````

停止命令
````
docker stop v2ray
````

重启命令
````
docker restart v2ray
````

卸载命令
````
docker stop v2ray
docker rm v2ray
````
# 请把两个配置文件存放在/root目录下,如果你存放在其他目录请修改-v 之后的冒号之前的文件地址.

