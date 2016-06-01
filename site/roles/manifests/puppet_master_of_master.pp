

class roles::puppet_master_of_master {
  include profiles::puppet_master_of_master
  include profiles::base
  include profiles::plugenc
}
