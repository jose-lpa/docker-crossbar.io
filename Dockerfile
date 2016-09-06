FROM centos:7

MAINTAINER José Luis Patiño Andrés <jose.lpa@gmail.com>

ENV PYTHONUNBUFFERED 1

EXPOSE 8001

# Install GPG key and repository.
RUN rpm --import "http://pool.sks-keyservers.net/pks/lookup?op=get&search=0x5FC6281FD58C6920"
COPY ./centos.repo /etc/yum.repos.d/crossbar.repo

# Install Crossbar.io package.
RUN yum install -y crossbar

# Custom node configuration.
RUN mkdir -p /node/{web,.crossbar}/
COPY ./crossbar/config.json /node/.crossbar
COPY ./www/index.html /node/web

RUN ln -s /opt/crossbar/bin/crossbar /usr/bin/crossbar

# Create a system user.
RUN useradd -d /node -r crossbar
RUN chown -R crossbar:crossbar /node

USER crossbar

WORKDIR /node
ENTRYPOINT ["crossbar", "start", "--cbdir", "/node/.crossbar"]
