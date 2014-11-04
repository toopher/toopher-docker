FROM centos:centos7
MAINTAINER Toopher, Inc. <dev@toopher.com>
VOLUME ["/toopher-pam"]

RUN yum -y install \
  gcc \
  git \
  make \
  pam-devel \
  python-devel \
  rpm-build \
  sudo \
  tar \
  which

RUN groupadd toopher-admin

# Create a docker user that can sudo things without a password
RUN useradd docker
RUN echo "docker        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/docker

ADD *.sh /home/docker/
RUN chown docker /home/docker/*.sh

WORKDIR /home/docker
USER docker
RUN ./create-build-env.sh

CMD ["./build-it.sh"]
