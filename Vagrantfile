# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|
    
    config.ssh.forward_agent
    
    config.vm.define :dockerfiles_image_builder do |cfg|
        cfg.vm.provision :puppet do |puppet|
            puppet.module_path = [ "manifests" ]
        end
    end
    
    config.vm.provider :virtualbox do |v, override|
        override.vm.box = 'precise64'
        override.vm.box_url = 'http://files.vagrantup.com/precise64.box'
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        v.customize ["modifyvm", :id, "--memory", 4096]
        v.customize ["modifyvm", :id, "--cpus", 4]
        v.customize ["modifyvm", :id, "--hwvirtex", "on"]
        v.customize ["modifyvm", :id, "--nestedpaging", "on"]
    end
    
end
