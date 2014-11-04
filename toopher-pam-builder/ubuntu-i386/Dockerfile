FROM toopher/ubuntu-i386:12.04
MAINTAINER Toopher, Inc. <dev@toopher.com>
VOLUME ["/toopher-pam"]

RUN linux32 apt-get update
RUN linux32 apt-get -y install \
  autotools-dev \
  gcc \
  git \
  libpam0g-dev \
  python-dev \
  debhelper

RUN linux32 groupadd toopher-admin

# Create a docker user that can sudo things without a password
RUN linux32 adduser --disabled-password --gecos "" docker
RUN linux32 echo "docker        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/docker
RUN linux32 chmod 0440 /etc/sudoers.d/docker

ADD *.sh /home/docker/
RUN linux32 chown docker /home/docker/*.sh

WORKDIR /home/docker
USER docker
RUN linux32 ./create-build-env.sh

ENTRYPOINT ["linux32"]
CMD ["./build-it.sh"]
