FROM ubuntu:latest 
MAINTAINER Eason Summer <kszym2002@gmail.com>
RUN apt-get update
RUN apt-get install unzip wget tzdata curl -y
RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

RUN curl -L -s https://raw.githubusercontent.com/ColetteContreras/v2ray-ssrpanel-plugin/master/install-release.sh | bash

ENV PATH /usr/bin/v2ray:$PATH

CMD ["v2ray", "-plugin"]
