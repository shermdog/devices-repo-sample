class profile::device_manager (
  Hash $devices,
  # Optional default values
  Hash $defaults = {},
) {

  $devices.each |$device, $parameters| {
    # Only manage devices that are configured for this node
    if $parameters[proxy] == $trusted['certname'] {
      # Here is the actual resource
      device_manager { $device:
        # Look for node specific values, otherwise find default
        type        => devices_repo_sample::string_or_default('type', $parameters, $defaults),
        credentials => {
          address         => $parameters[address],
          username        => devices_repo_sample::string_or_default('username', $parameters, $defaults),
          password        => devices_repo_sample::string_or_default('password', $parameters, $defaults),
          enable_password => devices_repo_sample::string_or_default('enable_password', $parameters, $defaults),
        },
      }
    }
  }
}
