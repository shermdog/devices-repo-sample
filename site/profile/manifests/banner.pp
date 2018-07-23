class profile::banner (
  String $motd   = 'Managed by Puppet'
) {

  banner { 'default':
    motd => $motd,
  }

}