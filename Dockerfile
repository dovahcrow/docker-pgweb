FROM ubuntu:14.04
MAINTAINER Wu Young <doomsplayer@gmail.com>

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

ENV PGWEB_VERSION 0.7.0

RUN \
  cd /tmp && \
  wget https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_amd64.zip && \
  unzip pgweb_linux_amd64.zip -d /app && \
  rm -f pgweb_linux_amd64.zip

RUN useradd -ms /bin/bash pgweb

USER pgweb
WORKDIR /app

EXPOSE 8080
CMD ["sh", "-c", "/app/pgweb_linux_amd64", "-s", "--bind=0.0.0.0", "--listen=8080", "--url=$PGURL"]
