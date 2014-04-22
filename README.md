This is a **Ruby + Nginx Docker container with lots of goodies**. This container its mostly a base for later customization.

## Why this container?

This container contains almost everything you need to put Ruby in production. To list a few: *imagemagick, git, cron, ssh, nginx, runit, monit, haproxy,* among others. It's based on the [discourse_docker](https://github.com/discourse/discourse_docker) base container.

It doesn't have any database installed because that's meant to be done in another container that extends this one.

## Dependencies

- Virtualbox 4.3.6+ o VMware ([VB 4.3.10 has a bug](https://github.com/mitchellh/vagrant/issues/3341#issuecomment-39015570))
- Vagrant 1.5.4+ ([1.5.3 has a small bug](https://github.com/mitchellh/vagrant/issues/3487))

## Building the image locally

I'm using Vagrant to build this custom Docker container locally. Before you `vagrat up` please install this the `vagrant-vbguest` plugin, if you already have, skip the next step.

```sh
$ vagrant plugin install vagrant-vbguest
```

At this point you may start your new VM and let vagrant provision it, this may take a few minutes, so hold tight.

```sh
$ vagrant up
```

Once the VM provision is complete you are ready to build this same image or any one you need.

> If you find any error please open an issue.

To create the same image just type the following command:

```sh
$ sudo docker build -t albertogg/ruby-nginx-stack /vagrant/images/base
```

To run the container:

```sh
$ sudo docker run -i -t albertogg/ruby-nginx-stack /bin/bash
```
