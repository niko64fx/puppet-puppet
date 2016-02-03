class puppet::config (
  $config_file_path     = $puppet::config_file_path,
  $config_file_name     = $puppet::config_file_name,
  $config_puppet_server = $puppet::config_puppet_server,
  $config_runinterval   = $puppet::config_runinterval,
  $config_noop          = $puppet::config_noop,
  $brsnoop              = $puppet::brsnoop,
) inherits puppet {

  # We create the puppet.conf target
  concat { "${config_file_path}/${config_file_name}":
    ensure => present,
  }

  concat::fragment { 'puppet.conf header':
    target  => "${config_file_path}/${config_file_name}",
    content => "################################################\n#### THIS FILE HAS BEEN GENERATED BY PUPPET ####\n################################################\n",
    order   => '01'
  }

  concat::fragment { 'puppet.conf [main] section':
    target  => "${config_file_path}/${config_file_name}",
    content => template('puppet/puppet_conf_main.erb'),
    order   => '02'
  }

  concat::fragment { 'puppet.conf [agent] section':
    target  => "${config_file_path}/${config_file_name}",
    content => template('puppet/puppet_conf_agent.erb'),
    order   => '04'
  }

  if $::operatingsystem == 'Debian' {
    augeas { 'enable puppet agent service management on Debian':
      changes => [ 'set /files/etc/default/puppet/START "yes"' ],
      noop    => $brsnoop,
    }
  }

}
