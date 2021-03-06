# class grafanadash::grafana
#
# installs grafana
#
class grafanadash::grafana (
  $version            = $grafanadash::grafana::params::version,
  $download_url       = $grafanadash::grafana::params::download_url,
  $install_dir        = $grafanadash::grafana::params::install_dir,
  $symlink            = $grafanadash::grafana::params::symlink,
  $symlink_name       = $grafanadash::grafana::params::symlink_name,
  $user               = $grafanadash::grafana::params::user,
  $group              = $grafanadash::grafana::params::group,
  $graphite_host      = $grafanadash::grafana::params::graphite_host,
  $graphite_port      = $grafanadash::grafana::params::graphite_port,
  $elasticsearch_host = $grafanadash::grafana::params::elasticsearch_host,
  $elasticsearch_port = $grafanadash::grafana::params::elasticsearch_port,
  $grafana_host       = $grafanadash::grafana::params::grafana_host,
  $grafana_port       = $grafanadash::grafana::params::grafana_port,
) inherits grafanadash::grafana::params {
  archive { "/tmp/grafana-${version}.tar.gz":
    ensure       => present,
    extract      => true,
    source       => $download_url,
    extract_path => $install_dir,
  }

  file { "${install_dir}/grafana-${version}/config.js":
    ensure  => file,
    content => template('grafanadash/opt/grafana/config.js.erb'),
    owner   => $user,
    group   => $group,
    require => Archive["/tmp/grafana-${version}.tar.gz"],
  }

  file { $symlink_name:
    ensure  => link,
    target  => "${install_dir}/grafana-${version}",
    require => Archive["/tmp/grafana-${version}.tar.gz"],
  }

  file { "${::graphite::params::apacheconf_dir}/grafana.conf":
    ensure  => file,
    owner   => $::grafanadash::grafana::params::user,
    group   => $::grafanadash::grafana::params::group,
    mode    => '0644',
    content => template('grafanadash/etc/apache2/sites-available/grafana.conf.erb'),
    notify  => Service[$::graphite::params::apache_service_name],
  }
}

