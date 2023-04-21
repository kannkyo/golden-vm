# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # load .env file
  config.env.enable

  # see https://app.vagrantup.com/ubuntu/boxes/focal64
  config.vm.box = ENV['BOX_NAME']
  config.vm.box_version = ENV['BOX_VERSION']
  config.vm.box_check_update = false

  # Automaticaly install plugins to local project
  config.vagrant.plugins = [
    "vagrant-env",
    "vagrant-disksize",
    "vagrant-vbguest"
  ]


  config.vm.provider "virtualbox" do |vb|
    vb.name = ENV['VM_NAME']
    vb.gui = false
    vb.cpus = 4
    vb.memory = 4096
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/base/site.yml"
  end

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
