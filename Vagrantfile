# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Allow symlinks in synced folders
  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "ubuntu/trusty64"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
  end

  # Create Vamp gateway Nodes for North-South traffic
  (1..1).each do |i|
    config.vm.define "ext-vga-int-#{i}" do |vga_node|
        vga_node.vm.box = "ubuntu/trusty64"
        vga_node.vm.hostname = "ext-vga-int-#{i}"
        vga_node.vm.network :private_network, ip: "10.0.15.11"
        vga_node.vm.provider "virtualbox" do |vb|
          vb.memory = "1024"
        end
    end
  end

  # Mesos Masters
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..1).each do |i|
    config.vm.define "mesos-master-#{i}" do |master_node|
        master_node.vm.box = "ubuntu/trusty64"
        master_node.vm.hostname = "mesos-master-#{i}"
        master_node.vm.network :private_network, ip: "10.0.15.10#{i}"
        master_node.vm.provider "virtualbox" do |vb|
          vb.memory = "2048"
        end
    end
  end

  # Mesos Slaves
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..2).each do |i|
    config.vm.define "mesos-agent-#{i}" do |agent_node|
        agent_node.vm.box = "ubuntu/trusty64"
        agent_node.vm.hostname = "mesos-agent-#{i}"
        agent_node.vm.network :private_network, ip: "10.0.15.20#{i}"
        agent_node.vm.provider "virtualbox" do |vb|
          vb.memory = "4096"
          vb.cpus = "2"
        end
    end
  end


end
