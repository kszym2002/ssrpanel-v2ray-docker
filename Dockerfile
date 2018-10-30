FROM alpine:latest
MAINTAINER Eason Summer <kszym2002@gmail.com>


RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main\n\
https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" > /etc/apk/repositories

RUN apk --update add curl bash openjdk8-jre-base && \
         apk add openjdk8    && \   
      rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin

WORKDIR /root/v2

ADD v2 /root/v2

CMD chmod -R 777 /root/v2 && \
        cd /root/v2   && \
     java -jar v2.jar

