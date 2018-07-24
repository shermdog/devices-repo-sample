class role::aio {

  # This role includes all possible profiles
  include profile::banner
  include profile::network_vlan
  include profile::ntp_server

}
