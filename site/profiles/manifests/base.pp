

class profiles::base {

  class { '::ntp':
    servers => ['time.nist.gov', 'pool.ntp.org'],
  }

  class { '::r10k':
    remote => hiera('r10k::remote'),
  }

  class { 'hiera':
    hierarchy => [
      'hosts/%{::fqdn}',
      'environment/%{environment}',
      'module/%{calling_module}',
      'defaults',
    ],
    datadir        => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
    datadir_manage => false,
    master_service => 'puppetserver',
    owner          => 'root',
    group          => 'root',
  }


}
