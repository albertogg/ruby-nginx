# -*- mode: sh -*-
# vi: set ft=sh :

FROM ubuntu:12.04
MAINTAINER Alberto Grespan

# Install add-apt-repository
RUN apt-get install -y python-software-properties

# Add universe repo and nginx ppa.
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN add-apt-repository ppa:nginx/stable

RUN apt-get update -y
RUN apt-get update -y --fix-missing

# Install latest nginx
RUN apt-get -y install nginx

# tell Nginx to stay foregrounded
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx"]
