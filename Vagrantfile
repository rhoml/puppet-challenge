# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  config.vm.network "forwarded_port", guest: 80, host: 8000

  config.vm.provision 'puppet' do |puppet|
    puppet.working_directory = '/tmp/vagrant-puppet'
    puppet.hiera_config_path = 'hiera.yaml'
    puppet.environment = 'all'
    puppet.environment_path = 'environments'
  end
end
