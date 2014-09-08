# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant and puppet configuration generated with geppetto version 0.2.2.
# Site: http://geppetto.herokuapp.com/
# Code: https://github.com/atongen/geppetto



VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # virtualbox provider
  config.vm.provider :virtualbox do |vb, override|
    vb.customize ["modifyvm", :id, "--memory", "1024"]

    override.vm.box = "boilerplate"
    override.vm.box_url  = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

    override.vm.hostname = "boilerplate"
    override.vm.network :forwarded_port, guest: 5000, host: 5000
    override.vm.network :forwarded_port, guest: 80, host: 8080
    override.ssh.forward_agent = true
  end

  # Setup librarian-puppet
  # uses default puppet module path of /etc/puppet
  config.vm.provision :shell, path: "puppet/shell/main.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.options = "--hiera_config /vagrant/hiera.yaml"
  end
end
