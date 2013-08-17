# -*- mode: puppet -*-
# vi: set ft=puppet :

define xl2tpd($server_ip) {

  # Begin by populating the conf file (included within /etc/xl2tpd/xl2tpd.conf).
  file {'/etc/ppp/options.xl2tpd':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[xl2tpd],
    content => template('xl2tpd/etc/ppp/options.xl2tpd.erb'),
  }

  # Create /etc/ppp/chap-secrets
  file {'/etc/ppp/chap-secrets':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[xl2tpd],
    content => template('xl2tpd/etc/ppp/chap-secrets.erb'),
    notify  => Service[xl2tpd],
  }



  # # Create the XL2TPD secrets.
  # file {'/etc/xl2tpd/l2tp-secrets':
  #   owner   => 'root',
  #   group   => 'root',
  #   mode    => '0644',
  #   require => Package[xl2tpd],
  #   content => template('xl2tpd/etc/xl2tpd/l2tp-secrets.erb'),
  # }

  # /etc/xl2tpd/xl2tpd.conf
  file {'/etc/xl2tpd/xl2tpd.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[xl2tpd],
    content => template('xl2tpd/etc/xl2tpd/xl2tpd.conf.erb'),
    notify  => Service[xl2tpd],
  }


}
