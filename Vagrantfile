# Vagrant Configuration
Vagrant.configure(2) do |config|
    # Vagrant Box
    config.vm.box = "ubuntu/trusty64"

    # Host Settings
    config.vm.hostname = "u64-lamp"

    # Network Configuration
    config.vm.network "forwarded_port", guest: 80, host: 8080

    # Additional Synced Folders
    # config.vm.synced_folder "src/", "/srv/website"

    # VirtualBox Configuration
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
        vb.name = "u64-lamp"
    end

    # Puppet Provisioning
    config.vm.provision "shell", path: "vm/bootstrap.sh"

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "vm/manifests"
        puppet.manifest_file = "default.pp"
        puppet.module_path = ["vm/puppet_modules"]
        puppet.options = '--hiera_config=/vagrant/vm/hiera.yaml'
    end
end
