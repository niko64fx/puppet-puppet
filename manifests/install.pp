class puppet::install (
  $package_name_agent    = $puppet::package_name_agent,
  $package_ensure_agent  = $puppet::package_ensure_agent,
  $package_name_server   = $puppet::package_name_server,
  $package_ensure_server = $puppet::package_ensure_server,
  $brsnoop               = $puppet::brsnoop,
) inherits puppet {

  package { $package_name_agent:
    ensure => $package_ensure_agent,
    noop   => $brsnoop,
  }

  if $::hostgroup == 'puppet_master' {
    package { $package_name_server:
      ensure => $package_ensure_server,
      noop   => $brsnoop,
    }
  }

}
