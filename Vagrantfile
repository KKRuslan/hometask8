Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.vm.network "forwarded_port", guest: 80, host: 8888, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 8443, host_ip: "127.0.0.1"

  config.vm.synced_folder "www-content/", "/home/vagrant/www-content/", type: "rsync"

  config.vm.provision "shell", path: "script.sh"
end