# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# USERS
class { 'users': }

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# APT
class { 'apt': }

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# TIMEZONE
class { 'timezone':
  timezone => 'Europe/Rome',
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# SYSTEM PACKAGES
class { 'syspackage':
  sys_packages => ['build-essential', 'git', 'curl', 'nodejs', 'npm']
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# NODE JS MODULES AND CONFIG
class { 'nodeglobal':
  node_modules => ['grunt-cli']
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# PHP
class { 'php':
  require => Exec['apt-update']
}

## php modules
php::module { 'curl': }
php::module { 'json': }
php::module { 'mcrypt': }
php::module { 'mysql': }
php::module { 'gd': }

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# APACHE WEBSERVER
class { 'apache':
  default_mods  => true,
  default_vhost => false,
  mpm_module    => 'prefork',
  confd_dir     => '/etc/apache2/conf-enabled',
  require       => Exec['apt-update']
}

## phpinfo test file
file { '/var/www/html/phpinfo.php':
  ensure  => present,
  owner   => root,
  group   => root,
  mode    => 644,
  content => '<?php echo phpinfo(); ?>',
  require => Package['apache2', 'php5']
}

## virtual hosts
apache::vhost { 'localhost':
  port          => '80',
  docroot       => '/vagrant',
  docroot_owner => 'vagrant',
  docroot_group => 'vagrant',
  aliases       => [
    {
      aliasmatch => '/phpinfo',
      path       => '/var/www/html/phpinfo.php',
    }
  ],
  directories   => [
    {
      path           => '/vagrant',
      allow_override => ['All'],
    }
  ]
}

## apache modules
include apache::mod::php
include apache::mod::rewrite
include apache::mod::proxy
include apache::mod::vhost_alias

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# MYSQL
class { '::mysql::server':
  root_password           => 'root',
  require                 => Exec['apt-update']
}

#mysql::db { 'my-db':
#  user     => 'db-user',
#  password => 'db-pass',
#  host     => 'localhost',
#  grant    => ['ALL']
#}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# PHPMYADMIN
class { 'phpmyadmin' : }

