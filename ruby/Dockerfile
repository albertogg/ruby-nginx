# -*- mode: sh -*-
# vi: set ft=sh :

FROM ubuntu:12.04
MAINTAINER Alberto Grespan

# Update known packages.
RUN apt-get update -y

# Install openssh-server for sshd service.
RUN apt-get install -y -q openssh-server
RUN mkdir /var/run/sshd

# Set passsword environment variable.
ENV password pass

# Use the password environment variable to set a password to root
RUN echo "root:$password" | chpasswd

# Share a volume/folder with other containers.
VOLUME ["/var/www"]

CMD ["/usr/sbin/sshd", "-D"]
