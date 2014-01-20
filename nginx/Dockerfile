# -*- mode: sh -*-
# vi: set ft=sh :

##
# Nginx container with daemon in foreground
#
# Docker version 0.7.2
#
FROM ubuntu:12.04
MAINTAINER Alberto Grespan "alberto@codehero.co"

# Update known packages.
RUN apt-get update -y

# Set the right encoding.
RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Install add-apt-repository
RUN apt-get install -y python-software-properties vim

# Add universe repo and nginx ppa.
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN add-apt-repository ppa:nginx/stable

# Update known version packeges.
RUN apt-get update -y
RUN apt-get update -y --fix-missing

# Install latest nginx
RUN apt-get -y install nginx

# Copy the new nginx.conf an rename the old one.
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.old
ADD nginx.conf /etc/nginx/nginx.conf

# Copy the codehero server block and symlink it.
ADD codehero.co /etc/nginx/sites-available/codehero.co
RUN ln -s /etc/nginx/sites-available/codehero.co /etc/nginx/sites-enabled/codehero.co

# Unlink the default server block.
RUN unlink /etc/nginx/sites-enabled/default

# Expose port 80 in the container.
EXPOSE 80

# Start the nginx daemon every time the container starts with the -d flag and
# no argument is given.
CMD ["nginx"]
