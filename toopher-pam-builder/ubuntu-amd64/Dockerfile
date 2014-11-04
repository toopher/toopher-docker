FROM ubuntu:precise
MAINTAINER Toopher, Inc. <dev@toopher.com>
VOLUME ["/toopher-pam"]

RUN apt-get update
RUN apt-get -y install \
  autotools-dev \
  debhelper \
  gcc \
  git \
  libpam0g-dev \
  python-dev \
  sudo

RUN groupadd toopher-admin

# Create a docker user that can sudo things without a password
RUN adduser --disabled-password --gecos "" docker
RUN echo "docker        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/docker
RUN chmod 0440 /etc/sudoers.d/docker

ADD *.sh /home/docker/
RUN chown docker /home/docker/*.sh

WORKDIR /home/docker
USER docker
RUN ./create-build-env.sh

CMD ["./build-it.sh"]
