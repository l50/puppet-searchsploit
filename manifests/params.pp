class searchsploit::params {
  case $::osfamily {
    'Debian': {
      $install_location='/opt/exploit-database'
      $symlink_location='/usr/bin/searchsploit'
      $auto_update=true
    }
    default: {
      fail("Unsupported OS family: ${::osfamily}")
    }
  }
}