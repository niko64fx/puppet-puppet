class puppet (
  $package_name_agent    = 'puppet',
  $package_ensure_agent  = undef,
  $package_name_server   = undef,
  $package_ensure_server = undef,
  $puppet_environment    = undef,
  $config_file_path      = '/etc/puppet',
  $config_file_name      = 'puppet.conf',
  $config_puppet_server  = undef,
  $config_runinterval    = '7200',
  $config_noop           = true,
  $service_name_agent    = 'puppet',
  $service_ensure_agent  = running,
  $service_enable_agent  = true,
  $if_noop               = $::clientnoop,
) {

  class { '::puppet::install': } ->
  class { '::puppet::config': } ~>
  class { '::puppet::service': } ->
  Class['::puppet']

}
