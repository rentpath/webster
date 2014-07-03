# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_url = "https://s3.amazonaws.com/operations.primedia/vagrant/rentpath.box"

  config.vm.provider :virtualbox do |vb|
    vb.gui = false

    vb.customize ["modifyvm", :id, "--memory", "2024"]
  end

  config.vm.provision "shell", path: "bin/centos_6_x.sh"

  config.vm.define "primary" do |primary|
    primary.vm.hostname = 'centos64.rentpath.local'

    primary.vm.network :public_network,
                       :bridge => 'en0: Wi-Fi (AirPort)',
                       ip: '192.168.1.64'
    primary.vm.box = "rentpath"
    primary.vm.network "forwarded_port", guest: 80, host: 8090

  end
end
