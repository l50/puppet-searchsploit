# Class: searchsploit
# ===========================
#
# Used to install the searchsploit tool on Kali.
#
# Parameters
# ----------
#
# * `install_location`
# The directory where you want to install searchsploit
#
# * `symlink_location`
# The directory where you want to symlink the searchsploit bin
#
# * `auto_update`
# Set cronjob to check for updates every 30 minutes
#
# Requirements
# --------
#
# puppetlabs-vcsrepo - https://github.com/puppetlabs/puppetlabs-vcsrepo
#
# Examples
# --------
#
#    class { 'searchsploit':
#      install_location => '/opt/searchsploit',
#      symlink_location => '/usr/bin/searchsploit',
#      auto_update      =>  true
#    }
#
# Authors
# -------
#
# Jayson Grace (l50) <jayson.e.grace@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2017 Jayson Grace (l50)
#
class searchsploit(
  $install_location=$searchsploit::params::install_location,
  $symlink_location=$searchsploit::params::symlink_location,
  $auto_update=$searchsploit::params::auto_update,
) inherits searchsploit::params {

  vcsrepo { $install_location:
    ensure   => present,
    provider => git,
    source   => 'git://github.com/offensive-security/exploit-database.git',
  } ->

  file { $symlink_location:
    ensure => 'link',
    target => "${install_location}/searchsploit",
  }

  if $auto_update {
    cron { 'update_searchsploit':
      ensure  => present,
      command => 'searchsploit -u',
      user    => root,
      minute  => '*/30',
    }
  }
}
