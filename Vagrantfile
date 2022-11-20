# -*- mode: ruby -*-
# vi: set ft=ruby :

# load .env file
Dotenv.load

Vagrant.configure("2") do |config|
  # see https://app.vagrantup.com/ubuntu/boxes/focal64
  config.vm.box = "#{ENV['BOX_NAME']}"
  config.vm.box_version = "#{ENV['BOX_VERSION']}"
  config.vm.box_check_update = false

  # Automaticaly install plugins to local project
  config.vagrant.plugins = [
    "dotenv",
    "vagrant-disksize",
    "vagrant-vbguest"
  ]

  # Use Virtualbox's bridge adopter
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "#{ENV['VM_NAME']}"
    vb.gui = false
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/base/site.yml"
  end

  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "playbook/ctf/site.yml"
  # end

  # FIXME: if use cis benchmark : [Errno 2] No such file or directory: b'/usr/sbin/aide'
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/ssg/ubuntu2004-playbook-standard.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/stig/site.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/eval/site.yml"
  end
end
