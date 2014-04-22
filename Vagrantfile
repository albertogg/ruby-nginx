# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.4.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://nitron-vagrant.s3-website-us-east-1.amazonaws.com/vagrant_ubuntu_12.04.3_amd64_virtualbox.box"

  config.vbguest.auto_update = true

  config.vm.network :public_network, :bridge => 'en0: Wi-Fi (AirPort)'
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.name = "ruby_stack_vm"
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision "shell", path: "shell-provision.sh"

  config.vm.provision "docker" do |d|
    d.pull_images "ubuntu:12.04"
  end
end
