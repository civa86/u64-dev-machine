class phpmyadmin {
  package { 'phpmyadmin' :
    ensure => installed,
    require => Package['apache2', 'php5', 'mysql-server'],
    notify => File['/etc/apache2/conf-available/phpmyadmin.conf']
  }

  file { '/etc/apache2/conf-available/phpmyadmin.conf':
    ensure => 'link',
    target => '/etc/phpmyadmin/apache.conf',
    notify => File['/etc/apache2/conf-enabled/phpmyadmin.conf']
  }

  file { '/etc/apache2/conf-enabled/phpmyadmin.conf':
    ensure => 'link',
    target => '../conf-available/phpmyadmin.conf',
    notify => Service['apache2']
  }
}
