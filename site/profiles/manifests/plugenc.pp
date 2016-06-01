
class profiles::plugenc (
){
  include apache
  include apache::mod::passenger

  $encWwwDir = '/var/www/enc-api'

  package { [[
    'mod_passenger',
    'passenger',
    'ruby',
    'ruby-devel',
    'sqlite-devel',
    ]]:
    ensure => latest,
  }


  apache::vhost { $::fqdn :
    port => 80,
    docroot => $encWwwDir,
    custom_fragment => "PassengerAppRoot ${encWwwDir}",
    options => ['-Multiview'],
    override => ['all'],
  }



  file { $encWwwDir :
    ensure => directory,
  }

  file { [["${encWwwDir}/public", "${encWwwDir}/tmp"]] :
    ensure => directory,
    require => File[$encWwwDir],
  }

  file { "${encWwwDir}/config.ru" :
    content => "require 'plugenc'\nrun PlugEncApi",
    require => File[$encWwwDir],
  }

}
