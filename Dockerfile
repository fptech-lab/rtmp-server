FROM ubuntu:20.04

LABEL org.opencontainers.image.authors="fabio.pignoletto@gmail.com"

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates && \
    mkdir /src && \
    wget --quiet -O /src/ant-media-server-community.zip \
      https://github.com/ant-media/Ant-Media-Server/releases/download/ams-v2.5.1/ant-media-server-community-2.5.1.zip && \
    wget --quiet -O /src/install_ant-media-server.sh \
      https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh && \
    chmod +x /src/install_ant-media-server.sh && \
    apt-get remove --purge -y wget && apt-get autoremove -y

RUN /src/install_ant-media-server.sh \
      -i /src/ant-media-server-community.zip \
      -s false && \
    apt-get clean && rm -rf /src

WORKDIR /usr/local/antmedia

CMD /usr/local/antmedia/start.sh

EXPOSE 1935
EXPOSE 5080

