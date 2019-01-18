FROM alpine:3.8

ARG TZ="Asia/Shanghai"

ENV TZ ${TZ}

RUN apk upgrade --update \
&& apk add \
bash  \
tzdata \
curl 

RUN cd /tmp/v2ray \
&& curl -L -s https://raw.githubusercontent.com/ColetteContreras/v2ray-ssrpanel-plugin/master/install-release.sh | bash \
&& apk del curl \
&& ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
&& echo ${TZ} > /etc/timezone \
&& rm -rf /tmp/v2ray

ENV PATH /usr/bin/v2ray:$PATH

CMD ["v2ray"]
