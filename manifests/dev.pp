class grafanadash::dev() {
  # hack; there is probably a module for this
  exec { '/usr/sbin/setenforce 0': }

  # this is stupid, for anything other than dev
  service { 'iptables':
    ensure => 'stopped',
  }

  package { 'cronie':
    ensure => present,
  } ->

  class { 'graphite':
     gr_web_cors_allow_from_all => true,
  } ->

  tp::install { 'elasticsearch': }

  class { 'grafanadash::grafana':
    graphite_host      => $::graphite::gr_web_servername,
    graphite_port      => $::graphite::gr_apache_port,
    elasticsearch_host => $::fqdn,
    grafana_host       => $::fqdn,
  } ->

  # super hacky but for some reason the graphite database is coming up
  # as locked until we restart apache?
  exec { '/bin/sleep 10': } ->

  exec { '/sbin/service httpd restart': }
}

