# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|
    
    config.ssh.forward_agent
    
    config.vm.define :dockerfiles_image_builder do |cfg|
        cfg.vm.provision :puppet do |puppet|
            puppet.module_path = [ "manifests" ]
        end
    end
    
    config.vm.synced_folder "~/vagrant-tmp", "/home/vagrant/shared/"
    
    config.vm.provider :virtualbox do |v, config|
        config.vm.box                          = 'trusty64'
        config.vm.box_url                      = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
        
        config.persistent_storage.enabled      = true
        config.persistent_storage.location     = "/home/user/vagrant-tmp/dockerfiles/docker.vdi"
        config.persistent_storage.size         = 131072
        config.persistent_storage.mountname    = 'docker'
        config.persistent_storage.filesystem   = 'ext4'
        config.persistent_storage.mountpoint   = '/var/lib/docker/'
        config.persistent_storage.mountoptions = ['defaults', 'noatime', 'nodiratime', 'relatime']
        
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        v.customize ["modifyvm",     :id, "--memory", 4096]
        v.customize ["modifyvm",     :id, "--cpus", 4]
        v.customize ["modifyvm",     :id, "--hwvirtex", "on"]
        v.customize ["modifyvm",     :id, "--nestedpaging", "on"]
        v.customize ["storagectl",   :id, "--name", "SATAController", "--hostiocache", "off"]
    end
    
end
