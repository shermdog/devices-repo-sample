class profile::ntp_server (
  Hash $servers = {},
) {

  $servers.each |$server, $parameters| {
    ntp_server { $server:
      ensure           => $parameters[ensure],
      key              => $parameters[key],
      minpoll          => $parameters[minpoll],
      maxpoll          => $parameters[maxpoll],
      prefer           => $parameters[prefer],
      source_interface => $parameters[source_interface],
      vrf              => $parameters[vrf],
    }
  }
}
