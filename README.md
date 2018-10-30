# ssrpanel-v2ray-docker
只能用于ssrpanel的v2ray节点部署

部署命令

docker run -d -v /你的config.json的位置：/root/v2/config.json -v /你的config.properties的位置：/root/v2/config.properties easonsummer / ssrpanel-v2ray-docker



config.properties 这些值必须为下方所示 其他都可以随意调节

v2ray路径

v2ray.path=/root/v2

可执行文件名

v2ray.exec=v2ray
