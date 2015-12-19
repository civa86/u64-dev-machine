class syspackage ($sys_packages = []) {
  package { $sys_packages:
    ensure => installed,
    require => Exec['apt-update'],
  }
}
