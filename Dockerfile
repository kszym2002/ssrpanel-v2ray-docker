FROM ubuntu:latest 
RUN apt-get update
RUN apt-get install unzip wget -y

RUN wget https://github.com/ColetteContreras/v2ray-ssrpanel-plugin/releases/download/v0.1-alpha/v2ray-ssrpanel-plugin-linux-64.zip && \
    unzip v2ray-ssrpanel-plugin-linux-64.zip -d /usr/bin/v2ray && \
    unzip /usr/bin/v2ray/v2ray-linux-64.zip -d /usr/bin/v2ray

RUN mkdir /var/log/v2ray/ &&\
    chmod +x /usr/bin/v2ray/v2ctl && \
    chmod +x /usr/bin/v2ray/v2ray

ENV PATH /usr/bin/v2ray:$PATH

CMD ["v2ray", "-plugin"]
