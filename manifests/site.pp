

$role_path = get_module_path("roles::${role}")

notify { "Role path = ${role_path}": }

if $role_path != '' {
  class { "roles::${::role}": }
}
