class profile::device_manager (
  Hash $defaults = lookup('profile::device_manager::defaults'),
  Hash $devices = lookup('profile::device_manager::devices'),
) {

  $devices.each |$device, $parameters| {
    # Only manage devices that are configured for this node
    if $parameters[proxy] == $trusted['certname'] {
      # Look for node specific values, otherwise find default
      $type = $parameters['type'] ? {
        /(.*)/  => "${0}",
        default => $defaults['type'],
      }
      $username = $parameters['username'] ? {
        /(.*)/  => "${0}",
        default => $defaults['username'],
      }
      $password = $parameters['password'] ? {
        /(.*)/  => "${0}",
        default => $defaults['password'],
      }
      $enable_password = $parameters['enable_password'] ? {
        /(.*)/  => "${0}",
        default => $defaults['enable_password'],
      }

      # Here is the actual resource
      device_manager { $device:
        type        => $type,
        credentials => {
          address         => $parameters[address],
          username        => $username,
          password        => $password,
          enable_password => $enable_password,
        },
      }
    }
  }
}
