FROM ubuntu:14.04
MAINTAINER Eric Schultz <eric@startuperic.com>
#Thanks to Tim Haak <tim@haak.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US en_US.UTF-8
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe multiverse" >> /etc/apt/sources.list

RUN apt-get -q update
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get dist-upgrade -qy --force-yes
RUN apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush par2 python-yenc unrar unzip

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8080 9090

ENTRYPOINT ["/start.sh"]
