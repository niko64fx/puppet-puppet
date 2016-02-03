class puppet::config_master (
  $config_file_path     = $puppet::config_file_path,
  $config_file_name     = $puppet::config_file_name,
  $brsnoop              = $puppet::brsnoop,
) inherits puppet {

  concat::fragment { 'puppet.conf [master] section':
    target  => "${config_file_path}/${config_file_name}",
    content => template('puppet/puppet_conf_master.erb'),
    order   => '03'
  }

}
