FROM alpine:3.8
MAINTAINER Eason Summer <kszym2002@gmail.com>

RUN apk add --no-cache go 
       
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN  mkdir v2ray &&  cd v2ray  && \
     wget https://github.com/ColetteContreras/v2ray-ssrpanel-plugin/releases/download/v0.1-alpha/v2ray-ssrpanel-plugin-linux-64.zip && \
     unzip v2ray-ssrpanel-plugin-linux-64.zip    && \
     unzip v2ray-linux-64.zip

	 
CMD  cd v2ray   && \
      ./v2ray -plugin
