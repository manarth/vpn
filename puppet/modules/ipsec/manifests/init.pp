# -*- mode: puppet -*-
# vi: set ft=puppet :

# Use CIDR range 172.16.55.0/24
define ipsec($server_ip, $server_gw_ip) {

  # Pass in @server_ip.
  file {'/etc/ipsec.secrets': 
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => Package[openswan],
    content => template('ipsec/ipsec.secrets.erb'),
    notify  => Service[ipsec]
  }

  # Create ipsec.conf
  file {'/etc/ipsec.conf': 
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[openswan],
    content => template('ipsec/ipsec.conf.erb'),
    notify  => Service[ipsec]
  }
}
