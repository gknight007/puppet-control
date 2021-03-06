


class profiles::panopuppet {

$static_root = '/var/www/panopuppet/staticfiles'
$wsgi_dir = '/var/www/panopuppet'
$wsgi_thread_count = 5

#include panopuppet
  include panopuppet
  #include apache
  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'panopuppet':
      docroot             => $static_root,
      port                => 80,
      wsgi_script_aliases => { '/' => "${wsgi_dir}/wsgi.py" },
      wsgi_daemon_process => "panopuppet",

      wsgi_daemon_process_options => {
        threads => $wsgi_thread_count,
        python-path => '/usr/lib/python3.4/site-packages',
      },

      aliases => [{
        alias => '/static',
        path  => $static_root,
      }],

      directories => [{
        'path'    => $static_root,
        'require' => 'all granted',
      }],
  }


}
