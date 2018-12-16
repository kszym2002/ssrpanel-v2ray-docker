FROM alpine:latest
MAINTAINER Eason Summer <kszym2002@gmail.com>

ENV SSRPANELV2RAY=0.0.3


RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main\n\
https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" > /etc/apk/repositories

RUN apk --update add curl bash openjdk8 unzip openjdk8-jre-base && \
    wget https://github.com/aiyahacke/ssrpanel-v2ray/releases/download/${SSRPANELV2RAY}/ssrpanel-v2ray-${SSRPANELV2RAY}.zip && \
    unzip ssrpanel-v2ray-${SSRPANELV2RAY}.zip -d /root/ssrpanel-v2ray && \
    rm -rf /var/cache/apk/*  && \
    rm -rf /root/ssrpanel-v2ray-$SSRPANEL-V2RAY.zip 

RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin

CMD   chmod -R a+x /root/ssrpanel-v2ray && \
      cd /root/ssrpanel-v2ray && \
     java -jar ssrpanel-v2ray-${SSRPANELV2RAY}-jar-with-dependencies.jar
