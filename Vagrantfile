# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = false
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-focal64"
    vb.gui = false
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.provision "file", source: "./playbook/", destination: "/home/vagrant/"

  config.vm.provision "shell", inline: <<-SHELL
    # Install ansible
    apt-get install --no-install-recommends -y software-properties-common
    apt-add-repository --yes --update ppa:ansible/ansible
    apt-get install --no-install-recommends -y ansible

    # Provisioning by ansible
    ansible-playbook -v -b -i /dev/null /home/vagrant/playbook/site.yml; exit 0
  SHELL
end
