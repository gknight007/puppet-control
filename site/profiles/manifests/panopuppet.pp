


class profiles::panopuppet {


#include panopuppet
#Changed to use $puppetdb_url , which should be set outside of manifest for testing!
  class { 'panopuppet':
    puppetdb_url => $puppetdb_url,
  }

}
