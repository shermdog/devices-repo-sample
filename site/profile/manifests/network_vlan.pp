class profile::network_vlan (
  Hash $vlans = {},
) {

  $vlans.each |$vlan, $parameters| {
    network_vlan { $vlan:
      ensure    => $parameters[ensure],
      shutdown  => $parameters[shutdown],
      vlan_name => $parameters[vlan_name],
    }
  }

}