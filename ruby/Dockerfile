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

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Install openssh-server for sshd service.
RUN apt-get install -y -q openssh-server
RUN mkdir /var/run/sshd

# Install some ruby build dependencies and git for rbenv and ruby-install.
RUN apt-get install -y -q build-essential python-dev git-core zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev vim

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

# Copiar copiar las llaves ssh en su lugar.
RUN mkdir -p /root/.ssh/
ADD ssh /root/.ssh
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN echo "gem: --no-rdoc --no-ri" > /root/.gemrc
RUN gem install bundler

# Remove $PATH duplicates.
ENV typeset -u PATH

# Set passsword environment variable.
ENV password pass

# Use the password environment variable to set a password to root
RUN echo "root:$password" | chpasswd

# Share a volume/folder with other containers.
RUN mkdir -p /var/www/logs

# Create cron build log file.
RUN touch /var/www/logs/cron-build.log

# Install cron.
RUN apt-get install -y cron

# Copy startup script to run cron and ssh daemons.
RUN mkdir -p /var/www/cron

# Copy scripts to the desired route.
ADD build-script.sh /var/www/cron/build-script.sh
ADD cron-script.sh /var/www/cron/cron-script.sh
ADD startup-script.sh /var/www/cron/startup-script.sh

# Add build script to crontab.
RUN crontab /var/www/cron/cron-script.sh
VOLUME ["/var/www"]

# Command to start the sshd daemon every time the container starts with -d flag
# and without arguments.
CMD ["/usr/sbin/sshd", "-D"]
