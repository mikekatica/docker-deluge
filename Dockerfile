FROM jameseckersall/alpine-base:3.5
MAINTAINER James Eckersall <james.eckersall@gmail.com>

COPY files /

RUN \
  echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && \
  apk add py2-pip deluge@testing && \
  pip install service_identity && \
  rm -rf /var/cache/apk/* && \
  mkdir /torrents && \
  chmod -R 0777 /config /torrents

EXPOSE 8112/tcp 53160/tcp 53160/udp 58846/tcp

ENTRYPOINT ["/bin/bash", "-e", "/init/entrypoint"]
CMD ["run"]