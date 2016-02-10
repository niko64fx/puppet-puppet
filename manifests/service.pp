class puppet::service (
  $service_name_agent   = $puppet::service_name_agent,
  $service_ensure_agent = $puppet::service_ensure_agent,
  $service_enable_agent = $puppet::service_enable_agent,
  $if_noop              = $puppet::if_noop,
) inherits puppet {

  service { $service_name_agent:
    ensure => $service_ensure_agent,
    enable => $service_enable_agent,
    noop   => $if_noop,
  }

}
