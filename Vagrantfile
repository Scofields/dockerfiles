# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|
    
    config.ssh.forward_agent
    
    config.vm.define :dockerfiles_image_builder do |cfg|
        cfg.vm.provision :puppet do |puppet|
            puppet.module_path = [ "manifests" ]
        end
    end
    
    config.vm.provider :virtualbox do |v, config|
        config.vm.box                          = 'trusty64'
        config.vm.box_url                      = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
        
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        v.customize ["modifyvm",     :id, "--memory", 2048]
        v.customize ["modifyvm",     :id, "--cpus", 4]
        v.customize ["modifyvm",     :id, "--hwvirtex", "on"]
        v.customize ["modifyvm",     :id, "--nestedpaging", "on"]
    end
    
end
