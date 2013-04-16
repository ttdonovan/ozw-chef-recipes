# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'squeeze64-ruby193'
  config.vm.box_url = 'http://packages.diluvia.net/squeeze64-ruby193.box'

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing 'localhost:8080' will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: '192.168.33.10'

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder '../data', '/vagrant_data'
  config.vm.synced_folder './cookbooks', '/cookbooks'

  config.vm.provision :shell, :path => 'bootstrap.sh'

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = '../my-recipes/cookbooks'
  #   chef.roles_path = '../my-recipes/roles'
  #   chef.data_bags_path = '../my-recipes/data_bags'
  #   chef.add_recipe 'mysql'
  #   chef.add_role 'web'
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => 'foo' }
  # end
end
