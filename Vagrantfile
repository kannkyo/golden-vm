# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = false

  config.vagrant.plugins = [
    "vagrant-disksize",
    "vagrant-vbguest"
  ]

  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-focal64"
    vb.gui = false
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/base/site.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/ctf/site.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook/stig/site.yml"
  end
end
