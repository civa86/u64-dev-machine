require "yaml"

current_dir    = File.dirname(File.expand_path(__FILE__))
params         = YAML.load_file("#{current_dir}/config.yaml")

# Vagrant Configuration
Vagrant.configure(2) do |config|
    # Vagrant Box
    config.vm.box = "ubuntu/trusty64"

    # Hostname
    config.vm.hostname = params["vm"]["hostname"]

    # Network Configuration:
    ### Forwarded Port
        if params["vm"]["network"]["type"] == "forwarded_port"
            for i in params["vm"]["network"]["ports"] do
                config.vm.network "forwarded_port", guest: i["guest"], host: i["host"], auto_correct: i["auto_correct"]
            end
        end

    ### Private Network
        if params["vm"]["network"]["type"] == "private_network"
            config.vm.network "private_network", ip: params["vm"]["network"]["ip"]
        end

    # Synced Folders
    # config.vm.synced_folder "src/", "/srv/website"

    # VirtualBox Configuration
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
        vb.name = "u64-lamp"
    end

    # Shell Pre - Provisioning
    config.vm.provision "shell", path: "vm/bootstrap.sh"

    # Puppet Provisioning
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "vm/manifests"
        puppet.manifest_file = "default.pp"
        puppet.module_path = ["vm/puppet_modules"]
        puppet.options = "--hiera_config=/vagrant/vm/hiera.yaml"
    end
end
