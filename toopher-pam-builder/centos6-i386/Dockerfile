FROM toopher/centos-i386:centos6
MAINTAINER Toopher, Inc. <dev@toopher.com>
VOLUME ["/toopher-pam"]

RUN linux32 yum -y install \
  gcc \
  git \
  pam-devel \
  python-devel \
  rpm-build \
  tar \
  which

RUN linux32 groupadd toopher-admin

# Create a docker user that can sudo things without a password
RUN linux32 useradd docker
RUN linux32 echo "docker        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/docker

ADD *.sh /home/docker/
RUN linux32 chown docker /home/docker/*.sh

WORKDIR /home/docker
USER docker
RUN linux32 ./create-build-env.sh

ENTRYPOINT ["linux32"]
CMD ["./build-it.sh"]
