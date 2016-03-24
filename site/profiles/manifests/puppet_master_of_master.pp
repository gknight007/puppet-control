
class profiles::puppet_master_of_master(
){
  class { 'r10k':
    remote => 'https://github.com/gknight007/puppet-control.git',
  }

  package { 'puppetserver':
    ensure => latest,
  }

  service { ['puppet', 'puppetserver']:
    ensure => running,
  }


  cron { 'r10k-deploy':
    command => 'r10k deploy environment -pv',
    user => 'root',
    minute => '*/10',
  }
}
