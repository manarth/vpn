# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant::Config.run do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"


  config.vm.host_name = "vm-vpn"
  # Provide an interface for connections over the LAN.
  # Use a static MAC, so it retains the IP address over repeated builds.
  config.vm.network :bridged, :bridge => "en0: Wi-Fi (AirPort)", :mac => "08002771bb17"
  config.ssh.forward_agent = true

  # Configure puppet.
  box_path = File.expand_path(__FILE__ + '/..')
  puppet_path = box_path + '/puppet';
  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "base.pp"
    puppet.manifests_path = puppet_path + "/manifests"
    puppet.module_path    = [ puppet_path + "/modules" ]
  end
end
