FROM alpine:latest
MAINTAINER Eason Summer <kszym2002@gmail.com>

ENV V2RAY=3.50
ENV SSRPANELV2RAY=0.0.2


RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main\n\
https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" > /etc/apk/repositories

RUN apk --update add curl bash openjdk8 unzip openjdk8-jre-base && \
    wget https://github.com/aiyahacke/ssrpanel-v2ray/releases/download/${SSRPANELV2RAY}/ssrpanel-v2ray-${SSRPANELV2RAY}.zip && \
    wget https://github.com/v2ray/v2ray-core/releases/download/v${V2RAY}/v2ray-linux-64.zip  && \
    unzip ssrpanel-v2ray-${SSRPANELV2RAY}.zip -d /root/ssrpanel-v2ray && \
    unzip v2ray-linux-64.zip -d /root/v2ray-linux-64 && \
    rm -rf /var/cache/apk/*  && \
    rm -rf /root/ssrpanel-v2ray-$SSRPANEL-V2RAY.zip && \
    rm -rf /root/v2ray-linux-64.zip

RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin

CMD   chmod -R a+x /root/ssrpanel-v2ray && \
       chmod -R a+x /root/v2ray-linux-64   && \
      cd /root/ssrpanel-v2ray && \
     java -jar ssrpanel-v2ray-${SSRPANELV2RAY}.jar
