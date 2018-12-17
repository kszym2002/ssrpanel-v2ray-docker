FROM alpine:3.8
MAINTAINER Eason Summer <kszym2002@gmail.com>

RUN apk add --no-cache go 
       
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN  wget https://github.com/ColetteContreras/v2ray-ssrpanel-plugin/releases/download/v0.1-alpha/v2ray-ssrpanel-plugin-linux-64.zip && \
     mkdir /root/v2ray    && \
     unzip v2ray-ssrpanel-plugin-linux-64.zip  -d /root/v2ray  && \
     unzip /root/v2ray/v2ray-linux-64.zip -d /root/v2ray && \
     rm -rf /root/v2ray/v2ray-ssrpanel-plugin-linux-64.zip && \
     rm -rf /root/v2ray/v2ray-linux-64.zip
     
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai

CMD /root/v2ray/v2ray -plugin
