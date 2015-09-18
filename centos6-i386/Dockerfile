FROM scratch
MAINTAINER Toopher, Inc. <dev@toopher.com>

ADD centos6.tar.gz /
RUN echo "i686" > /etc/yum/vars/arch && \
    echo "i386" > /etc/yum/vars/basearch

ENTRYPOINT ["linux32"]
