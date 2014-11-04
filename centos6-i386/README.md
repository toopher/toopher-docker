# CentOS 6 i386 Build
Docker hub doesn't publish 32-bit CentOS builds, so this sets up a Docker Automated Build to create our own.

## Docker
To build the image, merely invoke docker as follows:
```
docker build .
```

## Refreshing the tarball
To build the tarball that is referenced in `Dockerfile` we use Vagrant to build up a CentOS VM that can run through docker's [`mkimage-yum`](https://github.com/docker/docker/blob/master/contrib/mkimage-yum.sh) steps.  Here's how that's done:

```
vagrant up
vagrant ssh
cd /vagrant
chmod u+x make-docker-image.sh
sudo ./make-docker-image.sh
exit
vagrant -f destroy
```

This will dump the tarball back in this directory where it can then be used to build the docker image as described above.