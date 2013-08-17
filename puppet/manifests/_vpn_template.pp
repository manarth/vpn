# -*- mode: puppet -*-
# vi: set ft=puppet :

###
# Template for an VPN for iDevices box.
###
node vpn_template {

  ###
  # Sensible utilities.
  ###
  package { 'curl': }
  package { 'unzip': }
  package { 'vim': }
  package { 'vim-puppet': }
  package { 'git-core': }
  package { 'subversion': }
  package { 'gcc': }
  package { 'make': }

  # Add avahi to make it easy to find the VM on the local network.
  package { 'avahi-daemon': }

  # Improve the PS1 prompt.
  ps1 { 'vagrant':
    prompt => '\e[0;31m\u\e[m@\e[0;33m\h\e[m:\W$ ',
    user => 'vagrant'
  }

  # Address IP forwarding and redirects in /etc/sysctl.conf.
  class { 'sysctl' : }

  # Provide IP routing via iptables.
  exec { 'iptables --table nat --append POSTROUTING --jump MASQUERADE':
    command => 'iptables --table nat --append POSTROUTING --jump MASQUERADE',
    path => '/sbin',
  }

  package { 'openswan': }
  package { 'xl2tpd': }
  ipsec { 'ipsec':
    server_ip => '192.168.0.198',
    server_gw_ip => '10.0.2.2',
  }
  xl2tpd { 'xl2tpd':
    server_ip => '192.168.0.198',
  }


  service { 'ipsec':
    require => Package['openswan'],
  }
  service { 'xl2tpd':
    require => Package['xl2tpd'],
  }

}

