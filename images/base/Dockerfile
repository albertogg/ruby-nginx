# -*- mode: sh -*-
# vi: set ft=sh :

##
# Ruby and SSH container
#
# Docker version 0.10.0
#
FROM ubuntu:12.04
MAINTAINER Alberto Grespan "http://twitter.com/albertogg"

RUN echo "debconf debconf/frontend select Teletype" | debconf-set-selections &&\
    apt-get -y update --fix-missing &&\
    apt-get -y install python-software-properties &&\
    apt-add-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" &&\
    add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main universe" &&\
    add-apt-repository -y ppa:nginx/stable &&\
    apt-get -y update --fix-missing

RUN apt-get -y install build-essential python-dev git-core curl wget \
                       libxslt-dev zlib1g-dev libcurl4-openssl-dev \
                       libssl-dev libyaml-dev libtool \
                       libxml2-dev gawk \
                       pngcrush imagemagick libreadline-dev \
                       nginx language-pack-en sudo cron vim \
                       psmisc rsyslog &&\
    dpkg-divert --local --rename --add /sbin/initctl &&\
    sh -c "test -f /sbin/initctl || ln -s /bin/true /sbin/initctl" &&\
    apt-get -y install haproxy openssh-server

RUN apt-get -y install runit monit &&\
    apt-get clean &&\
    dpkg-reconfigure locales &&\
    locale-gen en_US.UTF-8 &&\
    /usr/sbin/update-locale LANG=en_US.UTF-8

RUN mkdir /src && cd /src && git clone https://github.com/sstephenson/ruby-build.git &&\
    cd /src/ruby-build && ./install.sh &&\
    cd / && rm -rf /src/ruby-build && ruby-build 2.0.0-p451 /usr/local

RUN echo 'gem: --no-document' >> /usr/local/etc/gemrc &&\
    gem update --system &&\
    gem install bundler

ENV LC_ALL en_US.UTF-8
