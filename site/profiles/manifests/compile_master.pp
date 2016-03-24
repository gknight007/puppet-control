

class profiles::compile_master(
){
  class { 'r10k':
    remote => 'https://github.com/gknight007/puppet-control.git',
  }

  package { 'puppetserver':
    ensure => latest,
  }


  file { '/etc/puppetlabs/puppetserver/conf.d/webserver.conf':
    require => Package['puppetserver'],
    notify  => Service['puppetserver'],
    content => template('profiles/puppetserver-webserver.conf.erb'),
  }

  file { '/etc/puppetlabs/puppetserver/bootstrap.cfg':
    require => Package['puppetserver'],
    notify  => Service['puppetserver'],
    source  => 'puppet:///modules/profiles/ca-disabled-puppetserver-bootstrap.cfg',
  }

  service { ['puppet', 'puppetserver']:
    ensure => running,
  }

  cron { 'r10k-deploy':
    command => 'r10k deploy environment -pv',
    user    => 'root',
    minute  => '*/10',
  }

}
