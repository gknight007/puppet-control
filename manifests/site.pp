


if $::role and $::role != ''  {
  notify { "Role => roles::${::role}": }
  class { "roles::${::role}": }
}

include roles::base

