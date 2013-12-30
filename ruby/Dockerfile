# -*- mode: sh -*-
# vi: set ft=sh :

##
# Ruby and SSH container
#
# Docker version 0.7.2
#
FROM ubuntu:12.04
MAINTAINER Alberto Grespan "alberto@codehero.co"

# Update known packages.
RUN apt-get update -y

# Install openssh-server for sshd service.
RUN apt-get install -y -q openssh-server
RUN mkdir /var/run/sshd

# Install some ruby build dependencies and git for rbenv and ruby-install.
RUN apt-get install -y -q build-essential git-core zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# Install ruby-build.
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# Set RBENV_ROOT variable.
ENV RBENV_ROOT /usr/local/rbenv

# Export path with the rbenv directory.
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install ruby version 2.0.0-p353 and set it as global.
RUN rbenv install 2.0.0-p353
RUN rbenv global 2.0.0-p353

# Install rbenv-gem-rehash to never rehash again.
RUN git clone https://github.com/sstephenson/rbenv-gem-rehash.git /usr/local/rbenv/plugins/rbenv-gem-rehash

# Remove $PATH duplicates.
ENV typeset -u PATH

# Set passsword environment variable.
ENV password pass

# Use the password environment variable to set a password to root
RUN echo "root:$password" | chpasswd

# Share a volume/folder with other containers.
VOLUME ["/var/www"]

# Command to start the sshd daemon every time the container starts with -d flag
# and without arguments.
CMD ["/usr/sbin/sshd", "-D"]
