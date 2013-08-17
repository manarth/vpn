# -*- mode: puppet -*-
# vi: set ft=puppet :

class sysctl() {
  $append = template('sysctl/sysctl.conf.erb')

  exec { "append /etc/sysctl.conf":
    command => "echo '$append' | cat >> /etc/sysctl.conf",
    unless => "grep -Fx 'net.ipv4.ip_forward=1' /etc/sysctl.conf",
  }

  exec { "reparse sysctl":
    command => "sysctl -p",
    require => Exec['append /etc/sysctl.conf'],
    path => ['/sbin',],
  }
}
