

class profiles::admin_tools {

  package {[
    'nmap',
    'bind-utils',
    'strace',
    'ethtool',
    'wget'
  ]:
    ensure => latest,
  }

}
