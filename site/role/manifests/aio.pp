class role::aio {

  # This role includes all possible profiles
  include network_example::cisco_ios::banner
  include network_example::cisco_ios::network_vlan
  include network_example::cisco_ios::ntp_server
  include network_example::cisco_ios::tacacs_server

}
