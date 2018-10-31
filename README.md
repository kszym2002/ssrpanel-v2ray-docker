# ssrpanel-v2ray-docker
只能用于ssrpanel的v2ray节点部署

部署命令
````
docker run -d -v /root/config.json:/root/v2ray-linux-64/config.json -v /root/config.properties:/root/ssrpanel-v2ray/config.properties --name=v2ray --network=host --log-opt max-size=10m --log-opt max-file=3 --restart=always easonsummer/ssrpanel-v2ray-docker:0.0.2
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
#请把两个配置文件存放在/root目录下,如果你存放在其他目录请修改-v 之后的冒号之前的文件地址.
#不再需要注意修改config.properties前2项内容,保持默认.
