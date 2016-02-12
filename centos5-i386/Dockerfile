FROM scratch
MAINTAINER Ignacio Torres Masdeu. <i@itorres.net>

ADD centos5.tar.gz /
RUN mkdir -p /etc/yum/vars && \
    echo "i686" > /etc/yum/vars/arch && \
    echo "i386" > /etc/yum/vars/basearch

ENTRYPOINT ["linux32"]
