# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # see https://app.vagrantup.com/ubuntu/boxes/focal64
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20221115.1.0"
  config.vm.box_check_update = false

  # Automaticaly install plugins to local project
  config.vagrant.plugins = [
    "vagrant-disksize",
    "vagrant-vbguest"
  ]

  # Use Virtualbox's bridge adopter
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-focal64"
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

  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "playbook/ssg/site.yml"
  # end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/stig/site.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/eval/site.yml"
  end
end
