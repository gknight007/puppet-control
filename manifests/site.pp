

notify { "Role => roles::${::role}": }

if $role_path != '' {
  class { "roles::${::role}": }
}

include roles::base
