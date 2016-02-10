class puppet::install (
  $package_name_agent    = $puppet::package_name_agent,
  $package_ensure_agent  = $puppet::package_ensure_agent,
  $package_name_server   = $puppet::package_name_server,
  $package_ensure_server = $puppet::package_ensure_server,
  $if_noop               = $puppet::if_noop,
) inherits puppet {

  package { $package_name_agent:
    ensure => $package_ensure_agent,
    noop   => $if_noop,
  }

  if $::hostgroup == 'puppet_master' {
    package { $package_name_server:
      ensure => $package_ensure_server,
      noop   => $if_noop,
    }
  }

}
